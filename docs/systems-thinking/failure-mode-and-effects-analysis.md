---
title: Failure mode and effects analysis (FMEA)
description: "A step-by-step approach for identifying all possible points of failure in a system or workflow and assessing their severity."
revision_date: 2026-09-17
---

# Failure mode and effects analysis (FMEA)

Failure mode and effects analysis (FMEA) is a proactive, systematic method for evaluating a process or design to identify where and how it might fail and to assess the relative impact of different failures. For technical writers and product teams, FMEA provides a data-driven basis for prioritizing documentation, safety warnings, and recovery runbooks.

---

## The three dimensions of FMEA risk

FMEA is performed during the design or planning phase to prevent failures before they occur. Each potential failure mode is evaluated and scored across three dimensions:

- **Severity (S):** This dimension measures the impact of the failure on the system or end user (scored 1 to 10, where 10 is catastrophic or a safety hazard).
- **Occurrence (O):** This dimension measures the likelihood that a specific cause will result in the failure mode (scored 1 to 10, where 10 is almost certain).
- **Detection (D):** This dimension measures the effectiveness of current controls to detect the cause or the failure mode before the failure reaches the end user (scored 1 to 10, where 10 means the control is nonexistent or certain to miss the failure).

The Risk Priority Number (RPN) is calculated by multiplying these three scores:

$$\text{RPN} = \text{Severity (S)} \times \text{Occurrence (O)} \times \text{Detection (D)}$$

A higher RPN indicates a higher risk. However, items with high severity scores (for example, 9 or 10) often require mitigation regardless of the resulting RPN.

!!! note "Using RPN to prioritize documentation"
    Technical writing teams can use RPN scores to prioritize a documentation backlog. For example, a failure mode with an RPN of 400 (S: 8, O: 5, D: 10) requires immediate mitigation through troubleshooting guides and telemetry alerts. After these controls are implemented and documented, the detection score is reassessed, resulting in a lower residual RPN.

---

## How FMEA improves technical documentation

An FMEA provides the technical data needed to design effective information architecture:

- **Logic-based warning levels:** Use severity scores to align with ANSI/ISO warning standards. If a step could cause permanent data loss or hardware damage (severity 8 to 10), use a `!!! danger` or `!!! warning` notice. For minor errors (severity 1 to 3), a `!!! note` or `!!! tip` is appropriate.
- **Observability documentation:** If a failure mode has a high detection score, documentation should focus on the specific metrics, logs, or error codes that allow an operator to identify the issue.
- **Fallback and recovery:** For failure modes that cannot be designed out (high severity and occurrence), write clear procedures for graceful degradation to ensure system availability in a limited state.

---

## Conduct an FMEA for technical workflows

FMEA can be applied to software architecture, hardware assembly, or human-centric processes such as manual deployment workflows.

```mermaid
graph TD
    A[Map workflow or system] --> B[Identify potential failure modes]
    B --> C[Analyze effects and causes]
    C --> D[Assign S, O, and D scores]
    D --> E[Calculate RPN and implement actions]
    E --> F[Rescore residual RPN]
```

- **Map the workflow:** Break the process into discrete, sequential steps.
- **Identify failure modes:** For each step, ask "How could this fail to meet its intended function?"
- **Analyze effects and causes:** Identify the impact of the failure (effect) and the underlying reason it would happen (cause).
- **Assign S, O, and D scores:** Collaborate with subject matter experts (SMEs). Occurrence is based on the cause; detection is based on the effectiveness of current diagnostic tools or processes.
- **Calculate RPN and implement actions:** Propose mitigations for high-risk items.
- **Rescore residual RPN:** After implementing mitigations (such as new validation logic or improved documentation), reevaluate the scores to make sure the risk has been reduced to an acceptable level.

---

## Why FMEA benefits cross-functional product teams

- **Proactive risk mitigation:** It identifies design flaws and information gaps early in the development lifecycle, reducing the cost of quality.
- **Objective prioritization:** Using RPN provides a standardized numerical basis for resource allocation, removing subjective bias from engineering or documentation priorities.
- **Knowledge capture:** The FMEA document serves as a historical record of known risks and the rationale behind specific safety features and documentation.