---
icon: lucide/braces
title: JSON payload structures
description: "A practical guide for reading, documenting, and validating JSON data structures for API reference guides."
revision_date: 2026-07-23
---

# JSON payload structures

> *How to read, document, and validate JSON data structures for API reference guides*

---

JavaScript Object Notation (JSON) is the standard data format of the modern web. As the primary data format for [REST, GraphQL, and event-driven APIs](../doc-stack/emerging-architectures.md), it dictates how applications exchange information. 

Documenting JSON payloads involves more than copying and pasting raw code blocks into a template. It requires analyzing data types, understanding nesting architecture, and defining strict validation rules. If your payload documentation is inaccurate or vague, developers will struggle with integration errors, and support requests will increase.

This guide covers the technical mechanics of JSON, how to break down complex nested payloads for documentation, and how to use [JSON Schema](../doc-stack/metadata-frontmatter.md#json-schema-example) for automated structural validation.

---

## Anatomy of a JSON payload

A JSON payload is a text-based representation of structured data. It consists of key-value pairs and ordered lists. When you document JSON payloads, you must accurately categorize each value into one of its six built-in data types.

```json linenums="1" hl_lines="2 3 4 5 6 10"
{
  "transaction_id": "tx_987216",
  "retry_count": 3,
  "is_sandbox": false,
  "metadata": null,
  "billing_address": {
    "street": "100 Main St",
    "postal_code": 10001
  },
  "items": [
    {
      "sku": "SKU-882",
      "price": 29.99
    }
  ]
}
```

### JSON data types reference

Understanding these data types is essential for writing accurate documentation tables:

*   **String (Line 2):** Text wrapped in double quotation marks (for example, `"tx_987216"`).
*   **Number (Line 3):** An integer or a floating-point number. This data type does not use quotation marks (for example, `3` or `29.99`).
*   **Boolean (Line 4):** Either `true` or `false`. This data type does not use quotation marks.
*   **Null (Line 5):** Represents an empty or missing value (for example, `null`).
*   **Object (Line 6):** A collection of nested key-value pairs wrapped in curly braces `{}`.
*   **Array (Line 10):** An ordered list of values wrapped in square brackets `[]`. Arrays can contain strings, numbers, objects, or nested arrays.

---

## Three ways to document payload architectures

When you document an API endpoint, presenting a raw JSON file is rarely sufficient. Developers need to know which fields are optional, their constraints, and their structural types. Provide multiple complementary views of the payload using a tabbed interface.

=== "1. Annotated payload"
    This view displays a clean, readable example of the JSON file containing realistic mock data. Use this as a quick visual reference.

    ```json
    {
      "event_type": "user.signup",
      "account_tier": "premium",
      "referral_code": null
    }
    ```

=== "2. Markdown table schema"
    This is the industry standard for reference manuals. This format maps out the properties, explicit types, required status, and definitions.

    | Field | Type | Required? | Description |
    | :--- | :---: | :---: | :--- |
    | `event_type` | String | **Yes** | The name of the event triggering the webhook. |
    | `account_tier` | String | **Yes** | The subscription level. Allowed values: `free`, `pro`, `premium`. |
    | `referral_code` | String | No | The marketing code used during signup. Returns `null` if none. |

=== "3. JSON Schema definition"
    Providing a machine-readable JSON Schema enables developers to import your rules directly into their local testing suites or automation frameworks.

    ```json
    {
      "$schema": "https://json-schema.org/draft/2020-12/schema",
      "type": "object",
      "properties": {
        "event_type": { "type": "string" },
        "account_tier": { "type": "string", "enum": ["free", "pro", "premium"] },
        "referral_code": { "type": ["string", "null"] }
      }
    }
    ```

---

## Documenting nested complexity: Arrays of objects

Incorrectly representing nested objects and arrays is a common error in [API documentation](../doc-stack/openapi.md). When an object contains an array of other objects, a flat table is often insufficient. 

To document complex structures clearly, use hierarchical dot notation in your schema tables to represent the depth of the nesting.

```json hl_lines="4 5"
{
  "order_id": "ord_5521",
  "discounts": [
    { "code": "SUMMER10", "amount": 10.00 },
    { "code": "WELCOME5", "amount": 5.00 }
  ]
}
```

To represent this structure clearly, use the following format in your table or list:

*   `order_id` (String): The top-level unique identifier for the order.
*   `discounts` (Array of Objects): A list of promotional discounts applied to this order.
*   `discounts[].code` (String): The promotional coupon code alphanumeric string.
*   `discounts[].amount` (Number): The monetary value subtracted from the order total.

!!! info "The bracket indicator"
    Using empty square brackets `[]` in the parameter name (for example, `discounts[].code`) indicates to a developer that the property exists inside a list of objects rather than as a singular direct key.

---

## Validating payloads with JSON Schema

If you use a [Docs as Code](../references/portfolios.md#docs-as-code-workflow) workflow, you can use JSON Schema to validate your documentation examples automatically. This ensures that when an engineer changes an API output, your JSON payload examples are checked for compliance before the site is built.

???+ note "Understanding validation rules"
    A schema does not just check if the syntax is valid JSON; it enforces semantic constraints on the properties.
    
    - **Enforcing ranges:** You can define a minimum and maximum for numbers:
      `#!json "minimum": 1, "maximum": 5`
    - **Regular expression matching:** You can force strings to follow a pattern (such as UUID formats or email addresses):
      `#!json "pattern": "^[a-z0-9-]+$"`
    - **Required arrays:** You can ensure certain properties are present:
      `#!json "required": ["username", "email"]`

If your build pipeline includes an automated JSON validator, any typographical errors in your code blocks, such as a missing comma or a mismatched bracket, will fail the validation step, preventing broken code examples from being published.

---

## Payload formatting and debugging tips

When you create or modify JSON payload examples, keeping the file clean and readable is essential for maintaining professional documentation.

!!! tip "Formatting shortcuts"
    In Visual Studio Code, you can instantly indent the JSON payload by pressing **Alt+Shift+F** (Windows) or **Option+Shift+F** (macOS). If you use a different code editor, check the Edit menu for "Format Document" or a similar command.

Make sure your code editors are configured to use **two spaces** for indentation instead of tabs. This keeps your documentation source files compact and prevents horizontal scrolling issues when code blocks render on smaller screens.