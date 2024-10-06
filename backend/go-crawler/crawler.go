package main

import (
    "fmt"
    "net/http"
    "golang.org/x/net/html"
)

// Crawl function recursively crawls a website and gathers URLs
func Crawl(url string) {
    fmt.Println("Crawling URL:", url)
    resp, err := http.Get(url)
    if err != nil {
        fmt.Println("Error fetching URL:", err)
        return
    }
    defer resp.Body.Close()

    doc, err := html.Parse(resp.Body)
    if err != nil {
        fmt.Println("Error parsing HTML:", err)
        return
    }

    // Extract and print links (as a simple example)
    extractLinks(doc)
}

// Extract links from the parsed HTML
func extractLinks(n *html.Node) {
    if n.Type == html.ElementNode && n.Data == "a" {
        for _, attr := range n.Attr {
            if attr.Key == "href" {
                fmt.Println("Found link:", attr.Val)
            }
        }
    }
    for c := n.FirstChild; c != nil; c = c.NextSibling {
        extractLinks(c)
    }
}
