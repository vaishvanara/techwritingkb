---
title: Inputs, outputs, and side effects
description: "The data or triggers entering a system, the generated response, and any secondary impacts on neighboring modules, such as database writes or webhook dispatches."
revision_date: 2026-08-24
---

# Inputs, outputs, and side effects

Inputs are data, triggers, or requests that enter a system. Outputs are the direct responses generated in return. Side effects are secondary actions, state changes, or impacts on downstream systems that occur when processing inputs, such as writing to a database or triggering a webhook.

---

## Understand the three components

To document a system effectively, analyze how data flows into, through, and out of each module rather than focusing only on simple request-and-response patterns.

- **Inputs:** These are the entry points. In software, inputs include API request payloads, query parameters, environment variables, database records, file uploads, and user interface actions.
- **Outputs:** These are the direct, immediate results of a system action. In an API, this includes the HTTP status code and the JSON or XML response body. In a CLI tool, it is the standard output (stdout) or standard error (stderr).
- **Side effects:** These are changes that occur outside the direct output channel. When a function or service executes, it may alter the state of the broader system. Common side effects include:
    - Writing, updating, or deleting database records.
    - Publishing messages to a queue, such as [Apache Kafka](https://kafka.apache.org/){: target="_blank" rel="noopener" }, [RabbitMQ](https://www.rabbitmq.com/){: target="_blank" rel="noopener" }, or [Amazon SQS](https://aws.amazon.com/sqs/){: target="_blank" rel="noopener" }.
    - Sending emails or SMS notifications.
    - Updating third-party services via external API calls or webhooks.
    - Generating audit logs or security telemetry.

---

## Why side effects require clear documentation

While inputs and outputs are typically visible in code repositories and API schemas, side effects are often hidden within business logic. Failing to document side effects creates risks for developers, administrators, and integrations:

- **Violations of idempotency:** If an API consumer does not realize a call triggers a financial charge or creates a background resource, they might retry a failed request and cause duplicated side effects.
- **Performance and cost issues:** Downstream side effects, such as generating automated reports or synchronizing databases, consume CPU and bandwidth. System administrators must know when these resource-intensive processes occur.
- **Security and compliance gaps:** If a system writes personally identifiable information (PII) to an internal log file as a side effect, it can breach data privacy regulations like [GDPR](https://gdpr.eu/){: target="_blank" rel="noopener" } or [HIPAA](https://www.hhs.gov/hipaa/index.html){: target="_blank" rel="noopener" }. Security teams need visibility into all data modification side effects.

---

## Strategies for documenting inputs, outputs, and side effects

Use these methods to organize documentation and ensure all three elements are clear.

### Use organized API reference tables

In API endpoint documentation, include a dedicated section or table row for side effects.

| Element | Description | Type / Format |
| :--- | :--- | :--- |
| **Input** | `user_id` | Path parameter (String) |
| **Input** | `status` | Query parameter (String) |
| **Output** | `200 OK` | JSON response payload with updated user profile |
| **Side Effects** | Database update | Modifies the `users` table to update the user's status. |
| **Side Effects** | Webhook event | Dispatches a `user.status.updated` event to registered webhook URLs. |
| **Side Effects** | Email notification | Sends an automated confirmation email to the user if the status changes to "Active." |

### Highlight asynchronous behavior

If a side effect happens asynchronously (in the background after the direct output is returned), document the workflow. Use sequence diagrams or flowcharts to show the chronological order of operations, especially for third-party service interactions.

### Document read-only vs. state-changing operations

Distinguish between safe operations (queries that return data without side effects, like most HTTP `GET` requests) and unsafe operations (commands that modify state, like HTTP `POST`, `PUT`, or `DELETE` requests).

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

When this endpoint returns a successful `201 Created` response, the system executes these background processes:

- **Database Write:** Adds a new record to the `users` table with a hashed password.
- **Verification Email:** Sends a transactional email containing a verification link to the registered email address.
- **Billing Integration:** If `plan_id` is a paid tier, the system initiates a setup command to [Stripe](https://stripe.com/){: target="_blank" rel="noopener" } to create a customer object and set up draft invoice parameters.
- **Audit Logging:** Appends a record to the system security log containing the action type (`user_creation`), user ID, and requesting IP address.