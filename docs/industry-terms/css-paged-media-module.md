---
title: CSS Paged Media Module
description: How to use the W3C CSS Paged Media Module to design print-specific layouts, define page breaks, and generate high-fidelity PDFs from HTML.
revision_date: 2026-08-19
---

# CSS Paged Media Module

> A W3C standard defining page-specific style rules—like margins and size—to generate print-ready PDFs directly from HTML

---

## What is the CSS Paged Media Module?

The CSS Paged Media Module is a specification that expands the styling capabilities of CSS. Use it to control the layout, formatting, and design of documents intended for paged media, such as printed paper or a PDF. Instead of treating content as a continuous scroll, this specification instructs browsers or rendering engines to split content into discrete pages, mapping digital elements to physical coordinates.

Technical writers and software engineers use this module in documentation pipelines to automate the rendering of manuals, user guides, and API reference sheets. By adopting this standard, your team can use existing HTML and CSS knowledge to generate consistent printouts or digital documents without using legacy page-layout systems.

---

## Why it matters

In a Docs as Code (DaC) workflow, generating high-fidelity files often requires manual updates or complex conversion pipelines. The CSS Paged Media Module addresses this by letting product teams programmatically manage margins, page orientation, headers, and footers. This approach ensures document styling aligns with your content strategy and that print layouts receive the same automation as web layouts.

Without this specification, automated documentation pipelines often generate broken layouts. Code snippets might split awkwardly across page breaks, tables might truncate mid-row, and dynamic metadata, such as page numbers, will be missing. These failures make your documentation difficult to read and hurt the experience for offline users.

---

## Syntax and structure

The CSS Paged Media Module uses the following layout rules and properties:

- **@page rule:** The top-level block that defines page boundaries, including paper dimensions, margins, and orientation.
- **Page margin boxes:** Sixteen regions within the page margins (such as `@top-center` or `@bottom-right`) used for headers, footers, page counts, or logos.
- **Page breaks:** Properties such as `break-before`, `break-after`, and `break-inside` that control how content splits across pages.
- **Page counters:** Dynamic variables used within margin content properties to track and display page numbers and totals.

```mermaid
graph TD
    subgraph Page_Box [Page Box]
        subgraph Margin_Area [Margin Area]
            TC[@top-center]
            BC[@bottom-center]
            TL[@top-left]
            TR[@top-right]
            BL[@bottom-left]
            BR[@bottom-right]
        end
        subgraph Page_Area [Page Area]
            Content[Body Content / HTML]
        end
    end
    TC --- Content
    BC --- Content
```

---

## Code example

```css
/* Define target page box layout */
@page {
  size: U.S. letter;
  margin: 1.5in;
  
  /* Injected header */
  @top-center {
    content: "Product Implementation Manual";
    font-family: sans-serif;
    font-size: 9pt;
    color: #333333;
  }
  
  /* Dynamic page numbering */
  @bottom-right {
    content: "Page " counter(page) " of " counter(pages);
    font-family: sans-serif;
    font-size: 9pt;
  }
}

/* Prevent block splitting */
pre, blockquote {
  break-inside: avoid;
}

/* Force major headings to a new page */
h2.section-start {
  break-before: page;
}
```

### How to read this example

- **@page block:** Sets the page format to U.S. letter dimensions with a 1.5-inch margin on all sides.
- **@top-center margin box:** Adds a running header centered at the top of every page.
- **counter() functions:** Tracks page progress and displays the current page and total count in the bottom-right margin.
- **break-inside: avoid:** Instructs the renderer to keep code blocks intact by moving the entire element to the next page if it does not fit on the current one.

---

## Common pitfalls

When you implement print layouts with CSS, you might encounter several common configuration errors.

### Browser limitations
Most web browsers do not natively support margin boxes (like `@top-center`) during a print job. To use these features, integrate specialized engines like Prince or WeasyPrint into your pipeline to parse these styles and compile the final document.

### Margin and header overlap
If you place large headers in your margins without increasing the margin height, your body text will overlap your header. Ensure that your `@page` margin space is larger than the content inside your margin box elements.

---

## Tooling and ecosystem

- **Engines:** Standalone utilities like Prince, WeasyPrint, and DocRaptor compile HTML and CSS into high-fidelity PDF files.
- **Linters:** You can configure Stylelint to inspect CSS files for print-specific properties before committing code.

---

## Best practices

1. Define dimensions explicitly in your stylesheets rather than relying on default browser paper profiles.
2. Use physical units, such as inches (in), millimeters (mm), or points (pt), for print margins instead of pixels (px).
3. Set page-break-avoidance properties on elements that should stay together, such as figures, tables, and code snippets.
4. Integrate style verification into your build automation to validate your stylesheet properties before running a document compiler.