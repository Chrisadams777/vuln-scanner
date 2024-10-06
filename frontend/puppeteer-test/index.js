const puppeteer = require('puppeteer');

(async () => {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.goto('http://example.com');  // Replace with target URL
    
    // Example: Test for XSS
    await page.type('#input-field', '<script>alert("XSS")</script>');
    await page.click('#submit-button');
    
    // Check if the alert is triggered
    page.on('dialog', async dialog => {
        console.log('Potential XSS vulnerability detected!');
        await dialog.dismiss();
    });
    
    await browser.close();
})();
