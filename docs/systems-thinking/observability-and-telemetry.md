---
title: Observability and telemetry
description: "System capabilities that allow operators to measure internal states via logs, metrics, and traces. These are essential for writing troubleshooting guides."
revision_date: 2026-09-17
---

# Observability and telemetry

Observability is a property of a system, specifically the degree to which you can understand its internal state by examining its external outputs. These outputs, known as telemetry, consist primarily of logs, metrics, and traces. Telemetry provides the diagnostic data required to author accurate troubleshooting guides and automated runbooks.

---

## The three pillars of telemetry

To write effective support and engineering documentation, you must understand the three types of telemetry data that systems produce:

- **Logs:** Immutable, timestamped text or structured records of discrete events. Logs provide high-cardinality context to describe what happened. For example, a log might record a `LoginFailed` event containing a specific user ID and the reason for the failure.
- **Metrics:** Numerical representations of data measured over intervals of time. Metrics are used for aggregation and mathematical observation of system health, such as CPU utilization, request rates, or error counts. Metrics indicate if a problem is occurring and the scale of the impact.
- **Traces:** Data representing the end-to-end journey of a single request or transaction as it moves through various components of a distributed system. A trace is composed of **spans**, where each span represents a specific operation within a service. Traces identify where a bottleneck or failure occurred in a request chain.

---

## Moving troubleshooting guides from guesswork to observation

Traditional troubleshooting guides often rely on non-deterministic, trial-and-error steps, such as restarting the server to see if that fixes the problem. This approach increases Mean Time to Repair (MTTR) and risks compounding the failure.

By incorporating telemetry into your documentation, you provide operators with deterministic diagnostic instructions. Use an observation-based workflow to guide your readers:

- **Define metric triggers and ratios:** Explain which specific queries indicate an issue. For example, if the error rate, calculated as `rate(http_requests_total{status=~"5.."}[5m]) / rate(http_requests_total[5m])`, exceeds 0.05 (5%)...
- **Identify log locations and structured keys:** Tell operators which log streams to inspect and which keys to filter by. For example, query the `api-gateway` logs for `status: 500` and check the `exception_context` field for database connection timeouts.
- **Use trace context for distributed debugging:** Explain how to use Trace IDs to correlate events across service boundaries. For example, extract the `traceparent` ID from the failing HTTP header and search for it in [Jaeger](https://www.jaegertracing.io/){: target="_blank" rel="noopener" } to identify which downstream microservice returned the error.

!!! tip "Structured logging and documentation"
    When engineers write logs, they should use structured formats such as JSON to ensure machine readability. Work with your development team to document the log schema. Providing a directory of standardized attributes, such as `service.name`, `span.id`, `trace.id`, and `severity_number`, helps operators write precise queries during an incident.

---

## What to include when documenting observability tools

If you write internal engineering documentation, ensure you document the specific implementation of your organization's observability stack:

- **Dashboard directories:** Provide links to standard monitoring dashboards in tools such as [Grafana](https://grafana.com/){: target="_blank" rel="noopener" } or [Datadog](https://www.datadoghq.com/){: target="_blank" rel="noopener" }. Define the data source and the meaning of specific visualizations, such as distinguishing between P99 latency and average latency.
- **Alert definitions and thresholds:** Document the logic behind automated alerts, the specific thresholds, such as static versus anomaly-based, and the expected immediate action (SOP) when an alert triggers.
- **Instrumentation standards:** Document the team's standards for log severity levels, such as following the [OpenTelemetry Logs Data Model](https://opentelemetry.io/docs/specs/otel/logs/data-model/#severity-fields){: target="_blank" rel="noopener" }, and the naming conventions for custom metrics, such as `namespace_suffix_unit`.

---

## How documenting telemetry improves operations

Clear documentation of telemetry reduces the cognitive load on engineers during high-pressure incidents:

- **Lower Mean Time to Recovery (MTTR):** Precise documentation points operators to the exact telemetry signals needed to identify a root cause, bypassing manual discovery.
- **Reduced Mean Time to Detection (MTTD):** Properly documented alert definitions ensure that on-call engineers understand the significance of a signal as soon as it fires.
- **Higher-quality bug reports:** When support engineers can interpret trace spans and log attributes, they can provide developers with the specific line of code or service interaction that failed, accelerating the development of a permanent fix.