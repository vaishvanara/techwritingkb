---
title: WebHelp and responsive HTML5
description: Standardized web-based documentation formats that deliver responsive, searchable, and browser-accessible content across all modern devices and platforms.
revision_date: 2026-09-03
---

# WebHelp and responsive HTML5

> *Standardized web-based documentation formats that deliver responsive, searchable, and browser-accessible content across all modern devices and platforms*

---

## Technical overview

Responsive HTML5 has largely superseded the legacy Compiled HTML Help (CHM) format. While CHM files rely on the local Windows `hh.exe` runtime and the `itss.dll` storage engine, which are frequently blocked by Windows Mark of the Web security policies, responsive HTML5 outputs run natively in any modern web browser using standard web technologies.

Modern WebHelp is frameless, moving away from the deprecated HTML `<frameset>` and `<iframe>` architectures of the early 2000s. It integrates directly into continuous integration and continuous delivery (CI/CD) build pipelines and static hosting environments, such as Netlify, GitHub Pages, or S3. By using standard web assets, teams can treat documentation as code. The responsive aspect uses CSS3 media queries and flexbox and grid layouts to ensure the user interface (UI) adapts dynamically to different viewport sizes.

---

## Strategic advantages

-   **Platform independence:** Content is accessible on any operating system (OS) with a modern browser engine (Blink, WebKit, or Gecko).
-   **Search engine optimization (SEO):** Unlike the binary files of CHM, HTML5 files are fully indexable by web crawlers such as Googlebot.
-   **Analytics and insights:** Allows integration of client-side tracking, such as Google Analytics or Matomo, to monitor page views and search queries.
-   **Security:** Eliminates vulnerabilities associated with the reliance of the CHM format on local code execution and legacy Internet Explorer components.

---

## Syntax and structure

A WebHelp package is a self-contained directory containing the entry point, navigation schemas, and search logic.

??? note "WebHelp folder directory structure"
    This diagram illustrates the typical organization of a modern, static-site generated documentation output:

    ```mermaid
    graph TD
        A[webhelp-output/] --> B(index.html - entry point)
        A --> C(toc.json - navigation map)
        A --> D(search-index.json - search data)
        A --> E[assets/]
        E --> E1(css/ - UI styling)
        E --> E2(js/ - logic and search engine)
        A --> F[topics/]
        F --> F1(getting-started.html)
        F --> F2(troubleshooting.html)
    ```

### Core components

-   **`index.html`**: The main landing page. In a single-page application (SPA) or Ajax-based help system, this file contains the shell (header, sidebar, search bar) and dynamically loads topic content.
-   **`toc.json`**: A JavaScript Object Notation (JSON)-formatted tree structure defining the table of contents (TOC).
-   **`search-index.json`**: A serialized index of the content of the site. A client-side JavaScript engine (located in `assets/js/`) parses this file to return search results without a server-side database.
-   **Topic files**: Semantic HTML5 documents. When using a frameless approach, these often contain the raw article content which is then injected into the main UI shell or linked via relative paths.

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
    <!-- Script to handle dynamic UI elements such as TOC synchronization -->
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
                    <li>web server (Nginx/Apache) or local preview tool.</li>
                    <li>modern web browser (Chrome, Firefox, Safari, Edge).</li>
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
The `<meta name="viewport">` tag is essential for responsive design; it instructs the browser to set the page width to the device width and sets the initial scale. For accessibility, `aria-label` and `aria-current` attributes provide context to screen readers. The `<main>` and `<article>` tags are semantic landmarks that help both search engines and assistive technology identify the primary content.

---

## Common pitfalls to avoid

-   **Hardcoded absolute paths:** Using links such as `https://site.com/page.html` breaks functionality when viewed in a staging environment or locally via `file://`. Always use relative paths.
-   **Cross-origin resource sharing (CORS) issues with local loading:** Modern browsers block `XMLHttpRequests` (used for `search.json` or `toc.json`) when opened via the `file://` protocol. Documentation intended for offline local use should be bundled using a tool that bypasses this or uses a local web server.
-   **Missing alt text on topic images:** Automated build tools often overlook missing `alt` attributes, creating accessibility barriers in the generated HTML.

---

## Ecosystem and validation

-   **Browsers and servers:** Compatible with all modern engines and standard web servers.
-   **Validation:** Use HTMLHint for markup integrity, axe-core for Web Content Accessibility Guidelines (WCAG) compliance, and markdownlint (if authoring in Markdown) to catch errors before the HTML generation phase.