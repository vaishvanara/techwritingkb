---
title: CSS Paged Media Module
description: A W3C standard for defining page layouts, margins, and breaks when converting HTML content into paged formats like PDFs or printed paper.
revision_date: 2026-09-02
---

# CSS Paged Media Module

> A W3C standard for defining page layouts, margins, and breaks when converting HTML content into paged formats like PDFs or printed paper

---

## Defining Paged Media

While the web traditionally functions as a continuous scroll, the CSS Paged Media Module shifts the focus to discrete pages. It maps digital elements to a page model consisting of the **page box**, which contains the **page area** and the **margin area**. This allows developers to treat HTML content as a series of bounded sheets—essential for manuals, books, or any document intended for print. By using this specification, technical writers can bypass legacy desktop publishing tools and leverage existing CSS skills to automate high-fidelity PDF generation.

---

## Why it matters in modern workflows

Manual formatting is a significant bottleneck in Docs as Code (DaC) pipelines. Without a programmatic way to handle pagination, automated exports often suffer from "widows" and "orphans"—single lines of text left alone at the top or bottom of a page, or headers separated from their following paragraphs.

The CSS Paged Media Module solves this by giving teams granular control over the print environment. It ensures that metadata like dynamic page numbers, version headers, and legal footers align with the broader content strategy, treating the print layout with the same level of automation and version control as the web layout.

---

## Syntax and structure

The specification relies on a set of rules designed to manage the physical boundaries of the document:

- **@page rule:** The foundational block. It dictates dimensions (e.g., `letter` or `A4`), orientation, and the outer margins of the page box.
- **Margin boxes:** There are 16 specific regions located within the margin area (e.g., `@top-left-corner`, `@top-center`, `@right-middle`). These regions house generated content like headers, footers, or logos.
- **Page breaks:** Properties like `break-before`, `break-after`, and `break-inside` manage the flow, preventing elements from splitting awkwardly across pages.
- **Page counters:** Using `counter(page)` and `counter(pages)`, developers can track and display current and total page numbers.

```mermaid
grid-layout
    subgraph Page_Box [Page Box]
        subgraph Margin_Area [Margin Area]
            TL[@top-left-corner]
            TC[@top-center]
            TR[@top-right-corner]
            LS[@left-middle]
            RS[@right-middle]
            BL[@bottom-left-corner]
            BC[@bottom-center]
            BR[@bottom-right-corner]
        end
        subgraph Page_Area [Page Area]
            Content[HTML Body Content / Flow]
        end
    end
```

---

## Code example

```css
/* Define target page box layout */
@page {
  size: letter; /* Correct keyword for 8.5in x 11in */
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

/* Manage orphans and widows */
p {
  orphans: 3;
  widows: 3;
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

### Key takeaways
This configuration establishes a standard `letter` size and uses the `@top-center` margin box to repeat a manual title across every page. The `counter()` functions automate page numbering. To ensure readability, `orphans` and `widows` properties prevent isolated lines of text, while `break-inside: avoid` ensures that code snippets stay in one piece.

---

## Implementation hurdles

**Limited browser support**  
Standard browsers (Chrome, Firefox, Safari) have limited support for the Paged Media Module, often ignoring margin boxes like `@top-center` in their print dialogs. For production-grade documents, you must integrate specialized rendering engines like **Prince**, **WeasyPrint**, or **DocRaptor** into your build pipeline.

**The "overlap" trap**  
The margin area size is fixed by the `@page` margin property. If the content injected into a margin box (e.g., a large logo or high font-size header) exceeds the margin dimensions, it will overlap the **page area** (the body content) rather than pushing it down, as there is no standard "auto-margin" logic for paged media.

---

## Tooling and Best Practices

- **Validation:** Use Stylelint with print-specific plugins to catch invalid properties before document generation.
- **Physical Units:** Use absolute units like `in`, `mm`, or `pt`. Avoid `px`, as its physical scale can vary between rendering engines.
- **Strategic Breaks:** Apply `break-before: page` to primary headers (`h1`, `h2`) to ensure major sections always start on a fresh sheet.
- **Automation:** Incorporate PDF generation into your CI/CD pipeline to ensure documentation exports stay in sync with the latest commits.