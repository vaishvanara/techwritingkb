---
title: CSS Paged Media Module
description: A W3C standard for defining page layouts, margins, and breaks when converting HTML content into paged formats like PDFs or printed paper.
revision_date: 2026-08-28
---

# CSS Paged Media Module

> A W3C standard for defining page layouts, margins, and breaks when converting HTML content into paged formats like PDFs or printed paper

---

## Defining Paged Media

While the web traditionally functions as a continuous scroll, the CSS Paged Media Module shifts the focus to discrete pages. It maps digital elements to physical coordinates, allowing developers to treat HTML content as a series of bounded sheets—essential for manuals, books, or any document intended for print. By using this specification, technical writers can bypass legacy desktop publishing tools and leverage existing CSS skills to automate high-fidelity PDF generation.

---

## Why it matters in modern workflows

Manual formatting is a significant bottleneck in Docs as Code (DaC) pipelines. Without a programmatic way to handle pagination, automated exports often suffer from "widows" and "orphans"—headers separated from their paragraphs, or code blocks sliced awkwardly across two pages. 

The CSS Paged Media Module solves this by giving teams granular control over the print environment. It ensures that metadata like dynamic page numbers, version headers, and legal footers align with the broader content strategy, treating the print layout with the same level of automation and version control as the web layout.

---

## Syntax and structure

The specification relies on a set of rules designed to manage the physical boundaries of the document:

- **@page rule:** The foundational block. It dictates dimensions (e.g., A4 or U.S. Letter), orientation, and the outer margins of the page box.
- **Page margin boxes:** These are 16 specific regions—such as `@top-left` or `@bottom-center`—residing within the margins where you can inject headers, footers, or logos.
- **Page breaks:** Properties like `break-before` and `break-inside` manage the flow, preventing elements from splitting across pages.
- **Page counters:** These dynamic variables track progress through the document, enabling "Page X of Y" functionality.

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

### Key takeaways
This configuration establishes a standard 1.5-inch margin and uses the `@top-center` box to repeat a manual title across every page. The `counter()` function automates page numbering, while `break-inside: avoid` ensures that code snippets stay in one piece, automatically pushing them to the next page if space is insufficient.

---

## Implementation hurdles

**Limited browser support**  
Chrome, Firefox, and Safari generally ignore margin boxes (like `@top-center`) during standard printing. For production-grade documents, you must integrate specialized rendering engines like **Prince**, **WeasyPrint**, or **DocRaptor** into your build pipeline.

**The "overlap" trap**  
Margins must be sized generously enough to house your margin box content. If your `@page` margin is 0.5 inches but your header font size and padding require 0.75 inches, the body text will bleed into the header.

---

## Tooling and Best Practices

- **Validation:** Use Stylelint to catch invalid print properties before they hit your document compiler.
- **Physical Units:** Always use `in`, `mm`, or `pt` for margins and font sizes. `px` is unreliable in a print context.
- **Strategic Breaks:** Apply `break-before: page` to primary headers (`h1`, `h2`) to ensure major sections always start on a fresh sheet.
- **Automation:** Incorporate PDF generation into your CI/CD pipeline to ensure documentation exports are always in sync with the latest commits.