package main

import (
	"bufio"
	"bytes"
	"context"
	"flag"
	"fmt"
	"io"
	"log"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"sync"

	"github.com/fatih/color"
)

var (
	dirColor  = color.New(color.FgBlue, color.Bold).SprintFunc()
	fileColor = color.New(color.FgWhite).SprintFunc()
	statColor = color.New(color.FgCyan).SprintFunc()
)

type Stats struct {
	lines       int
	files       int
	directories int
	sync.Mutex
}

func (s *Stats) AddLines(n int) {
	s.Lock()
	s.lines += n
	s.Unlock()
}

func (s *Stats) AddFiles() {
	s.Lock()
	s.files++
	s.Unlock()
}

func (s *Stats) AddDirectories() {
	s.Lock()
	s.directories++
	s.Unlock()
}

func totalcountLines(ctx context.Context, ch chan string, stats *Stats, wg *sync.WaitGroup) {
	workerCount := 10
	var innerWg sync.WaitGroup

	for i := 0; i < workerCount; i++ {
		innerWg.Add(1)
		go func() {
			defer innerWg.Done()
			for {
				select {
				case fullPath, ok := <-ch:
					if !ok {
						return
					}
					n, err := countLinesEfficient(fullPath)
					if err != nil {
						log.Println(err)
						continue
					}
					stats.AddLines(n)
				case <-ctx.Done():
					return
				}
			}
		}()
	}
	innerWg.Wait()
	wg.Done()
}

func formatSize(bytes int64) string {
	const unit = 1024
	if bytes < unit {
		return fmt.Sprintf("%d B", bytes)
	}
	div, exp := int64(unit), 0
	for n := bytes / unit; n >= unit; n /= unit {
		div *= unit
		exp++
	}
	return fmt.Sprintf("%.1f %cB", float64(bytes)/float64(div), "KMGTPE"[exp])
}

func countLinesEfficient(fullPath string) (int, error) {
	file, err := os.Open(fullPath)
	if err != nil {
		return 0, err
	}
	defer file.Close()

	buf := make([]byte, 32*1024)
	count := 0

	for {
		n, err := file.Read(buf)
		count += bytes.Count(buf[:n], []byte{'\n'})
		if err != nil {
			if err == io.EOF {
				break
			}
			return count, err
		}
	}
	return count, nil
}

func printTree(writer *bufio.Writer, path, prefix string, depth int, showHidden bool, ch chan string, stats *Stats) {
	if depth == 0 {
		return
	}

	entries, err := os.ReadDir(path)
	if err != nil {
		log.Println(err)
		return
	}

	// Сортируем: сначала директории, потом файлы
	sort.Slice(entries, func(i, j int) bool {
		if entries[i].IsDir() == entries[j].IsDir() {
			return entries[i].Name() < entries[j].Name()
		}
		return entries[i].IsDir()
	})

	for i, entry := range entries {
		if !showHidden && strings.HasPrefix(entry.Name(), ".") {
			continue
		}

		isLast := i == len(entries)-1
		name := entry.Name()
		icon := " 📄"
		fullPath := filepath.Join(path, entry.Name())

		var formattedName string

		if entry.IsDir() {
			formattedName = dirColor(name + "/")
			icon = "📂 "
			stats.AddDirectories()
		} else {
			formattedName = fileColor(name)
			info, err := entry.Info()
			if err != nil {
				log.Println(err)
				continue
			}
			stats.AddFiles()
			ch <- fullPath

			sizeStr := color.New(color.FgYellow).SprintFunc()(formatSize(info.Size()))
			formattedName = fmt.Sprintf("%s (%s)", formattedName, sizeStr)
		}

		sep := "├──"
		if isLast {
			sep = "└──"
		}

		writer.WriteString(fmt.Sprintf("%s%s%s%s\n", prefix, sep, icon, formattedName))

		if entry.IsDir() {
			newPrefix := prefix + "│   "
			if isLast {
				newPrefix = prefix + "    "
			}
			printTree(writer, fullPath, newPrefix, depth-1, showHidden, ch, stats)
		}
	}
}

func main() {
	writer := bufio.NewWriter(os.Stdout)
	defer writer.Flush()

	root := "./"
	ch := make(chan string, 100)
	stats := &Stats{}
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	var wg sync.WaitGroup

	showHidden := flag.Bool("hidden", false, "Показывать скрытые файлы")
	maxDepth := flag.Int("depth", -1, "Глубина рекурсии")
	flag.Parse()

	banner := strings.Repeat("═", 50)

	fmt.Fprintln(writer, dirColor("📂 "+root))

	go func() {
		printTree(writer, root, "", *maxDepth, *showHidden, ch, stats)
		close(ch)
	}()

	wg.Add(1)
	go totalcountLines(ctx, ch, stats, &wg)

	wg.Wait()
	writer.Flush()

	fmt.Println(banner)
	fmt.Println(statColor(fmt.Sprintf("All lines: %d", stats.lines)))
	fmt.Println(statColor(fmt.Sprintf("All files: %d", stats.files)))
	fmt.Println(statColor(fmt.Sprintf("All directories: %d", stats.directories)))
	fmt.Println(banner)
}
