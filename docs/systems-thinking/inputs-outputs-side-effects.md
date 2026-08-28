---
title: Inputs, outputs, and side effects
description: "Data or triggers entering a system, the generated response, and any secondary impacts on neighboring modules, such as database writes or webhook dispatches."
revision_date: 2026-08-28
---

# Inputs, outputs, and side effects

Inputs are data, triggers, or requests that enter a system. Outputs are the direct responses generated in return. Side effects are state changes or impacts on downstream systems that occur as a result of processing inputs, such as writing to a database or triggering a [webhook](../doc-stack/emerging-architectures.md#event-driven-architecture-webhooks).

---

## Understanding the three components

To document a system effectively, analyze how data flows into, through, and out of each module rather than focusing only on simple request-and-response patterns.

- **Inputs:** These are the entry points. In software, inputs include API request payloads, query parameters, URI path parameters, environment variables, and data retrieved from external state (such as database records or file system reads).
- **Outputs:** These are the direct, immediate results of a system action. In an API, this includes the HTTP status code, response headers, and the response body (typically JSON or XML). In a CLI, it is the standard output (stdout) or standard error (stderr).
- **Side effects:** These are changes that occur outside the primary return value or response body. When a service runs, it can modify the state of the system or external systems. Common side effects include:
    - Mutating state (writing, updating, or deleting database records).
    - Publishing messages to an asynchronous broker (Apache Kafka, RabbitMQ, or Amazon SQS).
    - Triggering external communication (emails, SMS, or push notifications).
    - Invoking external APIs or webhooks.
    - Generating audit logs or security telemetry.

---

## Why side effects require clear documentation

While inputs and outputs are usually visible in API schemas (like OpenAPI specifications), side effects are often encapsulated within the business logic. Failing to document side effects creates risks:

- **Violations of idempotency:** If an endpoint is not idempotent, a developer may inadvertently trigger multiple financial charges or resource allocations by retrying a failed request. 
- **Performance and cost issues:** Downstream side effects, such as complex database triggers or expensive third-party API calls, consume system resources. Documentation must clarify which operations trigger these intensive background tasks.
- **Security and compliance gaps:** Side effects that involve data persistence (like logging PII to an internal file) can violate privacy regulations such as [GDPR](https://gdpr.eu/){: target="_blank" rel="noopener" } or [HIPAA](https://www.hhs.gov/hipaa/index.html){: target="_blank" rel="noopener" }.

---

## Strategies for documenting inputs, outputs, and side effects

### 1. Use organized API reference tables

In [API documentation](../industry-terms/api-documentation.md), distinguish between the direct response and the resulting state changes.

| Element | Description | Type or Format |
| :--- | :--- | :--- |
| **Input** | `user_id` | Path parameter (String) |
| **Input** | `status` | Query parameter (String) |
| **Output** | Status Code | `200 OK` |
| **Output** | Response Body | JSON object containing the updated user profile |
| **Side effect** | Database mutation | Updates the `status` column in the `users` table |
| **Side effect** | Webhook event | Dispatches a `user.status.updated` event to registered URLs |
| **Side effect** | Email notification | Sends a confirmation email if the status is set to "Active" |

### 2. Highlight asynchronous behavior

If a side effect occurs asynchronously (e.g., via a worker process or message queue after the HTTP response is sent), document the workflow using sequence diagrams. This helps developers understand that while the "Output" is immediate, the "Side effect" may be eventually consistent.

### 3. Document read-only versus state-changing operations

In RESTful design, `GET`, `HEAD`, and `OPTIONS` are "safe" methods—they should not produce side effects. `PUT` and `DELETE` are idempotent; while they modify state, repeating the same request should result in the same final system state. `POST` is non-idempotent and typically results in a new state change with every unique execution.

---

## Example: User registration endpoint

The following example documents a `/v1/users` registration endpoint.

### POST /v1/users

Creates a new user profile.

#### Request (Inputs)

- `email` (string, required): The user's primary email address.
- `password` (string, required): The account password (must be hashed before storage).
- `plan_id` (string, optional): The subscription tier. Defaults to `free`.

#### Response (Outputs)

- **Status Code:** `201 Created`
- **Body:**
    ```json
    {
      "id": "usr_90210",
      "email": "user@example.com",
      "created_at": "2026-08-14T17:45:00Z",
      "status": "pending_verification"
    }
    ```

#### Side effects

A successful request results in the following state changes and downstream actions:

- **Primary State Change (Synchronous):** A new record is created in the `users` table.
- **Asynchronous Task:** The system queues a transactional email containing a verification link.
- **Billing Integration:** If `plan_id` is a paid tier, the system calls the Stripe API to create a Customer object. 
- **Audit Logging:** An entry is appended to the `security_audit` log containing the event type (`user_registration`), the new `user_id`, and the origin IP address.