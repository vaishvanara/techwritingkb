---
title: Semantic hierarchy
description: A system of organizing digital content through nested headings and tags to establish a logical information architecture and improve accessibility.
revision_date: 2026-09-02
---

# Semantic hierarchy

> A system of organizing digital content through nested headings and tags to establish a logical information architecture and improve accessibility.

---

## Understanding semantic hierarchy

Semantic hierarchy uses structural HTML elements (`<h1>` through `<h6>`) to signal the relative importance of topics and their relationships. This structure builds a programmatic tree that defines the document's information architecture. While visual cues like typography and whitespace help sighted users, the underlying semantic tags ensure that the document's logic is preserved across different platforms, including screen readers and search engine crawlers.

---

## The mechanics of structure

When documentation lacks hierarchy, it becomes a "wall of text." This creates friction, often leading users to abandon a page when they cannot locate specific information. A predictable semantic order solves this by providing a machine-readable path.

This foundation serves three core technical requirements:
- **Accessibility:** Screen readers use heading tags to generate navigation landmarks. Users with visual impairments often navigate by jumping from header to header to understand page layout.
- **Search Engine Optimization (SEO):** Search algorithms use heading levels to parse the context and relevance of content, which influences how segments of the page appear in featured snippets and search results.
- **Scanability:** Technical users scan for headers to locate specific solutions. Correct hierarchy ensures that the visual prominence of a header matches its programmatic depth.

!!! tip "Design tip"
    Apply enough whitespace around headers using CSS margins rather than empty `<br>` tags. This maintains a clean separation between sections without introducing "ghost" elements into the accessibility tree.

---

## Core principles

Effective semantic structure relies on three factors:

*   **Logical nesting:** Arrange topics systematically. A page must have exactly one `<h1>` defining the primary topic. Use `<h2>` for major sections, `<h3>` for sub-sections, and so on. Jumping levels (e.g., from an `<h2>` directly to an `<h4>`) violates WCAG 1.3.1 (Info and Relationships) and creates a disjointed experience for assistive technology.
*   **Visual-Semantic alignment:** While typography—including size and font weight—visually reflects the hierarchy, it must match the underlying tags. An `<h2>` should never be visually smaller than an `<h3>`. 
*   **Semantic integrity:** Use actual programmatic tags or Markdown markers (`##`, `###`) rather than applying styles (like bold or increased font size) to standard paragraph text. Bolding text does not add a node to the document outline.

---

## Design pattern example

The following map and code demonstrate how to convert flat text into a functional, accessible hierarchy.

=== "Visual hierarchy map"
    ```mermaid
    graph TD
        A[H1: Deploying your application] --> B[H2: Configure environment]
        A --> C[H2: Execute build command]
        B --> D[H3: Set local variables]
        B --> E[H3: Verify production keys]
    ```

=== "Semantic Markdown output"
    ```markdown
    # Deploying your application

    This guide explains how to prepare and deploy your code to production.

    ## Configure environment
    Before running the build script, configure your environment variables.

    ### Set local variables
    Use your local terminal to export the required API keys.

    ### Verify production keys
    Ensure your production credentials match the values in your secure vault.

    ## Execute build command
    Run the compilation command to compile your assets.
    ```

### Structural breakdown

In this pattern, the **H1** defines the scope of the entire page. The **H2s** divide the workflow into sequential phases. The **H3s** are nested under the "Configure environment" section, indicating they are sub-steps specific to that phase. This allows a screen reader to generate an accurate "Table of Contents" and allows users to skip to the "Execute build command" section while maintaining the context of its parent level.

---

## Implementation and validation

To maintain consistency, keep headings concise and descriptive. Avoid using bold styles to "fake" a header, as this hides the structure from the accessibility tree.

### Testing usability
*   **The document outline test:** Use a browser extension or developer tool to view the "Document Outline." The outline should look like a nested list with no "Missing Heading" warnings.
*   **Navigation testing:** Use a screen reader like [NVDA](https://www.nvda-project.org/) or [JAWS](https://www.freedomscientific.com/products/software/jaws/) and use the shortcut key **H** to jump between headers. Ensure the reading order follows the logical flow of the task.