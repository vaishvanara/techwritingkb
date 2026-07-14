---
icon: lucide/gauge
title: Readability score methodologies
description: "Using Flesch-Kincaid and other formulas to objectively measure and improve content clarity."
revision_date: 2026-05-13
---

# Readability score methodologies
> *Using Flesch-Kincaid and other formulas to objectively measure and improve content clarity*

---

Readability is a quantitative measure of how easily a reader can process and understand a written text. In technical documentation, readability scores provide an objective, data-driven way to ensure that content is accessible to its intended audience. 

By using linguistic formulas, technical writers can move beyond subjective feelings about clarity and instead rely on metrics that correlate with comprehension.

---

## Readability formulas

Readability formulas generally analyze two primary variables: word complexity (based on syllables or character length) and sentence complexity (based on word count). 

- **[Flesch-Kincaid grade level](https://en.wikipedia.org/wiki/Flesch%E2%80%93Kincaid_readability_tests){: target="_blank" rel="noopener" }:** This is the most widely used formula in the industry. It translates scores into a US school grade level and relies heavily on average sentence length and average syllables per word.
- **[Gunning fog index](https://en.wikipedia.org/wiki/Gunning_fog_index){: target="_blank" rel="noopener" }:** This index is particularly effective for business and technical writing. It calculates a grade level by looking at the percentage of complex words (words with three or more syllables) in relation to average sentence length.
- **[Coleman-Liau index](https://en.wikipedia.org/wiki/Coleman%E2%80%93Liau_index){: target="_blank" rel="noopener" }:** Unlike other formulas, the Coleman-Liau index does not count syllables. Instead, it relies on characters per word. This makes it more accurate for automated tools, as character counts are more reliably calculated by software than syllable counts.
- **[Automated readability index (ARI)](https://en.wikipedia.org/wiki/Automated_readability_index){: target="_blank" rel="noopener" }:** This formula focuses on character-to-word and word-to-sentence ratios. It was originally designed for technical manuals in the military and is excellent for measuring high-speed scannability.

---

## Targeting the sweet spot

While technical writers deal with complex subjects, the language used to describe those subjects should remain simple. The industry standard for technical software documentation is an eighth-grade reading level.

**Why the eighth grade?**

1.  **Cognitive budget:** Even expert readers prefer simple language when they are in a lean-forward state, such as when troubleshooting a crisis. Complex sentences waste their limited cognitive energy.
2.  **Global reach:** A significant portion of your audience may be non-native English speakers. An eighth-grade reading level allows them to understand the logic without struggling with the vocabulary.
3.  **Accessibility:** Simple sentence structures are more easily processed by screen readers and translation software.

---

## Tooling for measurement

Modern documentation workflows integrate readability checks directly into the authoring environment.

- **[Hemingway Editor](https://hemingwayapp.com/){: target="_blank" rel="noopener" }:** A visual tool that highlights hard-to-read sentences in yellow and very-hard-to-read sentences in red. It provides an instant grade-level score.
- **[Vale](https://vale.sh/){: target="_blank" rel="noopener" }:** A [Docs as Code](../doc-stack/docs-as-code.md) tool that allows you to set specific readability goals. You can configure Vale to fail a build if the Flesch-Kincaid score rises above a certain grade level.
- **[Readable.com](https://readable.com/){: target="_blank" rel="noopener" } or [Grammarly](https://www.grammarly.com/){: target="_blank" rel="noopener" }:** These platforms provide deep dives into reachability, indicating what percentage of the public can understand your draft.

---

## The limitations of scores

A high readability score does not always guarantee high-quality content. It is important to remember that these formulas are mathematical, not semantic.

!!! warning "Mathematical versus semantic"
    A formula cannot tell if your instructions are accurate or if your logic is sound. You could write a perfectly readable sentence that is technically incorrect or complete nonsense. Readability scores should be one part of a larger review process that includes technical sign-off and peer review.

---

## Sentence length vs. word complexity

When a document receives a poor readability score, you must decide which variable to address.

- **Sentence length:** This has the highest impact on comprehension. Long sentences (over 25 words) force the brain to hold too much information in working memory before reaching a period. 
    - **Action:** Split the sentence.

- **Word complexity:** Sometimes, multisyllabic words are unavoidable (for example, "authentication"). However, unnecessary big words, such as "facilitate" instead of "help," drive up the grade level without adding value. 
    - **Action:** Swap for a simpler synonym.

---

## Contextual auditing

There are times when you should deliberately ignore a readability score.

- **Legal and compliance documents:** High-stakes legal text often requires specific, complex terminology that cannot be simplified without losing legal meaning.
- **Scientific references:** If you are writing for a specialized audience of PhD researchers, an eighth-grade reading level might feel patronizing or lack the necessary precision.
- **API parameters:** Formulas often misinterpret code snippets or API parameters as complex words, artificially inflating the grade level.

!!! info "The jargon exception"
    If a complex term is a core concept that the user must know, do not simplify the word. Instead, simplify the sentences around it to keep the overall cognitive load low.

---

## Score improvement guide

To lower the grade level and improve the clarity of your documentation, apply these tactical changes:

1.  **Avoid nominalizations.** Turn nouns back into verbs.
    - *Before: "The implementation of the update must occur."*
    - *After: "Implement the update."*
2.  **Remove "which" and "that."** These often signal unnecessary subordinate clauses.
    - *Before: "The server, which is located in the cloud, is secure."*
    - *After: "The cloud server is secure."*
3.  **Use the and/but split.** If you see the word "and" or "but" in the middle of a sentence, check whether you can replace it with a period.

---

## Readability audit workflow

To ensure consistent quality across your documentation site, follow this four-step audit process before publishing:

1.  **Automated scan:** Run the content through Hemingway or a Vale linter to identify the baseline grade level.
2.  **Structural triage:** Identify sentences over 25 words. Split them into two or more direct instructions.
3.  **Vocabulary audit:** Identify three-syllable words. Check the [plain language guide](../technical-writing/plain-language.md) for simpler synonyms.
4.  **Verification:** Rescan the document. If the score is between grades seven and nine, and the technical accuracy is verified, the document is ready for production.