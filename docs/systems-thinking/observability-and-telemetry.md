---
title: Observability and telemetry
description: "System capabilities that allow operators to measure internal states via logs, metrics, and traces. These are essential for writing troubleshooting guides."
revision_date: 2026-08-24
---

# Observability and telemetry

Observability measures how well you can understand a system's internal state by examining its external outputs. These outputs, known as telemetry, consist of logs, metrics, and traces. Telemetry provides the diagnostic data you need to author accurate troubleshooting guides and runbooks.

---

## The three pillars of telemetry

To write effective support and engineering documentation, you must understand the three types of telemetry data that systems produce:

- **Logs:** Text records of discrete events that occurred at a specific time. Logs describe *what* happened. For example, a log might record a failed login attempt for a specific user ID.
- **Metrics:** Numeric values measured over time that represent system performance and health, such as CPU use, request rates, or error percentages. Metrics indicate *when* a problem occurs and its scale.
- **Traces:** Data showing the end-to-end path of a request as it moves through a distributed system. Traces show *where* a bottleneck or failure occurred within a chain of microservices.

---

## Moving troubleshooting guides from guesswork to observation

Traditional troubleshooting guides often rely on vague, trial-and-error steps, like "Restart the server to see if that fixes the problem." This approach is slow, generic, and increases the risk of downtime.

By incorporating telemetry into your documentation, you can provide operators with precise diagnostic instructions. Use an observation-based workflow to guide your readers:

- **Define metric triggers:** Explain which dashboard metrics indicate a specific issue. For example, "If the rate of HTTP 5xx errors derived from the `http_requests_total` counter exceeds 5%..."
- **Identify log locations and patterns:** Tell operators where to find the relevant log files and what patterns to search for. For example, "Search `/var/log/api/error.log` for database connection timeout errors."
- **Use trace IDs for context:** Explain how to use trace IDs to follow a failing request across service boundaries. For example, "Copy the trace ID from the failing API response and search for it in [Jaeger](https://www.jaegertracing.io/){: target="_blank" rel="noopener" } to isolate the failing service."

!!! tip "Structured logging and documentation"
    When engineers write logs, they often use structured formats like JSON. Work with your development team to document these log schemas. Providing a directory of log attributes—such as `severity`, `service.name`, and `exception.message`—helps operators write accurate log queries during an incident.

---

## What to include when documenting observability tools

If you write internal engineering documentation, make sure you document your organization's observability setup:

- **Dashboard directories:** Provide links to standard monitoring dashboards, such as [Grafana](https://grafana.com/){: target="_blank" rel="noopener" } or [Datadog](https://www.datadoghq.com/){: target="_blank" rel="noopener" }. Explain what each panel on the dashboard represents.
- **Alert definitions:** Document what each automated alert means, who receives it, and the immediate action required when it triggers.
- **Log levels and standards:** Document your team's standards for log severity levels, like `DEBUG`, `INFO`, `WARN`, `ERROR`, and `FATAL`. This consistency makes logs easier to search during outages.

---

## How documenting telemetry improves operations

When you document observability and telemetry clearly, you reduce the time it takes to resolve incidents:

- **Lower Mean Time to Recovery (MTTR):** Operators do not have to guess what is wrong. Your documentation points them directly to the metrics and logs they need.
- **Faster developer onboarding:** New engineers can quickly learn how to monitor the systems they deploy and which log patterns to watch for.
- **Higher-quality bug reports:** When support engineers can interpret traces and logs, they can submit bug reports with precise diagnostic data. This helps developers fix issues faster.