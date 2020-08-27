Trees are ussally linked lists which two pointers instead of one; they have all the same cashe problems of LL's but they are by defination not be cache sorted.

You can improve the situation by declaring a tree node to be thicker and snar suggested b-trees.

Making a tree node as thick as a cashe line seems to be the extant of the data-oirented improvement on the data stucture in "the littiture". I ussally just avoid them.

https://duckduckgo.com/?q=%22data+oriented+design%22+tree

I've seen nothing to improve trees to get rid of that nasty fact of life which is that pointers as the data rather then the iterator are heavy and cache miss generators.

Prehaphs such things are impossible to fix and all that can be done is to design your programs to not need a tree in a inner loop.