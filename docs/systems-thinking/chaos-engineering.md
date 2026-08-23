---
title: Chaos engineering
description: "The practice of intentionally introducing failures into a system to test its resilience and expose undocumented dependencies."
revision_date: 2026-08-24
---

# Chaos engineering

Chaos engineering involves intentionally introducing controlled failures into a software system to verify its resilience and find hidden vulnerabilities. 

For technical communicators and product teams, chaos engineering helps validate the accuracy of runbooks, expose undocumented system dependencies, and ensure that operational documentation remains effective during simulated disasters.

---

## The scientific method of system failure

Chaos engineering is a structured practice used to prove or disprove hypotheses about how a system behaves during a failure. It is not about randomly breaking production environments.

The chaos engineering workflow follows these steps:

- **Define the steady state:** Identify normal system behavior by using key telemetry metrics. For example, "the checkout response latency is less than 200 ms at 1,000 requests per minute."
- **Formulate a hypothesis:** Describe the expected outcome when a failure occurs. Example: "If we terminate one of three regional payment microservices, the load balancer will route traffic to the remaining two, and users will not experience increased checkout errors."
- **Introduce the failure event:** Inject a realistic variable, such as stopping a service, adding network latency, or blocking a database port.
- **Analyze the results:** Compare the results against the steady state. If the results match your hypothesis, the system is resilient. If the system fails or performance drops significantly, you have found a weakness to resolve.

```mermaid
graph TD
    A[Define Steady State] --> B[Formulate Hypothesis]
    B --> C[Introduce Failure Event]
    C --> D{Compare Results}
    D -- Matches --E[System is Resilient]
    D -- Diverges --F[Uncovered Weakness]
    F --> G[Improve System/Docs]
    G --> A
```

---

## Test documentation with chaos

While chaos engineering primarily tests software, it is also effective for testing human processes and the documentation they rely on:

- **Validate runbooks:** During scheduled resilience exercises, such as "Game Days," have an engineer resolve a failure by using only existing runbooks. If the engineer cannot complete a task or encounters outdated commands, update the documentation.
- **Uncover undocumented dependencies:** Software systems often have hidden connections. A chaos experiment might shut down a non-essential service that accidentally crashes a critical one. Use these findings to update dependency maps and architecture diagrams.
- **Refine error and alert messages:** Verify that telemetry platforms generate the exact alerts and error messages described in troubleshooting guides. If the system produces an undocumented error code during an experiment, add it to the guides.

!!! warning "Limit the blast radius"
    When you plan chaos experiments, start in a staging or sandbox environment. If you eventually run experiments in production, establish clear containment boundaries, such as running experiments during low-traffic hours. Always document a rollback plan to restore the steady state if the system fails.

---

## Document a chaos experiment plan

Before you run an experiment, write a clear, peer-reviewed plan. Use a documentation template that includes the following items:

- **Hypothesis:** The specific behavior or resilience pattern you are testing.
- **Blast radius:** The users, regions, or services exposed to the experiment and the containment boundaries.
- **Telemetry markers:** The dashboard metrics used to monitor the steady state and detect abnormal behavior.
- **Rollback procedure:** The sequential steps or scripts required to stop the experiment and restore operations.
- **Post-experiment checklist:** The steps to log results, create tickets for bugs, and update documentation.

---

## Why chaos engineering benefits product teams

- **Higher production confidence:** Teams can deploy code knowing the system can survive server failures, network drops, and resource exhaustion.
- **Improved incident response:** Engineers practice resolving failures during controlled exercises, which lowers the real-world mean time to recovery (MTTR).
- **Current documentation:** Treating runbooks as active components of a resilience plan ensures they are regularly audited and updated.