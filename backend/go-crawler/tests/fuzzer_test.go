package main

import (
    "testing"
)

// Test if Fuzz function processes a payload correctly
func TestFuzz(t *testing.T) {
    mockURL := "https://example.com"
    err := Fuzz(mockURL)
    if err != nil {
        t.Errorf("Fuzz failed for URL %s, got error: %v", mockURL, err)
    }
}
