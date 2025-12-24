const puppeteer = require('puppeteer');
const path = require('path');

(async () => {
  const browser = await puppeteer.launch({ headless: true });
  const page = await browser.newPage();

  const files = [
    { file: 'landing.html', desktop: { w: 1440, h: 900 }, mobile: { w: 375, h: 812 } },
    { file: 'email.html', desktop: { w: 1440, h: 900 }, mobile: { w: 375, h: 812 } }
  ];

  for (const f of files) {
    const filePath = 'file://' + path.resolve(__dirname, f.file);

    // Desktop
    await page.setViewport({ width: f.desktop.w, height: f.desktop.h });
    await page.goto(filePath, { waitUntil: 'networkidle0' });
    const desktopOut = path.resolve(__dirname, `${path.basename(f.file, '.html')}-desktop.png`);
    await page.screenshot({ path: desktopOut, fullPage: false });
    console.log('Saved', desktopOut);

    // Mobile
    await page.setViewport({ width: f.mobile.w, height: f.mobile.h, isMobile: true });
    await page.goto(filePath, { waitUntil: 'networkidle0' });
    const mobileOut = path.resolve(__dirname, `${path.basename(f.file, '.html')}-mobile.png`);
    await page.screenshot({ path: mobileOut, fullPage: false });
    console.log('Saved', mobileOut);
  }

  await browser.close();
  console.log('Screenshots complete');
})();
