# AI-Powered Vulnerability Scanner

This is an AI-powered vulnerability scanner that combines Go for web crawling and fuzzing, Python for AI-based anomaly detection, and Node.js for client-side vulnerability testing using Puppeteer.

## Project Structure

- **backend/go-crawler**: Go-based web crawler and fuzzer.
- **backend/ai-model**: Python-based AI model for anomaly detection.
- **frontend/puppeteer-test**: Node.js Puppeteer script for client-side testing.
- **scripts**: Automation scripts for setup and integration tests.
- **.github**: CI workflow for automated testing with GitHub Actions.

## How to Run

1. **Clone the repository**:
```bash

   git clone https://github.com/Chrisadams777/vuln-scanner.git
   cd vuln-scanner

```

2. **Run setup script**:

```bash

bash scripts/setup.sh

```

3. **Run integration tests**:

```bash

bash scripts/integration_test.sh

```

4. **CI Pipeline**:

```

All tests (Go, Python, Node.js) are automatically run via GitHub Actions.

```



