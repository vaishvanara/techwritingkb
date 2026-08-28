---
title: Chaos engineering
description: "The practice of intentionally introducing failures into a system to test its resilience and expose undocumented dependencies."
revision_date: 2026-08-28
---

# Chaos engineering

Chaos engineering involves intentionally introducing controlled failures into a software system to verify its resilience and find hidden vulnerabilities. 

For technical communicators and product teams, chaos engineering helps validate the accuracy of runbooks, expose undocumented system dependencies, and ensure that operational documentation remains effective during simulated disasters.

---

## The scientific method of system failure

Chaos engineering is a structured practice used to test hypotheses about how a system behaves during a failure. It is not about randomly breaking production environments; it is a controlled experiment.

The chaos engineering workflow follows these steps:

- **Define the steady state:** Identify normal system behavior by using key telemetry metrics (SLIs). For example, "the checkout response latency is less than 200 ms at 1,000 requests per minute with a 0% error rate."
- **Formulate a hypothesis:** Describe the expected outcome when a failure occurs. A typical hypothesis follows the format: "Even if `[failure event occurs]`, the `[steady state]` will continue." Example: "If we terminate one of three regional payment microservices, the load balancer will route traffic to the remaining two, and users will not experience increased checkout errors."
- **Introduce the failure event:** Inject a realistic variable, such as stopping a service instance, injecting network latency, or simulating a localized network partition.
- **Analyze the results:** Compare the post-injection metrics against the steady state. If the results match your hypothesis, your confidence in the system's resilience increases. If the system behavior diverges from the hypothesis, you have uncovered a weakness to resolve.

```mermaid
graph TD
    A[Define Steady State] --> B[Formulate Hypothesis]
    B --> C[Introduce Failure Event]
    C --> D{Compare Results}
    D -- Matches -- E[Increase Resilience Confidence]
    D -- Diverges -- F[Uncovered Weakness]
    F --> G[Improve System/Docs]
    G --> A
```

---

## Test documentation with chaos

While chaos engineering primarily tests software, it is also effective for testing human processes and the documentation they rely on:

- **Validate runbooks:** During scheduled resilience exercises, such as "Game Days," have an engineer resolve a failure by using only existing runbooks. If the engineer cannot complete a task due to missing steps or outdated commands, the documentation must be updated.
- **Uncover undocumented dependencies:** Software systems often have "hidden" dependencies. A chaos experiment might shut down a service perceived as non-essential that inadvertently causes a critical service failure. Use these findings to update dependency maps and architecture diagrams.
- **Refine error and alert messages:** Verify that telemetry platforms generate the exact alerts and error codes described in troubleshooting guides. If the system produces an undocumented error code or fails to trigger an alert during an experiment, update the monitoring configuration and the guides.

!!! warning "Limit the blast radius"
    When planning chaos experiments, always define a "blast radius"—the maximum potential impact of the experiment. Start in a staging environment. When moving to production, limit the blast radius to a specific subset of users, a single container, or a specific geographic region. While scheduling experiments during low-traffic hours reduces impact, it is not a substitute for a technical containment boundary. Always have a pre-validated rollback plan to immediately restore the steady state.

---

## Document a chaos experiment plan

Before running an experiment, write a clear, peer-reviewed plan. Use a documentation template that includes the following items:

- **Hypothesis:** The specific behavior or resilience pattern you are testing.
- **Blast radius:** The specific users, services, or infrastructure components exposed to the experiment.
- **Stop-loss conditions/Abort signals:** The specific metric thresholds (e.g., error rate > 5%) that will trigger an immediate termination of the experiment.
- **Telemetry markers:** The specific dashboard metrics used to monitor the steady state and detect abnormal behavior.
- **Rollback procedure:** The sequential steps or scripts required to revert the injected failure.
- **Post-experiment checklist:** The steps to log results, create tickets for identified bugs, and update documentation.

---

## Why chaos engineering benefits product teams

- **Higher production confidence:** Teams can deploy code knowing the system can survive server failures, network drops, and resource exhaustion.
- **Improved incident response:** Engineers practice resolving failures during controlled exercises, which lowers the real-world Mean Time to Recovery (MTTR).
- **Current documentation:** Treating runbooks as active components of a resilience plan ensures they are regularly audited and updated against actual system behavior.