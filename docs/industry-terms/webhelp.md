---
title: WebHelp and responsive HTML5
description: Learn about WebHelp and responsive HTML5, the server-hosted, standards-based successors to legacy desktop CHM help files.
revision_date: 2026-08-19
---

# WebHelp and responsive HTML5

> Server-hosted packages of standard HTML, CSS, and search index files that serve as modern successors to desktop CHM help files

---

## What are WebHelp and responsive HTML5?

WebHelp is a web-based format used to deliver documentation over the internet or an intranet. It uses standard web technologies like **JavaScript**, **Cascading Style Sheets** (**CSS**), and **Hypertext Markup Language** (**HTML**) to create a frameless help portal. Unlike legacy Compiled HTML Help (CHM) files, which require local Windows runtime engines, modern responsive HTML5 outputs load in any web browser. These outputs adapt to various screen sizes, from mobile phones to desktop monitors.

Technical writers, software engineers, and product teams use this format to publish searchable help centers. Because it relies on standard web assets, WebHelp integrates with developer portals, static hosting environments, and automated build pipelines. This helps teams treat documentation as part of the software deployment process and provides users with browser-accessible content.

---

## Why it matters

Legacy help systems like CHM are restricted to Windows and are often blocked on corporate networks because of security vulnerabilities. Migrating to WebHelp built with responsive HTML5 resolves these security and platform issues while improving the user experience. This format makes your documentation indexable by search engines, which improves search engine optimization (SEO) and helps users find content on the public web.

If your team uses desktop-only help formats, users will have difficulty using the content on mobile devices and tablets. You might also face high support overhead and fragmented documentation delivery. Additionally, you cannot run web-based analytics on isolated, offline help files. Adopting a responsive, web-first help format makes your customer assistance reliable, secure, and accessible from any device.

---

## Syntax and structure

A standard WebHelp package consists of a compiled folder containing an entry point, navigation schemas, search assets, and topic files. 

??? note "WebHelp Folder Directory Structure"
    This diagram shows how the generated output files are typically organized on a web server:

    ```mermaid
    graph TD
        A[webhelp-output/] --> B(index.html - Start Page)
        A --> C(toc.json - Navigation Data)
        A --> D(search.json - Search Index)
        A --> E[assets/]
        E --> E1(css/ - Layout Styles)
        E --> E2(js/ - Interactive Behavior)
        A --> F[topics/]
        F --> F1(getting-started.html)
        F --> F2(troubleshooting.html)
    ```

The core structural elements of the output package include:

*   **index.html:** The main entry point of the help center. It loads the layout, navigation menus, search bars, and default landing pages.
*   **TOC data file (toc.json):** A structured file that maps the information architecture of your documentation. It determines how the sidebar menu organizes pages.
*   **Search index (search.json):** A precompiled index file containing terms from your topics. It enables client-side search functionality without a backend database.
*   **Topic files (HTML5):** Individual page files containing the core content. These use metadata tags for search and navigation.
*   **Asset folders (CSS and JS):** Stylesheets that manage the responsive layout and **JavaScript** files that synchronize the table of contents and parse search queries.

---

## Sample code

Here is a semantic, responsive, and accessible HTML5 topic page template designed to load inside a WebHelp framework.

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
            <p>This guide helps you set up and configure your publishing parameters.</p>
            
            <section id="prerequisites">
                <h2>Prerequisites</h2>
                <p>Make sure you have access to a web server or a local staging environment.</p>
            </section>
        </article>
    </main>

    <footer class="webhelp-footer">
        <p>&copy; 2026 Technical Communication Hub. All rights reserved.</p>
    </footer>
</body>
</html>
```

### How to read this example

*   **`<meta name="viewport" ...>`:** Necessary for responsive HTML5. This tag tells the browser how to control the page dimensions and scaling on mobile screens.
*   **`aria-label="Breadcrumb"` and `aria-current="page"`:** Accessibility attributes that help screen readers identify the navigation hierarchy.
*   **`<main id="main-content">`:** Specifies the primary content of the document, which helps search engines catalog your content.

---

## Common pitfalls

When configuring or deploying WebHelp files, avoid these implementation mistakes:

### Hardcoded absolute paths
Using absolute links (such as `http://yoursite.com/topics/page.html`) inside topic files prevents the package from working on a local staging server or a different domain. Use relative paths (such as `../topics/page.html`) so your package remains portable.

### Missing viewport settings
Forgetting the viewport meta tag in custom templates causes mobile devices to render the help site at desktop widths. This results in small, unreadable text. Make sure your templates include the `<meta name="viewport" content="width=device-width, initial-scale=1.0">` tag inside the document head.

---

## Tooling and ecosystem

Modern responsive HTML5 help packages are created and maintained using standard development and deployment tools:

*   **Parsers and engines:** Web browsers (**Microsoft Edge**, **Google Chrome**, **Safari**, **Firefox**), web servers (**Nginx**, **Apache**), and static site generators.
*   **Linters and validators:** **HTMLHint**, the **W3C Markup Validation Service**, and automated testing engines like **axe-core** for validating compliance with the **Web Content Accessibility Guidelines** (**WCAG**).

---

## Best practices and validation

To maintain a high-quality help center, follow these guidelines:

1.  **Optimize client-side search packages:** If your documentation contains hundreds of pages, make sure your search index files are compressed. This reduces load times for users on slower networks.
2.  **Design for keyboard navigation:** Verify that users can navigate the search results, sidebar menu, and responsive layout using only the **Tab** and **Enter** keys.
3.  **Set up automated link checking:** Integrate broken link checkers into your deployment pipeline to catch errors before publication.
4.  **Use relative image paths and alt attributes:** Always define alternative text for diagrams and screenshots to maintain accessibility standards.