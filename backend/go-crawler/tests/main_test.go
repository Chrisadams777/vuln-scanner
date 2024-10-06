package main

import (
    "testing"
)

// Test if the Crawl function works without errors
func TestCrawl(t *testing.T) {
    mockURL := "https://example.com"
    err := Crawl(mockURL)
    if err != nil {
        t.Errorf("Crawl failed for URL %s, got error: %v", mockURL, err)
    }
}
