const puppeteer = require('puppeteer');
const { expect } = require('chai');

describe('Puppeteer XSS Test', function() {
    it('should detect potential XSS vulnerability', async function() {
        const browser = await puppeteer.launch();
        const page = await browser.newPage();
        await page.goto('http://example.com');
        await page.type('#input-field', '<script>alert("XSS")</script>');
        await page.click('#submit-button');

        let dialogMessage = null;
        page.on('dialog', async dialog => {
            dialogMessage = dialog.message();
            await dialog.dismiss();
        });

        expect(dialogMessage).to.equal('XSS');
        await browser.close();
    });
});
