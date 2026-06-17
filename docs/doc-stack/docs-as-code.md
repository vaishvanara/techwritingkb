---
icon: lucide/file-json
title: "Docs as Code philosophy"
description: The methodology of using developer tools and workflows to manage documentation files
revision_date: 2026-05-15
---

# Docs as Code philosophy
*The methodology of using developer tools and workflows to manage documentation files*

---

Documentation as Code (Docs as Code) is a professional philosophy that treats documentation with the same rigor, tools, and processes as software source code. By moving documentation into the same environment where developers work, teams can ensure that information is as accurate, tested, and [versioned](../doc-stack/git.md) as the product itself.

Docs as Code is more than just choosing a tool. It is a cultural shift that prioritizes automation, transparency, and collaboration.

---

## Core principles

The foundation of Docs as Code is the use of [American Standard Code for Information Interchange (ASCII)](https://en.wikipedia.org/wiki/ASCII){: target="_blank" rel="noopener" } or [UTF-8](https://en.wikipedia.org/wiki/UTF-8){: target="_blank" rel="noopener" } plain text. Unlike binary formats such as .docx or .pdf, plain text is *transparent*.

- **Transparency:** Anyone can open the file in any editor.
- **Diff-ability:** [Version control systems](../doc-stack/git.md) can show exactly which characters changed between two versions because the files are text.
- **Automation-ready:** Scripts can parse text-based content to automatically generate site maps, validate links, and check for inclusive language.

!!! NOTE
    By using [plain text markup](../doc-stack/markup-languages.md) such as Markdown or AsciiDoc, technical writers separate content from presentation. You write the text once, and the transformation engine handles the styling later.

---

## Writer-developer alignment

In traditional workflows, technical writers often worked in *silos* and used proprietary tools that developers did not understand. Docs as Code closes this gap. When a technical writer uses Git, Markdown, and an IDE, they speak the same language as the engineering team.

- **Alignment benefits:**
    - **Shared infrastructure:** Documentation lives in the same repository as the code.
    - **Simplified reviews:** Developers can review documentation directly in the code editor during their normal review cycles.
    - **Reduced friction:** You do not need to export, email, or upload files to a separate portal.

---

## Continuous documentation

The agile mantra to *"ship early and often"* applies to documentation in a Docs as Code environment. This is often referred to as *continuous documentation*.

Instead of waiting for a "Big Bang" release at the end of a six-month cycle, documentation is updated incrementally. Every small bug fix in the code can be accompanied by a small update to the documentation. This ensures that the documentation is never stale and reflects the current state of the software in real-time.

---

## Automated quality gates

In software, code must pass tests before it is merged. Docs as Code applies this same logic by using *automated quality gates*. When a writer submits a [pull request](../doc-lifecycle/review-approval.md), a series of automated scripts (often called a [CI/CD pipeline](../doc-stack/cicd.md)) runs to verify the quality:

1.  **Build check:** Does the site still build, or did a syntax error break it?
2.  **Link validation:** Do 404 errors or broken internal links exist?
3.  **Style linting:** Does the prose follow the [company style guide](../doc-stack/prose-linting.md)?
4.  **Spell check:** Are there any typographical errors in the new content?

!!! failure "Build failure"
    If any of these tests fail, the *Quality Gate* stays closed. The technical writer must fix the error before the documentation can be merged into the production site.

---

## Collaborative ownership

In the old model, the technical writer acted as a gatekeeper who was the only person allowed to modify the manual. In Docs as Code, the technical writer becomes a *facilitator*. 

An engineer who notices a typographical error or a missing parameter can fix it immediately by making a pull request because the docs are in [Git](../doc-stack/git.md). The technical writer still provides the final editorial oversight, but the entire team feels a sense of collaborative ownership over the documentation.

---

## Scalability

Docs as Code is unique in the sense that it allows a small team or even a single writer to manage thousands of pages across dozens of products. 

- **Content reuse:** Use *snippets* to use the same text in multiple places.
- **Global updates:** Change a variable, such as a product name, in one file to update the entire site.
- **Programmatic generation:** Automatically pull code comments or [API schemas](../doc-stack/openapi.md) into the documentation pages.

---

## Evolution of the technical writer

The transition to Docs as Code marks a fundamental change in the [career path](../references/career-paths.md) of a technical writer.

=== "Traditional model"
    - **Focus:** Writing and formatting.
    - **Tools:** [Microsoft Word](https://www.microsoft.com/en-us/microsoft-365/word){: target="_blank" rel="noopener" }, [Adobe FrameMaker](https://www.adobe.com/products/framemaker.html){: target="_blank" rel="noopener" }, [Adobe Acrobat](https://www.adobe.com/acrobat.html){: target="_blank" rel="noopener" }.
    - **Workflow:** Waterfall (documentation is the final step).
    - **Output:** Static PDFs or printed manuals.
    - **Role:** An editor who works alone.

=== "Docs as Code model"
    - **Focus:** [Content engineering](../technical-writing/content-design-foundations.md) and [information architecture](../references/ia-design.md).
    - **Tools:** [Visual Studio Code](https://code.visualstudio.com/){: target="_blank" rel="noopener" }, Git, Markdown, CI/CD pipelines.
    - **Workflow:** [Agile](../doc-lifecycle/agile-workflows.md) (docs evolve with the code).
    - **Output:** Interactive, searchable web portals.
    - **Role:** An [information architect](../references/ia-design.md) who facilitates team-wide contributions.

---

### Implementation maturity model

How far along is your organization in the Docs as Code journey? Use the following grid to identify your current stage and the next steps for improvement.

<div class="grid cards" markdown>

-   ### **Stage 1: Migration**
    Moving away from binary formats.
    - [ ] Move content to Markdown.
    - [ ] Store files in a Git repository.
    - [ ] Use basic local builds.

-   ### **Stage 2: Integration**
    Aligning with engineering.
    - [ ] Docs live in the code repo.
    - [ ] Engineers contribute via PRs.
    - [ ] Basic link-checking automation.

-   ### **Stage 3: Optimization**
    Advanced automation and scaling.
    - [ ] Automated style linting (Vale).
    - [ ] Multi-version support.
    - [ ] CI/CD auto-deployment.

</div>

!!! TIP
    You do not need to reach Stage 3 overnight. Start by moving one project to a Git-based workflow and let the team see the benefits of transparent, collaborative editing first.
