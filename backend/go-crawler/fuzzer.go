package main

import (
    "fmt"
    "net/http"
    "strings"
)

// Fuzz function tests a URL for vulnerabilities
func Fuzz(target string) {
    payloads := []string{"' OR 1=1 --", "<script>alert('XSS')</script>"}

    for _, payload := range payloads {
        // Example: Append payload to URL
        testURL := target + "?input=" + payload
        resp, err := http.Get(testURL)
        if err != nil {
            fmt.Println("Error with request:", err)
            continue
        }
        defer resp.Body.Close()

        if resp.StatusCode == 200 {
            fmt.Println("Potential vulnerability found with payload:", payload)
        }
    }
}
