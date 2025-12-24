# Amazon Clone - Phishing Simulation Project
# Amazon-clone — Phishing Simulation (Training-only)

**Project**
- **Overview:** This repository contains a training-only phishing simulation that reproduces Amazon's marketing design language. The package includes a marketing email (HTML) and a concise landing page for redeeming a reward or discount. The work is intended for design and UX evaluation only and not for malicious use.

**Goal**
- **Purpose:** Build an end-to-end phishing simulation that mimics Amazon’s marketing style and demonstrates email-to-landing-page flow, visual hierarchy, and responsive behavior.

**Deliverables (included in this repo)**
- **Marketing email:** `email.html` — full HTML email that uses images, visual hierarchy, and inline-friendly structure for realistic rendering in mail clients.
- **Landing page:** `landing.html` (and `index.html`) — full HTML/CSS/JS landing page that matches Amazon-like colors, spacing, and typography for a concise reward redemption flow.
- **Assets:** `assets/` — image and icon assets used by both email and landing page.
- **Automation:** `.github/workflows/deploy-pages.yml` — GitHub Actions workflow for deploying the site to GitHub Pages (if enabled).
- **Screenshots:** add screenshots to `screenshots/` (recommended filenames below) showing desktop and mobile breakpoints for both email and landing page:
	- `screenshots/email-desktop.png`
	- `screenshots/email-mobile.png`
	- `screenshots/landing-desktop.png`
	- `screenshots/landing-mobile.png`

**How to view locally**
- Open `email.html` directly in a browser to preview the email layout (use browser devtools to simulate mobile widths).
- Open `landing.html` (or `index.html`) in a browser to view the landing page. For a simple local server, run:

```powershell
# from repo root
python -m http.server 8000
# then visit http://localhost:8000/landing.html
```
**Design choices**
- **Colors & Typography:** Palette and type scale are selected to evoke Amazon's neutral, high-contrast aesthetic (dark blues/greys, bold primary CTAs). Web-safe fonts and fallbacks are used to keep rendering consistent across clients.
- **Hierarchy & Layout:** Clear visual hierarchy with hero area, product/offer sections, and a focused CTA on both the email and landing page. Spacing and margins follow a compact, content-first approach to work well on mobile.
- **Images & Assets:** Images are used liberally to mirror marketing emails; they are optimized for size and placed in `assets/` to keep content weight reasonable.
- **Responsiveness:** CSS media queries target common breakpoints so both email and landing page render acceptably on desktop and mobile.
- **Accessibility & Safety:** Semantic HTML, meaningful alt text for images, and clearly labeled buttons. This project is a mock/training artifact — it does not collect or transmit real credentials or personal data.

**Constraints & Notes**
- This repository is for educational/design evaluation only. Do not use the assets or templates for actual phishing or malicious activity.
- Some email clients alter CSS support — the `email.html` is structured to favor wide compatibility, but client rendering may vary.
- If GitHub Pages is enabled, the site can be served from this repository root; otherwise open the files locally.

**Contact / Attribution**
- Author: Nuray Shiraliyeva

---
*Prepared as a simulation design home assignment — deliverables include the email HTML, landing page HTML/CSS/JS, screenshots, and this README describing design choices and constraints.*
