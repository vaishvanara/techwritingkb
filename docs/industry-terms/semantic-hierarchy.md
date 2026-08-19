---
title: Semantic hierarchy
description: Learn how to organize technical information using headers and tags to communicate structural importance and establish logical relationships.
revision_date: 2026-08-19
---

# Semantic hierarchy

> The practice of organizing technical information logically by using structural headers and tags to establish relationships and guide readers through your documentation

---

## What is semantic hierarchy?

Semantic hierarchy is the practice of organizing information into levels by using headings and HTML tags. This indicates the importance of topics and how they relate to each other. A clear structure helps you build an accurate mental model of the documentation. When you implement a clear structure, you use typography, heading elements, and visual cues to show how concepts are nested.

A structural layout makes content easier to scan. By creating a predictable visual hierarchy, you help readers and people who use assistive technology, such as screen readers, navigate dense data. This foundation also improves search engine optimization (SEO) because search engines use structural tags to index and rank pages.

---

## Why structure matters

When technical documentation lacks structure, readers see an overwhelming block of text. Without clear pathways, readers might hesitate or jump between pages without finding what they need. This often leads to frustration and causes users to leave the site.

In contrast, establishing a structural order creates a logical path for the reader. It improves SEO by defining the relationships between topics, which helps search algorithms determine relevance. A consistent system of headers ensures that readers can scan a page quickly to find specific commands or concepts.

!!! tip "Design tip"
    Ensure your design includes enough whitespace around your headers. Ample breathing room prevents visual clutter and helps the layout guide the reader's eye naturally.

---

## Core principles and anatomy

A successful semantic structure relies on three core principles that dictate how you organize and label your content:

- **Logical nesting:** Systematically arrange topics where H2 headings group broad concepts, H3 headings break down specific tasks, and H4 headings cover fine details. ==Don't skip levels== (such as jumping from an H2 directly to an H4).
- **Visual distinction:** Use typography rules, including size, font weight, and line spacing, to reflect heading levels. A strong visual hierarchy ensures that top-level headers are larger and more prominent than subheadings.
- **Semantic integrity:** Use actual programmatic tags (like `<h2>` and `<h3>` in HTML or corresponding Markdown markers) instead of bolding body text. This makes content accessible to assistive technology and easier to parse during a content migration.

---

## Design pattern example

The following example shows how to transform a flat wall of text into a structured layout using semantic markup.

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

### Breakdown of the pattern

In the example above:
1. The **H1 (`#`)** defines the page title and establishes the context.
2. The **H2s (`##`)** divide the document into two phases: configuration and execution.
3. The **H3s (`###`)** nested under the configuration phase break the setup into two specific subtasks. 

This layout allows a screen reader to compile an accurate table of contents. It also helps readers who scan content to skip directly to execution if they have already configured their environment.

---

## Impact on user experience

Implementing a programmatic hierarchy influences how people interact with your technical resources:

- **Faster scannability:** Readers can locate command-line steps quickly by following visual guides and scannability patterns.
- **Improved retention:** Breaking complex operations into nested, logical phases helps readers understand and remember workflows.

---

## Implementation best practices

To maintain a consistent structure, apply these rules to your content strategy:

- **Keep headings concise:** Heading text should be active, direct, and usually fewer than eight words.
- **Don't use styles for structure:** Don't use bold formatting (`**bold**`) to simulate subheadings. Always use header syntax (like `###`) so accessibility software can interpret the document structure.
- **Match headings with the page objective:** Ensure that every H2 and H3 header supports the main goal of the page.

---

## Common anti-patterns

Avoid these common mistakes when structuring your pages:

- **The flat page:** Using only paragraphs and bold text instead of headers. This forces readers to read every line to find what they need.
- **Skipped levels:** Jumping from an H2 header directly to an H4. This is often done for aesthetic reasons but disrupts navigation for screen readers.

---

## How to validate and test usability

Verify that your structure is working by using these two testing methods:

- **The squint test:** Squint your eyes while looking at your page. You should still be able to identify the distinct sizes and groupings of the headers without reading the actual words.
- **Accessibility navigation test:** Use a screen reader (such as [NVDA](https://www.nvda-project.org/){: target="_blank" rel="noopener" } or [JAWS](https://www.freedomscientific.com/products/software/jaws/){: target="_blank" rel="noopener" }) to navigate by heading. Ensure the document structure is logical and that no levels are skipped.