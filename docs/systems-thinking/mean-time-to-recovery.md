---
title: Mean time to recovery (MTTR)
description: "A service-level metric that measures the average time from the start of a service failure or outage until the service is fully restored to its normal state."
revision_date: 2026-08-28
---

# Mean time to recovery (MTTR)

Mean time to recovery (MTTR) is a service-level metric that measures the average time from the start of a service failure or outage until the service is fully restored to its normal state. In technical communication, improving the structure, searchability, and accuracy of incident response guides and runbooks is an effective way to lower MTTR and reduce the operational impact of outages.

---

## How documentation impacts the incident lifecycle

To understand how documentation affects MTTR, consider the typical phases of an incident response workflow:

- **Detection:** The system identifies a failure via automated monitoring or telemetry, triggering an alert.
- **Triage:** On-call engineers acknowledge the alert, identify the affected services, and determine the severity/impact.
- **Diagnosis:** Engineers investigate the root cause by analyzing logs, traces, and metrics to isolate the fault.
- **Mitigation/Recovery:** Operators perform actions to restore service, such as failing over to a redundant system, rolling back a deployment, or scaling resources.
- **Verification:** The team confirms the system is stable and meeting Service Level Objectives (SLOs).

When documentation is disorganized, outdated, or difficult to search, engineers lose time at every stage. Clear documentation turns these critical moments into predictable, sequential steps.

```mermaid
graph LR
    A[Detection] --> B[Triage]
    B --> C[Diagnosis]
    C --> D[Mitigation/Recovery]
    D --> E[Verification]
    style A fill:#f9f,stroke:#333,stroke-width:2px
    style E fill:#00ff00,stroke:#333,stroke-width:2px
```

---

## Designing runbooks for high-stress situations

During a production outage, engineers experience high cognitive load. Design your runbooks for quick scanning and rapid execution:

- **Include explicit entry criteria:** At the top of the runbook, list the specific alerts or metric thresholds that validate the guide. For example: "Use this runbook if the `DatabaseConnectionTimeout` alert fires or if the `db_cpu_utilization` metric exceeds 95% for more than 5 minutes."
- **Format commands for immediate execution:** Write CLI commands in code blocks. Use standardized delimiters for variables, such as `{{ENVIRONMENT_NAME}}` or `${DATABASE_ID}`, to make placeholders visually distinct from valid shell syntax and to prevent accidental execution of unreplaced strings.
- **Show expected outputs:** After a critical command, show an example of the expected successful stdout or JSON response. This allows the operator to verify state transitions before proceeding.

!!! tip "The 5-second scan rule"
    An engineer under pressure should be able to scan a runbook in five seconds and locate:
    - The emergency rollback or mitigation command.
    - Contact information for the escalation team or Subject Matter Expert (SME).
    - Links to the relevant monitoring dashboards (e.g., CloudWatch, Datadog).
    Use clear headers, bold formatting, and lists to make these elements stand out.

---

## Documenting recovery verification

An incident is not recovered until system health is verified against baseline metrics. Your runbooks must include a "Verification" section:

- **Define successful health states:** Specify which API endpoints to query and what response codes/body to expect. For example, the `/readyz` endpoint must return `200 OK` (indicating the service is ready to accept traffic, rather than just `/livez` which indicates the process is running).
- **Highlight metric recovery targets:** Explain what "normal" telemetry looks like. For example: "Verify that the response latency (p99) on the Grafana dashboard has returned to <200ms."
- **Document rollback steps:** If the mitigation attempt fails or introduces new regressions, provide a "Rollback plan" to return the system to its previous known-good state.

---

## Why MTTR is a key technical writing metric

Measuring MTTR gives technical writing teams a way to demonstrate business value. By comparing MTTR before and after a runbook update or the implementation of a documentation portal, you can quantify how high-quality documentation saves engineering hours, prevents customer churn, and reduces the cost of downtime.