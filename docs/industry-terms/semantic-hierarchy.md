---
title: Semantic hierarchy
description: A system of organizing digital content through nested headings and tags to establish a logical information architecture and improve accessibility.
revision_date: 2026-08-28
---

# Semantic hierarchy

> A system of organizing digital content through nested headings and tags to establish a logical information architecture and improve accessibility

---

## Understanding semantic hierarchy

Semantic hierarchy uses structural headings and HTML tags to signal the relative importance of topics and their relationships. Beyond mere aesthetics, this structure builds a mental model for the reader. By leveraging typography and visual cues to show how concepts nest within one another, you transform a dense document into a map that is easy to navigate and understand.

---

## The mechanics of structure

When documentation lacks hierarchy, it becomes a "wall of text." This creates friction, often leading users to abandon a page when they can't immediately find a specific command or concept. A predictable visual order solves this by providing a logical path.

This foundation also serves technical requirements:
- **Accessibility:** Screen readers rely on tags to generate navigation landmarks for users with visual impairments.
- **Search Engine Optimization (SEO):** Search algorithms use heading levels to index content relevance and determine page authority.
- **Scanability:** Most technical users don't read word-for-word; they scan for headers to locate specific solutions.

!!! tip "Design tip"
    Apply enough whitespace around headers. "Breathing room" prevents visual clutter and helps the layout guide the reader's eye naturally between sections.

---

## Core principles

Effective semantic structure relies on three factors:

*   **Logical nesting:** Arrange topics systematically. Use H2s for broad concepts, H3s for specific tasks, and H4s for granular details. Jumping from an H2 directly to an H4 breaks the programmatic outline and confuses assistive technology.
*   **Visual distinction:** Typography—including size, font weight, and line spacing—must reflect the heading level. Top-level headers should be immediately more prominent than subheadings.
*   **Semantic integrity:** Use actual programmatic tags (`<h2>`, `<h3>`) or Markdown markers (`##`, `###`) rather than simply bolding body text. This ensures the structure is machine-readable and survives content migrations.

---

## Design pattern example

The following map and code demonstrate how to convert flat text into a functional hierarchy.

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

In this pattern, the **H1** establishes the high-level context. The **H2s** divide the workflow into distinct phases (configuration and execution), while the **H3s** under configuration handle specific subtasks. This allows a screen reader to compile an accurate table of contents and lets experienced users skip directly to execution.

---

## Implementation and validation

To maintain consistency, keep headings concise and active—usually under eight words. Avoid using bold styles to "fake" a header, as this hides the structure from accessibility software.

### Testing usability
*   **The squint test:** Squint at the page until the text is blurry. You should still clearly see the distinct groupings and hierarchy based on size and spacing.
*   **Navigation testing:** Use a screen reader like [NVDA](https://www.nvda-project.org/) or [JAWS](https://www.freedomscientific.com/products/software/jaws/) to jump between headers. If the flow feels disjointed or levels are missing, the hierarchy needs refinement.