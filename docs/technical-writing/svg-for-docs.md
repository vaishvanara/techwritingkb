---
icon: lucide/tangent
title: Vector graphics for documentation
description: "Deep-dive optimization guidelines for using scalable vector graphics (SVG) efficiently, responsively, and accessibly in web-based documentation."
revision_date: 2026-07-17
---

# Vector graphics for documentation

> *Optimize high-resolution visuals to ensure they remain accessible and performant on the web*

---

Vector graphics, specifically Scalable Vector Graphics (SVG), are the foundation of modern digital documentation. They remain crisp on high-resolution screens and scale fluidly across desktop, tablet, and mobile device layouts because they are defined by mathematical formulas rather than static pixels. 

However, since SVGs are written in XML, they are also functional code documents. If left unoptimized, they can increase web page size, degrade load speeds, and present a significant barrier to users who rely on assistive technologies.

This guide provides the core workflows to ensure your scalable visual assets are performant, responsive, and compliant with modern accessibility standards.

---

## How SVGs load

How you choose to integrate a vector graphic into your documentation affects page load speed, server requests, and your ability to customize the graphic. Web browsers parse and render SVGs by using three primary methods.

| Integration method | Browser performance | Styling capability (CSS/JS) | Accessibility support |
| :--- | :---: | :---: | :--- |
| **Inline markup** (`<svg>`) | High (No extra HTTP request) | Full (Supports dark-mode styling) | Excellent (Direct DOM access) |
| **Image element** (`<img>`) | Medium (Requires HTTP fetch) | None (Locked inside sandboxed file) | Basic (Relies on `alt` attribute) |
| **CSS background** (`background-image`) | Medium (Requires HTTP fetch) | None | Poor (Hidden from screen readers) |

If you are building a modern [documentation site](../doc-stack/ssg.md), **inline markup** is the preferred method for interactive diagrams. It allows your platform's dark-mode toggle to change the line colors of your illustrations by using global CSS. Use the standard image tag (`<img>`) primarily for standalone static diagrams.

---

## The viewBox attribute

Unlike raster images that have rigid pixel boundaries, responsive SVGs rely on the `viewBox` attribute. The `viewBox` attribute establishes a local coordinate system inside your illustration. This allows the browser to scale the graphic up or down proportionally while preserving its aspect ratio.

When you configure an SVG manually or in a code editor, make sure the `<svg>` element does not contain hardcoded `width` or `height` attributes unless they are coupled with a flexible `viewBox`.

```xml hl_lines="1-4"
<svg viewBox="0 0 800 600" 
     width="100%" 
     height="auto" 
     xmlns="[http://www.w3.org/2000/svg](http://www.w3.org/2000/svg)">
  <!-- The local canvas is 800 units wide by 600 units high -->
  <rect x="100" 
        y="50" 
        width="600" 
        height="500" 
        fill="none" 
        stroke="currentColor" 
        stroke-width="2" />
</svg>
```

By setting `width="100%"` and `height="auto"`, the graphic fluidly occupies the horizontal space of your documentation's main column on a smartphone while capping its display size proportionally on a widescreen monitor.

---

## Automated optimization workflows

When you export vector assets from [technical illustration software](../technical-writing/technical-illustration-tools.md), they often contain unnecessary metadata, nested grouping containers (`<g>`), and overly precise decimal coordinates that increase the file size. 

You can automate the compression of these assets within your build pipeline or local environment by using open-source, Node.js-based command-line utilities.

??? note "Automate code compression"
    An uncompressed SVG can often be reduced in size by 50% to 80% with no visible loss in quality. You can accomplish this by rewriting long code pathways, removing unnecessary editor namespaces, and lowering coordinate decimal precision.
    
    A standard automation configuration targets the following cleanup steps:
    
    - **Precision reduction:** Round long coordinate numbers such as `#!xml 124.5829381` down to `#!xml 124.58` to save critical bytes.
    - **ID minification:** Rename long layer IDs to short sequential strings (for example, `id="layer-1-layer-group-nested"` becomes `id="a"`).
    - **Metadata pruning:** Strip software creator namespaces, XML comments, and unused color profiles.

If you use a [Docs as Code](../doc-stack/docs-as-code.md) workflow, you can add an automated minification script to your [continuous integration (CI) pipeline](../doc-stack/cicd.md#the-pipeline-concept) (such as a [GitHub Actions](https://github.com/features/actions){: target="_blank" rel="noopener" } or [GitLab CI](https://docs.gitlab.com/ee/ci/){: target="_blank" rel="noopener" } step). This automatically optimizes all incoming vector assets in your `images/` directory before the site is generated and published.

---

## Design for high accessibility standards

SVGs render as structural markup within the [Document Object Model (DOM)](https://en.wikipedia.org/wiki/Document_Object_Model){: target="_blank" rel="noopener" }, allowing browsers and screen readers to interact with their internal nodes. To make your complex diagrams accessible to all users, you must format them semantically.

### 1. Semantic wrapper pattern

An accessible vector graphic must explicitly identify itself as an image and point to readable semantic descriptions by using a clean tag pattern:

```xml hl_lines="1-4"
<svg role="img" 
     aria-labelledby="svg-title-01" 
     aria-describedby="svg-desc-01" 
     viewBox="0 0 400 300">
  <title id="svg-title-01">System Architecture Flow</title>
  <desc id="svg-desc-01">
    A diagram showing user requests traveling from the browser 
    to an API Gateway, then routing to a database.
  </desc>

  <!-- Visual paths go here -->
</svg>
```

### 2. Hide decorative elements

Complex illustrations often contain minor details, such as background grids, shadows, or secondary styling lines, that add no informational value. To prevent screen readers from attempting to parse these purely decorative paths, wrap them in a group tag (`<g>`) configured to be invisible to assistive technologies:

```xml
<g aria-hidden="true">
  <!-- Decorative background lines and grid shapes -->
  <line x1="10" y1="10" x2="390" y2="10" stroke="#E2E8F0" />
</g>
```

### 3. Maintain strict color contrast

When you design system charts or text-heavy diagrams, prioritize color contrast. Under [Web Content Accessibility Guidelines (WCAG)](https://www.w3.org/TR/WCAG21/){: target="_blank" rel="noopener" }, text elements within illustrations must maintain a contrast ratio of at least **4.5:1** against their background. For critical non-text structural elements, such as lines in a flowchart or borders of a server block, maintain a contrast ratio of at least **3:1**.

---

## Vector optimization checklist

Apply this checklist to your vector assets before you publish them to your staging environment:

- [ ] **Coordinate precision:** Is decimal precision restricted to a maximum of two decimal places?
- [ ] **Aspect ratio rules:** Does the root `<svg>` tag contain a valid `viewBox` attribute?
- [ ] **Responsive resizing:** Are absolute pixel heights and widths replaced with responsive parameters, such as `width="100%"`?
- [ ] **Semantic attributes:** Are the `role="img"`, `aria-labelledby`, and `aria-describedby` properties explicitly declared in the root element?
- [ ] **Structural cleanup:** Are all hidden designer layers, unused raster layers, and embedded design metadata files stripped?
- [ ] **Contrast verification:** Do all text annotations inside the graphic meet WCAG accessibility ratios in both light and dark display configurations?