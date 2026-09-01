---
title: WebHelp and responsive HTML5
description: Standardized web-based documentation formats that deliver responsive, searchable, and browser-accessible content across all modern devices and platforms.
revision_date: 2026-09-02
---

# WebHelp and responsive HTML5

> Standardized web-based documentation formats that deliver responsive, searchable, and browser-accessible content across all modern devices and platforms

---

## Technical overview

Responsive HTML5 has largely superseded the legacy Compiled HTML Help (CHM) format. While CHM files rely on the local Windows `hh.exe` runtime and the `itss.dll` storage engine—which are frequently blocked by Windows "Mark of the Web" security policies—responsive HTML5 outputs run natively in any modern web browser using standard web technologies.

Modern WebHelp is **frameless**, moving away from the deprecated HTML `<frameset>` and `<iframe>` architectures of the early 2000s. It integrates directly into CI/CD build pipelines and static hosting environments (e.g., Netlify, GitHub Pages, or S3). By using standard web assets, teams can treat documentation as code (Docs-as-Code). The "responsive" aspect utilizes CSS3 Media Queries and Flexbox/Grid layouts to ensure the UI adapts dynamically to different viewport sizes.

---

## Strategic advantages

*   **Platform Independence:** Content is accessible on any OS with a modern browser engine (Blink, WebKit, or Gecko).
*   **Search Engine Optimization (SEO):** Unlike the binary "blobs" of CHM files, HTML5 files are fully indexable by web crawlers like Googlebot.
*   **Analytics and Insights:** Allows integration of client-side tracking (e.g., Google Analytics or Matomo) to monitor page views and search queries.
*   **Security:** Eliminates vulnerabilities associated with the CHM format’s reliance on local code execution and legacy Internet Explorer components.

---

## Syntax and structure

A WebHelp package is a self-contained directory containing the entry point, navigation schemas, and search logic.

??? note "WebHelp Folder Directory Structure"
    This diagram illustrates the typical organization of a modern, static-site generated documentation output:

    ```mermaid
    graph TD
        A[webhelp-output/] --> B(index.html - Entry Point)
        A --> C(toc.json - Navigation Map)
        A --> D(search-index.json - Search Data)
        A --> E[assets/]
        E --> E1(css/ - UI Styling)
        E --> E2(js/ - Logic & Search Engine)
        A --> F[topics/]
        F --> F1(getting-started.html)
        F --> F2(troubleshooting.html)
    ```

### Core components

*   **`index.html`**: The main landing page. In a Single Page Application (SPA) or AJAX-based help system, this file contains the shell (header, sidebar, search bar) and dynamically loads topic content.
*   **`toc.json`**: A JSON-formatted tree structure defining the Table of Contents.
*   **`search-index.json`**: A serialized index of the site's content. A client-side JavaScript engine (located in `assets/js/`) parses this file to return search results without a server-side database.
*   **Topic Files**: Semantic HTML5 documents. When using a frameless approach, these often contain the raw article content which is then injected into the main UI shell or linked via relative paths.

---

## Topic template example

The following template demonstrates a responsive, accessible HTML5 topic.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Configure initial setup settings for your WebHelp system.">
    <title>Getting Started | WebHelp System</title>
    <link rel="stylesheet" href="../assets/css/webhelp-theme.css">
    <!-- Script to handle dynamic UI elements like TOC synchronization -->
    <script src="../assets/js/webhelp-logic.js" defer></script>
</head>
<body>
    <header class="webhelp-header">
        <nav class="breadcrumbs" aria-label="Breadcrumb">
            <ol>
                <li><a href="../index.html">Home</a></li>
                <li aria-current="page">Getting Started</li>
            </ol>
        </nav>
    </header>

    <main id="main-content" class="webhelp-main">
        <article>
            <h1>Getting Started with Your WebHelp System</h1>
            <p>Set up and configure your publishing parameters to begin deployment.</p>
            
            <section id="prerequisites">
                <h2>Prerequisites</h2>
                <ul>
                    <li>Web server (Nginx/Apache) or local preview tool.</li>
                    <li>Modern web browser (Chrome, Firefox, Safari, Edge).</li>
                </ul>
            </section>
        </article>
    </main>

    <footer class="webhelp-footer">
        <p>&copy; 2026 Technical Communication Hub.</p>
    </footer>
</body>
</html>
```

### Key implementation details
The `<meta name="viewport">` tag is the **linchpin** of responsive design; it instructs the browser to set the page width to the device width and sets the initial scale. For accessibility, `aria-label` and `aria-current` attributes provide context to Screen Readers. The `<main>` and `<article>` tags are semantic landmarks that help both search engines and assistive technology identify the primary content.

---

## Common pitfalls to avoid

*   **Hardcoded Absolute Paths:** Using links like `https://site.com/page.html` breaks functionality when viewed in a staging environment or locally via `file://`. Always use relative paths.
*   **CORS Issues with Local Loading:** Modern browsers block `XMLHttpRequests` (used for `search.json` or `toc.json`) when opened via the `file://` protocol. Documentation intended for offline local use should be bundled using a tool that bypasses this or uses a local web server.
*   **Missing Alt Text on Topic Images:** Automated build tools often overlook missing `alt` attributes, creating accessibility barriers in the generated HTML.

---

## Ecosystem and validation

*   **Browsers & Servers:** Compatible with all modern engines and standard web servers.
*   **Validation:** Use **HTMLHint** for markup integrity, **axe-core** for WCAG compliance, and **Markdown-lint** (if authoring in MD) to catch errors before the HTML generation phase.