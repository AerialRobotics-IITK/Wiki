---
description: Fighting global warming.
---

# RRT Algorithm

The RRT procedure proceeds by constructing a special kind of graph called a tree, where every node is connected to a single parent and the tree is rooted at a given starting location. The following animation shows how the algorithm evolves to construct a tree in a two-dimensional configuration space containing obstacles.

On every iteration, the system generates a random point in the configurations base and checks if there's a free space. It then searches for the closest point in the existing tree and tries to generate a new node in the tree by moving in a straight line between the current vertex of the tree and new random vertex.

If the procedure does not succeed in this process of stepping towards a random node, it's simply abandons a point and moves on to the next iteration where it will generate a new random node.

In order to construct a path between the stark configuration and an end configuration, we actually construct two trees. One rooted at the start location and one at the goal. The procedure then tries to grow both trees until they meet. On every iteration of the algorithm, the system generates a random sample and tries to grow the current tree towards that random sample. If it succeeds in adding a new node to the tree, it tries to connect that new node to the other tree to form a bridge.

Note that if you succeed in finding such a bridge, you can claim success since it means that you have now forged a path between the two trees. On every route of this procedure, it swaps the two trees. That way, both trees are growing towards each other at the same rate.

In practice, the RRT Method is very effective at forging paths in high-dimensional configuration spaces. Another important feature of the RRT approach is it can be used on systems that have dynamic constraints, which limit how they can move.

For more information visit the wiki:

{% embed url="https://en.wikipedia.org/wiki/Rapidly-exploring\_random\_tree" %}

RRT\* and RRT\*-Smart are two path-planning algorithms that are improved versions of the RRT Algorithm. 



