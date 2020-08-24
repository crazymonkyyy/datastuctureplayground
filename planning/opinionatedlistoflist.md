
I hate linked lists they are bad arrays when ordered in cashe and they are cashe miss machines when shuffied, however if I were to "steelman" the case for thier use, it would roughly point at the case of list of lists of sparsely populated data.

If this was c, and you needed to handle data like 

```

((1),(1,2,3,4,5),(1))

```

At best you would probaly put it in a 2d array like

```

[

  [1,0,0,0,0],

  [1,2,3,4,5],

  [1,0,0,0,0]

]```

You'd have to treat 0 as a specail case and this isnt a good use of data, therefore linked lists of linked list would be superior, and if you have such data your probaly in the mind set of functional programing and need to think of it in such a way.

But, this isnt c; what if you had an array of nullable!T, and treated null as a "],["; nullable adds an overhead of 8 bits, while a linked list will add 64 bits. And nullable itself wastes 7 of those bits what if you put some useful information there.

Now making ranges of ranges is a bit of a headache in my experience but I can imagine a data structure that makes it work. Leading to functional programing style, add in some asserts to enforce a linear path thru the data and it should be functional friendly while compiling down to cashe friendly code.

