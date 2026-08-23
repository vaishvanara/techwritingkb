---
title: Mean time to recovery (MTTR)
description: "The average time required to repair and restore a failing system. Good runbooks directly improve this metric."
revision_date: 2026-08-24
---

# Mean time to recovery (MTTR)

Mean time to recovery (MTTR) is the average time it takes to troubleshoot, repair, and restore a failed system component or service to its normal state. In technical communication, improving the structure, searchability, and accuracy of incident response guides and runbooks is an effective way to lower MTTR and reduce the operational impact of outages.

---

## How documentation impacts the incident lifecycle

To understand how documentation affects MTTR, consider the typical phases of an incident response workflow:

- **Identification:** An automated alert triggers, or a customer reports an issue.
- **Triage:** On-call engineers identify the failing service and determine the severity.
- **Diagnosis:** Engineers investigate the root cause by checking logs, dashboards, and system metrics.
- **Resolution:** Operators perform steps to fix the issue, such as scaling servers, rolling back a deployment, or restarting a database.
- **Verification:** The team confirms that the fix worked and the system is stable.

When documentation is disorganized, outdated, or difficult to search, engineers lose time at every stage. They might spend time guessing which runbook to use, searching for diagnostic commands, or trying to find credentials. Clear documentation turns these critical moments into predictable, sequential steps.

```mermaid
graph LR
    A[Identification] --> B[Triage]
    B --> C[Diagnosis]
    C --> D[Resolution]
    D --> E[Verification]
    style A fill:#f9f,stroke:#333,stroke-width:2px
    style E fill:#00ff00,stroke:#333,stroke-width:2px
```

---

## Designing runbooks for high-stress situations

During a production outage, engineers experience high cognitive load. Design your runbooks for quick scanning and rapid execution:

- **Include explicit entry criteria:** At the top of the runbook, list the specific alerts or metric spikes that validate the guide. For example: "Use this runbook if you receive the `DatabaseConnectionTimeout` alert in [Slack](https://slack.com){: target="_blank" rel="noopener" } or if database CPU exceeds 95%."
- **Format commands for immediate execution:** Write CLI commands in code blocks that are ready to copy and paste. Use clear, standardized placeholders for variables, such as `<environment_name>` or `<database_id>`, so operators do not execute commands with unreplaced template variables.
- **Show expected outputs:** After a critical command, show an example of a successful console response. This helps the operator verify the status before they move to the next step.

!!! tip "The 5-second scan rule"
    An engineer under pressure should be able to scan a runbook in five seconds and locate:
    - The emergency rollback command.
    - Contact information for the escalation team.
    - Links to the relevant monitoring dashboards.
    Use clear headers, bold formatting, and lists to make these elements stand out.

---

## Documenting recovery verification

An incident is not resolved until the system health is verified. Your runbooks must include a "Verification" section:

- **Define successful health states:** Specify which API endpoints to query and what response codes to expect. For example, the `/healthz` endpoint must return `200 OK`.
- **Highlight metric recovery targets:** Explain what normal telemetry looks like. For example: "Verify that the [Grafana](https://grafana.com){: target="_blank" rel="noopener" } latency dashboard shows response times below 200 ms."
- **Document rollback steps:** If the fix fails or makes the system unstable, provide a "Rollback plan" section so the engineer can safely undo the changes.

---

## Why MTTR is a key technical writing metric

Measuring MTTR gives technical writing teams a way to demonstrate business value. By comparing incident resolution times before and after a runbook update, you can show how high-quality documentation saves engineering hours, prevents customer churn, and reduces organizational costs.