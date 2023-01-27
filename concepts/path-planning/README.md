---
description: Plan your path properly.
---

# Path Planning

## Configuration Space&#x20;

![](../../.gitbook/assets/ConfigurationSpace1.png)

It is the steerable space of the robot. The above figures show the tx, ty configurations that the robot cannot attain because of the obstacle. The dimensions and shape of the configuration space obstacle are obtained by considering both the obstacle and the shape of the robot. The configuration space obstacle is defined by what's known as the Minkowski sum of the obstacle and the robot shape. The configuration of the robot corresponds to a point in the configuration space and the dark areas correspond to configurations that the robot cannot attain.

## Path Planning Algorithms

This section contains links to brief explanations of the various algorithms used for path planning:

{% content-ref url="untitled.md" %}
[untitled.md](untitled.md)
{% endcontent-ref %}

{% content-ref url="untitled-1.md" %}
[untitled-1.md](untitled-1.md)
{% endcontent-ref %}

{% content-ref url="a-algorithm.md" %}
[a-algorithm.md](a-algorithm.md)
{% endcontent-ref %}

{% content-ref url="probabilistic-roadmap.md" %}
[probabilistic-roadmap.md](probabilistic-roadmap.md)
{% endcontent-ref %}

{% content-ref url="rrt-algorithm.md" %}
[rrt-algorithm.md](rrt-algorithm.md)
{% endcontent-ref %}

{% content-ref url="visibility-graph-analysis.md" %}
[visibility-graph-analysis.md](visibility-graph-analysis.md)
{% endcontent-ref %}
