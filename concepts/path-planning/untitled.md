---
description: This path spreads like fire.
---

# Grassfire Algorithm

The destination cell is marked 0 and the adjacent cells are marked in an increasing number sequence until we reach the starting cell. These numbers indicate the minimum number of steps required to reach the destination cell from that current cell.

![](../../.gitbook/assets/Grassfire1.png)

![](../../.gitbook/assets/Grassfire2.png)

The computational complexity of this algorithm increases linearly with the number of cells. For example, if for a 2D grid of size 100 X 100 the compute time is  $$10^4$$ , for a similiar grid of size 1000 X 1000 it would be $$10^6$$&#x20;

For more information view:

{% embed url="https://www.coursera.org/lecture/robotics-motion-planning/1-2-grassfire-algorithm-ZxAgg" %}
