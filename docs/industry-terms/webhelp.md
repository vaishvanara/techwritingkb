---
title: WebHelp and responsive HTML5
description: Standardized web-based documentation formats that deliver responsive, searchable, and browser-accessible content across all modern devices and platforms.
revision_date: 2026-08-28
---

# WebHelp and responsive HTML5

> Standardized web-based documentation formats that deliver responsive, searchable, and browser-accessible content across all modern devices and platforms

---

## Technical overview

WebHelp replaces the aging Compiled HTML Help (CHM) format with a frameless portal built on **HTML5**, **CSS**, and **JavaScript**. While CHM files rely on local Windows runtime engines—often triggering security blocks on corporate networks—responsive HTML5 outputs run natively in any web browser. 

This format is the standard for modern technical documentation because it integrates directly into automated build pipelines and static hosting environments. By using standard web assets, teams can treat documentation as code, deploying updates alongside software releases. The "responsive" aspect ensures the layout shifts dynamically, providing a readable experience on everything from mobile devices to ultrawide monitors.

---

## Strategic advantages

Shifting from desktop-only formats to WebHelp solves several legacy pain points:

*   **Platform Independence:** Content is accessible on macOS, Linux, iOS, and Android, not just Windows.
*   **Search Visibility:** Unlike compiled blobs, HTML5 files are indexable by search engines, significantly improving public-facing SEO.
*   **Analytics and Insights:** Web-first delivery allows you to track user behavior via standard analytics tools—a task impossible with offline files.
*   **Security:** Eliminates the vulnerabilities associated with CHM's reliance on the Internet Explorer engine and local execution.

---

## Syntax and structure

A WebHelp package is a self-contained directory containing the entry point, navigation schemas, and search logic.

??? note "WebHelp Folder Directory Structure"
    This diagram illustrates the typical organization of generated output files:

    ```mermaid
    graph TD
        A[webhelp-output/] --> B(index.html - Entry Point)
        A --> C(toc.json - Navigation Map)
        A --> D(search.json - Search Index)
        A --> E[assets/]
        E --> E1(css/ - UI Styling)
        E --> E2(js/ - Logic & Search)
        A --> F[topics/]
        F --> F1(getting-started.html)
        F --> F2(troubleshooting.html)
    ```

### Core components

*   **`index.html`**: The portal's front door. It initializes the UI, navigation sidebar, and search interface.
*   **`toc.json`**: A structured mapping of the site's information architecture. It dictates the hierarchy of the sidebar menu.
*   **`search.json`**: A precompiled, client-side index. It allows users to query content instantly without requiring a backend database.
*   **Topic Files**: Semantic HTML5 documents containing the actual content, often enriched with metadata for better search filtering.

---

## Topic template example

The following template demonstrates a responsive, accessible HTML5 topic designed for a WebHelp framework.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Configure initial setup settings for your WebHelp system.">
    <title>Getting Started with Your WebHelp System</title>
    <link rel="stylesheet" href="../assets/css/webhelp-theme.css">
</head>
<body>
    <header class="webhelp-header">
        <nav class="breadcrumbs" aria-label="Breadcrumb">
            <ol>
                <li><a href="../index.html">Home</a></li>
                <li><a href="index.html">User Guide</a></li>
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
                <p>Ensure you have access to a web server or a local staging environment for testing.</p>
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
The `<meta name="viewport">` tag is the linclpin of responsive design, preventing browsers from defaulting to a zoomed-out desktop view on mobile. For accessibility, `aria-label` and `aria-current` attributes ensure that screen readers can interpret the navigation hierarchy, while the `<main>` tag helps search engines prioritize the topic content over UI boilerplate.

---

## Common pitfalls to avoid

*   **Hardcoded Absolute Paths:** Using links like `https://site.com/page.html` breaks the package if it is moved to a staging server or local drive. Always use relative paths (`../topics/page.html`).
*   **Omitting Viewport Settings:** Without the viewport meta tag, the help site becomes unreadable on small screens, as the browser scales the entire layout down to fit the width.
*   **Bloated Search Indexes:** For large doc sets, uncompressed `search.json` files can delay page loads. Ensure your build tool minifies or chunks search data.

---

## Ecosystem and validation

WebHelp relies on the standard web stack:

*   **Browsers & Servers:** Compatible with all modern engines (Chromium, WebKit, Gecko) and servers like Nginx or Apache.
*   **Validation:** Use **HTMLHint** for syntax, **axe-core** for WCAG compliance, and automated broken link checkers to ensure integrity across the navigation tree.