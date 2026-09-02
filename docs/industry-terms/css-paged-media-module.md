---
title: CSS Paged Media Module
description: A World Wide Web Consortium (W3C) standard for defining page layouts, margins, and breaks when converting Hypertext Markup Language (HTML) content into paged formats such as Portable Document Format (PDF) files or paper.
revision_date: 2026-09-03
---

# CSS Paged Media Module

> *A World Wide Web Consortium (W3C) standard for defining page layouts, margins, and breaks when converting Hypertext Markup Language (HTML) content into paged formats such as Portable Document Format (PDF) files or paper*

---

## Defining Paged Media

While the web traditionally functions as a continuous scroll, the Cascading Style Sheets (CSS) Paged Media Module shifts the focus to discrete pages. It maps digital elements to a page model consisting of the page box, which contains the page area and the margin area. This allows developers to treat HTML content as a series of bounded sheets, which is essential for manuals, books, or any document intended for print. 

By using this specification, technical writers can bypass legacy desktop publishing tools and leverage existing CSS skills to automate high-fidelity PDF generation.

---

## Why it matters in modern workflows

Manual formatting is a significant bottleneck in documentation as code (DaC) pipelines. Without a programmatic way to handle pagination, automated exports often suffer from widows and orphans. These are single lines of text left alone at the top or bottom of a page, or headers separated from their following paragraphs.

The CSS Paged Media Module solves this by giving teams granular control over the print environment. It ensures that metadata, such as dynamic page numbers, version headers, and legal footers, align with the broader content strategy. This treats the print layout with the same level of automation and version control as the web layout.

---

## Syntax and structure

The specification relies on a set of rules designed to manage the physical boundaries of the document:

- **@page rule:** The foundational block. It dictates dimensions (for example, letter or A4), orientation, and the outer margins of the page box.
- **Margin boxes:** There are 16 specific regions located within the margin area, such as `@top-left-corner`, `@top-center`, and `@right-middle`. These regions house generated content such as headers, footers, or logos.
- **Page breaks:** Properties such as `break-before`, `break-after`, and `break-inside` manage the flow, which prevents elements from splitting awkwardly across pages.
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
This configuration establishes a standard letter size and uses the `@top-center` margin box to repeat the title of the manual across every page. The `counter()` functions automate page numbering. To ensure readability, the `orphans` and `widows` properties prevent isolated lines of text, while `break-inside: avoid` ensures that code snippets do not split across pages.

---

## Implementation hurdles

**Limited browser support**  
Standard browsers such as Google Chrome, Mozilla Firefox, and Apple Safari have limited support for the Paged Media Module. They often ignore margin boxes such as `@top-center` in their print dialogs. For production-grade documents, you must integrate specialized rendering engines such as Prince, WeasyPrint, or DocRaptor into your build pipeline.

**The overlap trap**  
The margin area size is fixed by the `@page` margin property. If the content injected into a margin box, such as a large logo or a high font-size header, exceeds the margin dimensions, it will overlap the page area rather than pushing the body content down. This occurs because there is no standard auto-margin logic for paged media.

---

## Tooling and Best Practices

- **Validation:** Use Stylelint with print-specific plugins to catch invalid properties before document generation.
- **Physical Units:** Use absolute units such as `in`, `mm`, or `pt`. Avoid `px`, because its physical scale can vary between rendering engines.
- **Strategic Breaks:** Apply `break-before: page` to primary headers, such as `h1` and `h2`, to ensure major sections always start on a fresh sheet.
- **Automation:** Incorporate PDF generation into your continuous integration and continuous delivery (CI/CD) pipeline to ensure documentation exports remain synchronized with the latest commits.