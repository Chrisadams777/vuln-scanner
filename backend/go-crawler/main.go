package main

import (
    "fmt"
    "os"
)

func main() {
    target := os.Args[1]  // URL passed as command line argument
    fmt.Println("Crawling and fuzzing target:", target)
    Crawl(target)
    Fuzz(target)
}
