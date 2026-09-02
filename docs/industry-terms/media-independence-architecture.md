---
title: Media independence architecture (MIA)
description: An information design strategy that separates source content from its presentation layer to ensure consistent delivery across web, print, and mobile platforms.
revision_date: 2026-09-03
---

# Media independence architecture (MIA)

> *An information design strategy that separates source content from its presentation layer to ensure consistent delivery across web, print, and mobile platforms*

---

## Defining MIA

Modern documentation must exist across various outputs, including high-resolution desktop monitors, mobile devices, and static printed pages. Media independence architecture (MIA) addresses this by treating text and media as structured data, entirely decoupled from the layout. 

By applying the principle of separation of concerns, MIA ensures that content remains semantic. Instead of hardcoding styles or spatial references into source files, you define the structure of the content (what it is), which allows specialized build engines and stylesheets to determine the presentation (how it looks) for a specific output.

---

## Separating content and layout

When source files are optimized for a single target, such as a desktop browser, the content suffers from layout debt. Exporting these files to fixed-layout formats such as Portable Document Format (PDF) or reflowable formats such as electronic publication (EPUB) often breaks visual hierarchies, renders tables unreadable, and disrupts typography scaling. 

Decoupling form from function streamlines maintenance and content discovery. Semantic markup allows search engines and programmatic tools to index data based on meaning, which improves search engine optimization (SEO) and findability. Furthermore, branding updates are centralized: modifying a single global stylesheet or template updates all downstream artifacts, which eliminates the need to manually edit inline styles or local overrides.

---

## Core principles

Successful MIA implementations rely on four core principles:

- **Semantic tagging:** Use tags to describe intent, such as headings, steps, and code blocks, rather than visual properties, such as bold, 14px, or blue.
- **Neutral storage:** Maintain source files in machine-readable, non-proprietary formats such as Markdown, Extensible Markup Language (XML) (including DITA or DocBook), or AsciiDoc.
- **Metadata-driven assembly:** Use attributes, such as audience, platform, and product version, to filter and conditionalize content dynamically during the build process.
- **Independent rendering:** Use discrete templates, transformation scripts such as Extensible Stylesheet Language Transformations (XSLT) or Cascading Style Sheets (CSS), or build configurations for each target to apply the final design at the generation stage.

---

## Design pattern example

The following diagram illustrates how raw content and presentation assets are combined by a build engine to produce distinct outputs:

```mermaid
graph TD
    Source[Source Content: Markdown + YAML Metadata] --> Build[Build Engine / CI-CD Pipeline]
    WebStyle[Web Stylesheet/Templates] --> Build
    PrintStyle[Print Stylesheet/Templates] --> Build
    AppStyle[App Stylesheet/Templates] --> Build
    Build --> WebOut[HTML Developer Portal]
    Build --> PrintOut[PDF Reference Manual]
    Build --> MobileOut[In-App Help]
```

Consider the transition from a media-bound style to an MIA-compliant approach:

```text
[ Before / Media-Bound Pattern ]
--------------------------------------------------
<div style="font-size:14px; color:#333; float:left; width:300px;">
To restart the device, press the hard reset button. Refer to the image on the right.
</div>
<img src="desktop-diagram.png" style="margin-left: 20px;" />

[ After / MIA-Compliant Pattern ]
--------------------------------------------------
# Restart the device

To restart the device, press the hard reset button.

![Device hardware diagram](diagram-asset)
```

---

### Applying the pattern

MIA-compliant content uses lightweight markup that avoids spatial references, such as the image below, and absolute dimensions. Assets follow a similar abstraction; rather than hardcoding a device-specific file such as `desktop-diagram.png`, an abstract reference or a high-resolution master asset is used. The build engine then processes, resizes, or selects the appropriate variant, such as Scalable Vector Graphics (SVG) for the web or high dots per inch (DPI) Tagged Image File Format (TIFF) for print, for the target environment.

=== "Web Build Target"
    ```yaml
    # Output configuration for web
    output_format: html
    stylesheet: main-web.css
    media_queries: true
    optimization: minify_assets
    ```

=== "Print Build Target"
    ```yaml
    # Output configuration for PDF
    output_format: pdf
    stylesheet: print-book.css
    page_breaks: auto
    dpi: 300
    ```

---

## Practical implementation

Building a media-independent strategy requires strict adherence to these practices:

- **Prohibit inline styling:** Ban HTML `style` attributes and absolute image dimensions (width and height) in the source content.
- **Use environment-agnostic references:** Avoid spatial instructions such as click the link on the left or see the diagram above. These references fail when content reflows on mobile devices or is split across pages in a PDF.
- **Adopt Information Typing:** Categorizing content into Concepts, Tasks, and References (the CTR model) allows build scripts to prioritize or reorder modules based on the output format.
- **Leverage conditional processing:** Use build-time logic, such as `if-platform="android"`, to include or exclude specific content blocks.

---

## Common anti-patterns to avoid

- **The platform-bound manual:** Writing content that assumes a specific input method, such as Click here, Hover your mouse, or Tap the screen. Use neutral terms such as Select or Navigate to.
- **Embedded layout logic:** Inserting complex scripts, CSS blocks, or `<div>` wrappers directly into Markdown or XML files. This creates vendor lock-in and breaks the portability of the content.

---

## Validating the architecture

A robust MIA setup should be validated against multiple environments:

1.  **Multi-device audit:** Verify that visual hierarchy, typography, and line lengths are appropriate for desktop, mobile, and print.
2.  **Cross-platform usability:** Ensure instructions remain accurate regardless of the user input method, such as touch or mouse, or screen size.
3.  **Responsive simulation:** Use browser developer tools (**F12**) to ensure the generated HTML reflows correctly without clipping content or breaking the navigation UI.