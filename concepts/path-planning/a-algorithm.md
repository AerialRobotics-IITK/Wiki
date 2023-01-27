# A\* Algorithm

This algorithm uses the concept of a heuristic destination, which implies that the minimum distance is encountered in the direction of destination. Although, sometimes it might go wrong due to some obstacles encountered in between and we might need to head in the opposite direction.

![](../../.gitbook/assets/A2.png)

Some common heuristic functions used are the Euclidean distance and the Manhattan distance. We proceed to the neighbouring node closest to the destination and then update the neighbors of the node.

![](../../.gitbook/assets/A1.png)

For more detailed information refer:

{% embed url="https://en.wikipedia.org/wiki/A*_search_algorithm" %}
