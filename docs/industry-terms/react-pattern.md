---
title: ReAct Pattern
description: Learn how the ReAct (Reasoning and Acting) prompt framework combines step-by-step reasoning with external action tools to build reliable AI agents.
revision_date: 2026-08-19
---

# ReAct Pattern

> A design framework that helps large language models solve complex problems by combining step-by-step reasoning with external actions

---

## What is the ReAct pattern?

The ReAct (Reasoning and Acting) pattern is an execution method designed to improve how artificial intelligence (AI) systems solve multi-step problems. Originally developed to help large language models (LLMs) interact with complex environments, the pattern models the human process of alternating between thought and action. In traditional prompt engineering, an LLM often tries to answer a question in a single, unstructured response. This approach frequently leads to logical errors and incorrect data. The ReAct pattern changes this dynamic by requiring the system to alternate between generating explicit reasoning traces (thoughts) and executing environment-specific actions, such as querying an API or searching a file system.

By structuring the problem-solving process, the ReAct pattern acts as a bridge between static text generation and dynamic software tools. For technical writers, developers, and product teams, this pattern is essential for building AI-assisted workflows. It allows an autonomous agent to interact with dynamic resources like databases, API portals, or automated verification scripts. Instead of relying only on pre-trained information, the model uses these tools to gather real-time data, verify facts, and perform specific operations before delivering a final answer.

---

## Why the ReAct pattern is important

In modern software, users expect AI assistants and automated documentation searches to be precise and actionable. When an AI system operates without a structured framework, it is prone to hallucinations—instances where the model generates incorrect information. These errors damage the developer experience (DX) and reduce trust in the product. If a user receives incorrect setup instructions or invalid API examples, they might fail to complete a task and stop using the product.

The ReAct pattern reduces the work for users by moving the tasks of research, data synthesis, and verification to the software. For example, instead of requiring a person to run link checkers or verify schema compliance manually, a ReAct-powered agent can perform these validation steps automatically. This approach ensures that the information delivered to the audience is accurate and current.

---

## Principles and structure

The ReAct pattern operates as a continuous loop of reasoning and action. The model repeats this sequence until it has enough information to answer the user query.

*   **Thought (Reasoning):** The model analyzes the current state of the problem, documents what it knows, and plans its next step. These reasoning traces help developers debug the model's logic and allow users to follow the agent's decision-making process.
*   **Action (Acting):** The model selects a specific tool from a predefined list—such as a search engine, a command-line interpreter, or a database query tool—and runs it with specific parameters.
*   **Observation (Learning):** The system returns the tool output to the model. The model analyzes the results to determine if it has solved the user query or if it needs to repeat the loop.

---

## Design pattern example

The following diagram shows how the ReAct loop manages a query, followed by an example of an execution trace.

```mermaid
graph TD
    Start([User Query]) --> Thought[Thought: Plan the next step]
    Thought --> Action[Action: Call external tool]
    Action --> Observation[Observation: Get tool output]
    Observation --> Decision{Is the task<br/>complete?}
    Decision -- No --> Thought
    Decision -- Yes --> FinalAnswer([Final Answer])

    style Start fill:#f9f,stroke:#333,stroke-width:2px
    style FinalAnswer fill:#00d5ff,stroke:#333,stroke-width:2px
```

### Breakdown of the pattern

The model receives a query and coordinates its reasoning and actions in a structured format:

```markdown
**User Input:** Verify if the API endpoint `/v1/users` is currently active.

**Thought 1:** I need to check the active API routes in the system configuration database to verify if `/v1/users` exists and is functional. I will use the `database_lookup` tool.
**Action 1:** `database_lookup("/v1/users")`
**Observation 1:** `{"status": "deprecated", "replacement": "/v2/users", "active": false}`

**Thought 2:** The database indicates `/v1/users` is inactive and has been deprecated in favor of `/v2/users`. I should now check if `/v2/users` is active using the `endpoint_validator` tool to provide a complete answer.
**Action 2:** `endpoint_validator("/v2/users")`
**Observation 2:** `{"status_code": 200, "response_time": "45ms", "active": true}`

**Thought 3:** I have confirmed that `/v1/users` is inactive and `/v2/users` is active with a successful status code of 200. I can now generate the final answer.
**Final Answer:** The endpoint `/v1/users` is no longer active. It has been deprecated and replaced by `/v2/users`, which is currently active and operational.
```

??? note "Prompt template instructions"
    To instruct an LLM to follow this pattern, define the available tools in the system prompt and require the model to use the exact `Thought / Action / Observation` format. You can reinforce this structure by providing examples of a successful loop in the prompt configuration.

---

## Impact on user experience

Structuring AI interactions with the ReAct pattern influences user behavior and task success:

- **Higher confidence in results:** Because the system shows its thoughts and actions, users can trace the logic. This transparency builds trust.
- **Reduced friction:** Instead of requiring users to search through documentation or run manual tests, the pattern automates the retrieval and checking of facts.

---

## Implementation best practices

To deploy the ReAct pattern effectively, follow these guidelines:

- **Use descriptive tool schemas:** When you register tools for the model, write clear and descriptive schemas. The model uses these descriptions to decide which tool to select.
- **Set a loop limit:** AI agents can enter infinite loops if a tool returns unexpected errors. Always implement a limit (such as a maximum of five loops) to prevent high latency and costs.
- **Validate the action format:** Use parser guards in your code to ensure the model formats its actions correctly. If the model generates an invalid syntax, prompt the model to correct it.

---

## Common anti-patterns

Avoid these mistakes when implementing the ReAct pattern:

- **The Infinite Reasoner:** Forcing the model to generate detailed thoughts without taking action. This increases latency without providing value.
- **Blind Action Execution:** Allowing the model to call tools without generating a "Thought" statement first. This makes it difficult to debug why the model chose a specific tool if a failure occurs.

---

## How to validate usability

To verify that your ReAct implementation works for readers, use these strategies:

- **Measure the latency-to-value ratio:** Track how long it takes to deliver a helpful answer compared to the number of tool iterations. A high number of loops might mean tool descriptions are unclear.
- **Conduct user observation testing:** Observe users as they interact with the final answers. Ask if seeing the reasoning steps helps them or if the information clutters the interface. Use this feedback to decide whether to hide reasoning steps behind an expandable UI element.