---
title: Translation memory
description: A database of bilingual text segments that stores previously translated content to improve linguistic consistency and reduce localization costs.
revision_date: 2026-09-03
---

# Translation memory

> *A database of bilingual text segments that stores previously translated content to improve linguistic consistency and reduce localization costs*

---

## What is translation memory?

Translation memory (TM) stores previously translated segments, such as sentences, headers, or paragraphs, as translation units (TUs) consisting of a source string and its corresponding target string. When authors create or update documentation, the system scans this database for existing matches. If the system finds a match, it retrieves the approved translation for reuse. 

Within a modern software development life cycle, the TM pipeline integrates directly with continuous integration and continuous delivery (CI/CD) systems. After source text is finalized, the pipeline synchronizes source repositories with a central translation management system (TMS) through application programming interfaces (APIs) or command-line interface (CLI) tools. While localization leads manage the database maintenance and workflow, software engineers handle the automation scripts, and linguists and quality assurance (QA) teams validate matches before the final delivery.

---

## Why it matters

Manual localization workflows often struggle with repetitive content. In rapid release cycles, updates are frequently minor, such as fixing a typo or adjusting a single step in a procedure. Without translation memory, these small changes can trigger the cost of retranslating an entire file or page because the context has changed.

Automated TM retrieval identifies these minor deltas and applies approved translations to identical strings instantly. This ensures that user manuals, help centers, and user interface (UI) elements remain synchronized. By paying only for new or modified strings and a reduced fuzzy match rate for similar strings, organizations decouple localization costs from content volume.

!!! info "Pro Tip"
    A glossary, or termbase, defines specific terminology or product names; translation memory stores complete strings in context. Use both to ensure technical accuracy and stylistic consistency.

---

## When to adopt this workflow

- **Inefficient cost scaling:** Your localization budget is growing linearly with your documentation volume, which indicates a lack of content reuse.
- **Terminological drift:** Identical UI elements, such as buttons or error messages, appear with conflicting translations across different pages or platforms.
- **Update bottlenecks:** Frequent documentation updates are delayed by translation turnaround times for content that is largely unchanged.
- **Docs as code migration:** You are moving to an automated, repository-based publishing pipeline where manual file handoffs are no longer viable.

---

## How the workflow works

```mermaid
graph TD
    A[Commit & PR] --> B[Push to TMS & Segment Parsing]
    B --> C[TM Leveraging & Analysis]
    C --> D[Translation & Review]
    D --> E[TM Database Commit]
    E --> F[Automated PR with Localized Files]
```

1.  **Parsing and leveraging:** When content changes are merged into the source branch, the CI/CD pipeline pushes source files, such as Markdown and JSON, to the TMS. The system parses the text into segments and performs a TM lookup to find exact (100%) or fuzzy matches.
2.  **Production:** The system populates the project with matches. Translators or machine translation (MT) engines then process only the new words or fuzzy matches. 
3.  **Validation and write-back:** Once the linguist approves the segments, the updated pairs are committed to the master TM database. The system then compiles the translated content into the target format and returns it to the development repository through an automated pull request.

---

## RACI and team roles

- **Responsible:** Software engineers (API and CI/CD integration) and linguists and translators (content translation and TM cleanup).
- **Accountable:** Localization managers or documentation leads (database integrity, cost management, and vendor service level agreements).
- **Consulted:** Technical writers and subject matter experts (SMEs) (source content clarity and technical context).
- **Informed:** QA and product managers (notification of build status for localized versions).

---

## Pipeline integration and tooling

Modern development replaces manual file handoffs with CLI tools or continuous localization connectors. These tools monitor Git branches and push source updates to the TMS through an API as they occur. 

Inside the translation platform, the system pretranslates files by using the TM database. Many teams employ hybrid models where MT provides a baseline for new strings, but TM takes priority to ensure high-accuracy branding remains untouched. This is often referred to as TM-augmented MT. Once localized files return to the repository, they trigger standard build tests and deployment scripts.

---

## Troubleshooting and common points of failure

- **Tag and placeholder mismatch:** Minor changes to markup, such as shifting inline code backticks or bold tags, can cause an exact match to drop to a fuzzy match, which increases costs. 
    - **Solution:** Configure TMS parsers to treat inline tags as non-translatable placeholders and use internal tag weighting to ignore minor positioning shifts where possible.
- **Database pollution:** Saving incorrect, unreviewed, or conflicting translations, for example, from different product lines, to the master database causes errors to propagate.
    - **Solution:** Implement a multi-tier TM strategy, such as project TM versus master TM, and restrict master database write-access to senior editors.
- **Segmentation breakers:** Changing how a sentence is split, such as adding a hard return in the middle of a sentence, prevents the TM from recognizing the string.
    - **Solution:** Enforce standardized Markdown linting and Segmentation Rules eXchange (SRX) rules across source content.

---

## Key metrics and success criteria

- **TM leverage (savings %):** The percentage of words recovered from the TM. This is calculated as `(Total Wordcount - Weighted Wordcount) / Total Wordcount`.
- **Post-editing distance:** The amount of effort or change required to correct a TM or MT suggestion.
- **Localization cycle time:** The duration between a source content commit and the deployment of the localized page.