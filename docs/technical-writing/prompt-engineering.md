---
icon: lucide/bot
title: Prompt engineering for technical writers
description: How to use large language models (LLMs) to draft, summarize, and explain complex code logic
revision_date: 2026-05-13
---

# Prompt engineering for technical writers
*How to use large language models (LLMs) to draft, summarize, and explain complex code logic*

---

For the modern technical writer, generative AI and LLMs are not replacements for writing; they are sophisticated co-pilots for information processing. 

Prompt engineering (crafting precise inputs to get high-quality outputs) allows technical writers to automate the tedious parts of documentation with the help of AI while focusing their effort on strategy, empathy, and technical accuracy. 

---

## The AI as a drafting partner

The most effective use of AI is overcoming the *blank page syndrome*. By feeding an LLM raw notes from a subject matter expert (SME) interview or a rough recording transcript, you can generate initial structures.

- **Outline generation:** Provide the LLM with the project's user need statement and ask for a logical heading (H2/H3) structure.
- **Iterative drafting:** Do not ask the LLM to write the article. Instead, ask it to draft a three-step installation guide based on these bullet points.
- **Summarization:** Use an LLM to distill long internal design documents into a *Key Takeaways* section for a high-level overview.

---

## Context window management

The context window is the LLM's working memory, or the amount of text that the model can process at one time. Understanding this is critical for technical accuracy.

- **Token limits:** LLMs process text in tokens. If you paste a 50,000-line codebase, the LLM will lose track of the beginning by the time it reaches the end.
- **Strategic chunking:** To get the best results, feed the LLM small, relevant chunks. If you are documenting a specific API endpoint, only provide the relevant controller file and the data model, not the entire repository.
- **In-context learning:** Provide the LLM with examples of your preferred style within the prompt. This *few-shot prompting* significantly improves output quality.

!!! danger "The hallucination risk"
    The further you move from the information provided in the context window, the more likely the LLM is to hallucinate. In this case, the LLM might invent parameters, code functions, or facts that sound plausible but are false.

---

## Role-based prompting

You can dramatically change the tone and depth of an LLM's output by assigning it a specific persona. This is particularly useful for peer reviews.

**Example prompts:**

- *"Act as a senior editor. Review the following paragraph for passive voice and wordiness. Provide a before and after comparison."*
- *"Act as a novice user with no coding experience. Read this tutorial and identify any steps where I used undefined jargon or made expert assumptions."*
- *"Act as a QA engineer. Look at these instructions and identify potential edge cases or ways the user could break the system."*

---

## Code-to-prose translation

One of the most powerful specialist skills is using LLMs to bridge the gap between source code and human language.

=== "Input (JavaScript)"
    ```javascript
    function calculateTax(price, type) {
      if (type === 'digital') return price * 1.05;
      if (type === 'physical') return price * 1.10;
      return price;
    }
    ```

=== "Output (Prose)"
    **Prompt:** *"Explain this function logic as a bulleted list for a non-technical user."*

    **AI response:**

    - If the item is **digital**, a 5% tax is applied.
    - If the item is **physical**, a 10% tax is applied.
    - For all other types, no tax is applied.

---

## Style guide enforcement

You can use LLMs to automate the low-level editing that usually takes up hours of a writer's time.

- **Constraint-based prompting:** *"Rewrite this paragraph. Constraints: Use active voice, keep sentences under 20 words, and do not use the word utilize."*
- **Style guide ingestion:** You can paste a specific section of your company style guide and ask the LLM to follow the rules in that section. Example: *"Audit the following text against these rules."*

---

## Fact-checking and human-in-the-loop

Technical documentation must be 100% accurate. Because an LLM is a probabilistic engine (it predicts the next most likely word), it does not know if a technical fact is true.

**Verification workflow:**

1.  **Generate:** Use AI to draft the explanation.
2.  **Verify:** Manually test the AI-generated code snippets or instructions against the actual software.
3.  **Refine:** Correct the AI errors and feed the corrections back into the prompt to steer the next output.

---

## Ethics and security

When using public AI tools (such as [ChatGPT](https://openai.com/chatgpt){: target="_blank" rel="noopener" } or [Claude](https://www.anthropic.com/claude){: target="_blank" rel="noopener" }), you must be extremely careful with company data.

- **Data leakage:** Unless you are using an enterprise version with a zero-retention policy, anything you paste into an AI can be used to train future models.
- **PII removal:** Never paste personally identifiable information (PII), such as emails, real names, or API keys, into a prompt.
- **IP protection:** Avoid pasting proprietary algorithms. Focus on using LLMs for the public-facing, commoditized parts of your documentation.

---

## Master prompt template

To get the most professional results, use this four-part structure for your prompts. This ensures the LLM has enough context to avoid generic or robotic responses.

| Component | Description | Example |
| :--- | :--- | :--- |
| **Role** | Tell the AI who it is. | *"You are a senior technical writer specializing in API documentation."* |
| **Context** | Give it the background data. | *"I am writing a guide for a new payment gateway. Here are the raw notes from the developer: `[Paste Notes]`."* |
| **Task** | Tell it exactly what to do. | *"Create a three-step Quick Start guide from these notes."* |
| **Format** | Define the output style. | *"Use clean Markdown, H3 headers, and a table for parameter descriptions."* |

???+ example "Step-by-step AI workflow: from code to tutorial"
    1.  **Ingestion:** Paste a complex code function into the prompt.
    2.  **Logic extraction:** Ask: *"What are the inputs, the process, and the outputs of this code?"*
    3.  **Drafting:** Ask: *"Write a how-to guide for a developer based on that logic."*
    4.  **Refinement:** Ask: *"Now rewrite that guide to follow the [Microsoft Writing Style Guide](https://learn.microsoft.com/en-us/style-guide/welcome/){: target="_blank" rel="noopener" }."*
    5.  **Human audit:** Take the final draft, test the code, and add the human empathy that AI cannot replicate.

