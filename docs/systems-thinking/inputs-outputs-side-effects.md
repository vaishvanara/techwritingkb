---
title: Inputs, outputs, and side effects
description: "Data or triggers entering a system, the generated response, and any secondary impacts on neighboring modules, such as database writes or webhook dispatches."
revision_date: 2026-08-27
---

# Inputs, outputs, and side effects

Inputs are data, triggers, or requests that enter a system. Outputs are the direct responses generated in return. Side effects are secondary actions, state changes, or impacts on downstream systems that occur when processing inputs, such as writing to a database or triggering a [webhook](../doc-stack/emerging-architectures.md#event-driven-architecture-webhooks).

---

## Understanding the three components

To document a system effectively, analyze how data flows into, through, and out of each module rather than focusing only on simple request-and-response patterns.

- **Inputs:** These are the entry points. In software, inputs include API request payloads, query parameters, environment variables, database records, file uploads, and user interface actions.
- **Outputs:** These are the direct, immediate results of a system action. In an API, this includes the HTTP status code, response headers, and the JSON or XML response body. In a CLI, it is the standard output (stdout) or standard error (stderr).
- **Side effects:** These are the changes that occur outside the direct output channel. When a function or service runs, it can change the system state. Common side effects include:
    - Writing, updating, or deleting database records.
    - Publishing messages to a queue, such as Apache Kafka, RabbitMQ, or Amazon SQS.
    - Sending emails or SMS notifications.
    - Updating third-party services using external API calls or webhooks.
    - Generating audit logs or security telemetry.

---

## Why side effects require clear documentation

While inputs and outputs are usually visible in code repositories and API schemas, side effects are often hidden in business logic. Failing to document side effects creates risks for developers, administrators, and third-party partners:

- **Violations of idempotency:** If a developer does not realize that a call triggers a financial charge or creates a background resource, they might retry a failed request and cause duplicated side effects.
- **Performance and cost issues:** Downstream side effects, such as generating automated reports or synchronizing databases, use CPU and network resources. System administrators must know when these resource-intensive processes occur.
- **Security and compliance gaps:** If a system writes personal information to an internal log file as a side effect, it can breach data privacy regulations such as [GDPR](https://gdpr.eu/){: target="_blank" rel="noopener" } or [HIPAA](https://www.hhs.gov/hipaa/index.html){: target="_blank" rel="noopener" }. Security teams need visibility into all data modification side effects.

---

## Strategies for documenting inputs, outputs, and side effects

Use the following methods to organize documentation and ensure all three elements are clear.

### 1. Use organized API reference tables

In [API documentation](../industry-terms/api-documentation.md), include a dedicated section or table row for side effects.

| Element | Description | Type or Format |
| :--- | :--- | :--- |
| **Input** | `user_id` | Path parameter (String) |
| **Input** | `status` | Query parameter (String) |
| **Output** | `200 OK` | JSON response payload with updated user profile |
| **Side effect** | Database update | Modifies the `users` table to update the user's status |
| **Side effect** | Webhook event | Dispatches a `user.status.updated` event to registered webhook URLs |
| **Side effect** | Email notification | Sends an automated confirmation email to the user if the status changes to "Active" |

### 2. Highlight asynchronous behavior

If a side effect occurs asynchronously (in the background after the direct output is returned), document the workflow. Use sequence diagrams or flowcharts to show the chronological order of operations, especially for third-party service interactions.

### 3. Document read-only versus state-changing operations

Distinguish between safe operations, such as GET, and state-changing operations. Take note that while PUT and DELETE operations modify state, they are designed to be idempotent, meaning multiple identical requests should have the same side effect as a single request.

---

## Example: User registration endpoint

The following example documents a `/v1/users` registration endpoint by mapping inputs, outputs, and side effects.

### POST /v1/users

Creates a new user profile.

#### Request (Inputs)

- `email` (string, required): The user's primary email address.
- `password` (string, required): The account password.
- `plan_id` (string, optional): The subscription tier to assign. Defaults to `free`.

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

When this endpoint returns a successful `201 Created` response, the system runs the following background processes:

- **Database write:** Adds a new record to the `users` table with a hashed password.
- **Verification email:** Sends a transactional email containing a verification link to the registered email address.
- **Billing integration:** If `plan_id` is a paid tier, the system initiates a setup command to [Stripe](https://stripe.com/){: target="_blank" rel="noopener" } to create a customer object and set up draft invoice parameters. Note: For critical side effects such as billing, make sure you use idempotent request keys or a transactional outbox pattern to prevent data inconsistency.
- **Audit logging:** Appends a record to the system security log containing the action type (`user_creation`), user ID, and requesting IP address.