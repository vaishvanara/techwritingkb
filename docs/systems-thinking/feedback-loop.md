---
title: Feedback loops
description: How system output influences future behavior through balancing or reinforcing mechanisms, including rate limiting and retry logic.
revision_date: 2026-09-17
---

# Feedback loops

Feedback loops occur when system output or state signals serve as input to modify future behavior. These loops either stabilize a system through balancing or amplify behaviors through reinforcing signals. Understanding these patterns helps you write more effective operational guides, API references, and troubleshooting documentation.

---

## Balancing feedback loops

Balancing feedback loops provide stability and self-regulation. When a system metric deviates from a target setpoint, a balancing mechanism triggers to return the system to that state.

-   **How it works:** The system monitors a metric (such as error rate or latency) against a threshold. It then triggers an action to bring the system back toward its target state, either by throttled input or by adjusted processing capacity.
-   **Rate limiting:** An API gateway monitors incoming request volume and returns `429 Too Many Requests` responses when limits are exceeded. This signal forces client applications to reduce their request rate (input), bringing the traffic back within the system's capacity.
-   **Autoscaling:** A cloud monitor detects that CPU utilization exceeds 80%. It provisions additional server instances to distribute the load. In this case, the loop achieves balance by increasing capacity to meet demand, eventually lowering the average CPU utilization back to the target range.

---

## Reinforcing feedback loops

Reinforcing feedback loops amplify changes and can push systems toward extreme states. Without intervention, these loops often lead to exponential growth in errors, resource exhaustion, or system-wide collapse.

-   **Retry storms:** If a database experiences latency and timeouts, client services may immediately attempt to reconnect or retry requests. This surge in requests increases the database load, further increasing latency and triggering even more retries from more clients.
-   **Cache stampedes:** When a high-traffic cached item expires (a cache miss), multiple concurrent requests bypass the empty cache and hit the database simultaneously. The resulting database slowdown delays the cache refresh, causing subsequent requests to also hit the database, leading to a sustained surge.

---

## Documenting systems with feedback loops

When documenting a system vulnerable to or controlled by feedback loops, provide specific details to help users design compatible client-side logic.

### Rate limits and backoff strategies

If your API implements rate limiting, describe the specific signals the system returns and how client systems must process them.

-   **Detail the response headers:** Explain headers such as `X-RateLimit-Limit`, `X-RateLimit-Remaining`, and `Retry-After`.
-   **Provide client-side code examples:** Show developers how to parse headers and implement exponential backoff with jitter. Using full jitter (randomizing the wait time between 0 and the maximum backoff) prevents multiple clients from retrying at the exact same moment, which prevents reinforcing retry storms.

```python
import time
import random

def get_wait_time(retry_count):
    """
    Calculates exponential backoff with full jitter.
    This ensures that retries are spread out evenly to avoid thundering herds.
    """
    BASE_DELAY = 1 
    MAX_WAIT = 60
    
    # Calculate exponential backoff limit
    backoff_limit = min(MAX_WAIT, BASE_DELAY * (2 ** retry_count)) 
    
    # Use full jitter: select a random value between 0 and the backoff limit
    return random.uniform(0, backoff_limit)
```

### Thresholds and cooldown periods

For systems using autoscaling or circuit breakers, document the exact conditions that trigger the feedback loop.

-   **Threshold values:** State the exact metrics, such as *Autoscaling triggers when average memory utilization exceeds 85% for 5 consecutive minutes.*
-   **Cooldown or settling time:** Describe the delay built into the loop to prevent flapping (rapid, unstable oscillations). For example, specify if the system waits 10 minutes after a scaling event before it reevaluates the metrics.

### Visualizing complex loops

Text descriptions of circular relationships can be difficult to follow. Use diagrams to show how output feeds back into the system.

```mermaid
graph TD
    A[Client sends API request] --> B[Gateway checks limit]
    B --> C{Limit exceeded?}
    
    C -- Yes --> D[Return HTTP 429]
    C -- No --> F[Process request]
    
    D --> E[Client parses Retry-After header]
    E -->|Wait and retry| A
```

---

## Best practices for loop documentation

To ensure your documentation is actionable for administrators and developers, check whether it addresses the following operational requirements:

-   **Identify the balancing mechanism:** Name the specific signal, such as a `Retry-After` duration, that clients should use to slow down.
-   **Mitigate reinforcing loops:** Provide clear guidance on using jitter, circuit breakers, or manual overrides to break a runaway loop.
-   **Define evaluation windows:** Be precise about metric types and the duration of time the system monitors them (for example, p99 latency over a 1-minute rolling window) before taking action.
-   **Include recovery steps:** In troubleshooting guides, list the manual steps required to recover a system trapped in an unchecked reinforcing loop, such as temporary traffic throttling or clearing a message queue.