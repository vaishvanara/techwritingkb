---
icon: lucide/copy
title: Documentation reference templates
description: "Standardized templates for common documentation deliverables"
revision_date: 2026-05-25
---

# Documentation reference templates
*Standardized templates for common documentation deliverables*

---

Templates are the foundation of consistent documentation. They reduce [cognitive load](../technical-writing/cognitive-load.md) for the writer and provide a predictable [information architecture](../references/ia-design.md) for the reader. 

You can use the following templates to maintain consistency across your project and reduce writer’s block during the drafting phase.

---

## Quick start guide

The Quick Start Guide (QSG) is a high-level, action-oriented document designed to help users achieve their first milestone, such as a successful installation or a "Hello World" project, in less than five minutes. The QSG focuses strictly on the path of least resistance.

| Section | Status | Description |
| :--- | :--- | :--- |
| **Goal statement** | Mandatory | A single sentence describing the success the user will achieve |
| **Prerequisites** | Mandatory | Minimum software or hardware versions and any required API keys |
| **Installation** | Mandatory | The most common way to install the tool (for example, [npm](https://www.npmjs.com/){: target="_blank" rel="noopener" } or [brew](https://brew.sh/){: target="_blank" rel="noopener" }). |
| **Basic usage** | Mandatory | A simple code snippet or three-step process to verify functionality |
| **Next steps** | Optional | Links to the full tutorial or [API Reference](../doc-stack/openapi.md) |

### QSG template

```markdown
# Quick start: [Product Name]

Get started with [Product] by setting up your environment and running your first command.

## Prerequisites
- [For example, Node.js version 18 or later]
- [For example, an active API key]

## 1. Install
`[Installation command here]`

## 2. Configure
`[Configuration command or file update]`

## 3. Run
`[Simple command to verify success]`

## Next steps
Now that you're set up, check out our [Full Tutorial] to build your first app.
```

---

## README.md

The README file is the primary entry point for your [code repository](../doc-stack/git.md). It provides immediate orientation for developers and potential contributors, explaining what the project is and why it exists.

| Section | Status | Description |
| :--- | :--- | :--- |
| **Project title** | Mandatory | The name of the project and a tagline |
| **Description** | Mandatory | Two or three sentences about the problem this project solves |
| **Installation** | Mandatory | Step-by-step instructions to run the environment |
| **Usage** | Mandatory | Common examples of how to interact with the code |
| **Contributing** | Optional | Brief instructions or a link to the `CONTRIBUTING.md` file |
| **License** | Mandatory | A link to the LICENSE file (for example, [MIT](https://opensource.org/license/mit/){: target="_blank" rel="noopener" } or [Apache](https://www.apache.org/licenses/LICENSE-2.0/){: target="_blank" rel="noopener" }) |

### README template

```markdown
# [Project Name]
> [Concise tagline]

[Detailed description of the project's value proposition.]

## Installation
[Step-by-step commands]

## Usage
[Code block with common usage examples]

## Contributing
Please read [CONTRIBUTING.md] before submitting a pull request.

## License
Distributed under the [Name] License. See `LICENSE` for more information.
```

---

## Technical specifications and FGDs

Technical specifications provide in-depth architecture details. For complex systems, use a Functional Group Description (FGD) to divide the system into logical clusters of features or modules.

| Section | Status | Description |
| :--- | :--- | :--- |
| **System overview** | Mandatory | High-level architecture and the comprehensive logic |
| **FGD section** | Mandatory | An FGD for each major module |
| **Data flow** | Mandatory | Descriptions of how data moves between functional groups |
| **Security specs** | Optional | Authentication and encryption protocols used |
| **Roadmap** | Optional | Future technical changes or known limitations |

### Technical specifications template

```markdown
# Technical specification: [System Name]

## System overview
[High-level architecture description]

## Functional group description (FGD): [Module Name]
- **Purpose:** [What this specific module does]
- **Logic:** [Core algorithms or business rules]
- **Dependencies:** [What other modules it relies on]

## Data flow
1. User triggers [Action].
2. [Module A] passes data to [Module B] via [Protocol].
3. Database updates [Table Name].

## Security specs 
[Optional: Detail authentication protocols, encryption standards at rest or in transit, and role-based access control (RBAC) requirements.] 

## Roadmap 
[Optional: Outline future technical enhancements, planned refactoring, or known architectural limitations to be addressed in later versions.]
```

---

## Release notes

Release notes communicate changes over time, helping users manage the transition between software versions.

| Section | Status | Description |
| :--- | :--- | :--- |
| **Header** | Mandatory | Version number and release date |
| **Summary** | Optional | High-level theme of the release (for example, "The Security Update") |
| **What’s new** | Mandatory | A list of new features or enhancements |
| **What’s fixed** | Mandatory | A list of resolved bugs or performance improvements |
| **Breaking changes** | Mandatory | Critical changes that require user action |

### Release notes template

```markdown
# Release notes: Version [0.0.0] ([Date])

## Summary
This release focuses on [Primary Goal].

## What’s new
- [Feature 1]: [Brief description]
- [Feature 2]: [Brief description]

## What’s fixed
- Resolved issue where [Bug Description].
- Improved performance of [Function].

## Breaking changes
- [Change]: Users must update [Config File] to maintain compatibility.
```

---

## Standard document structure (back matter)

Professional documentation requires an organized conclusion to house supplemental information. This section is collectively known as the back matter.

### Appendix

Use an appendix for supplemental materials that are too complex for the main body of the document.

- **Charts and graphs:** Full-page visualizations
- **Raw data:** Tables of error codes, country codes, or legacy IDs
- **Extended logic:** Mathematical proofs or complex regular expression patterns

### Back matter layout

The back matter should be organized in the following order:

1. **Appendix:** (A, B, C...)
2. **Glossary:** Links to term definitions
3. **Bibliography and references:** Links to external standards or sources
4. **Index or site map:** For large-scale printed or PDF manuals
5. **Contact and support:** Information on how to get further assistance