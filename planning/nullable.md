
I dislike std.nullable.

Nullable is a rather simple idea, add a bool to a some type, and if the type is bad you can know about it.

Maybe I should use a different word as poeple seem to think all the safty and the headache in std.nullable should be there but I use something far smaller.

```d

struct nullable(T){

  _T payload;_

  _bool isnull=true;_

  _void opAssign(T foo){_

    payload=foo; isnull=false;}

  _alias payload this;_

}```

Now if I were to polish this up, I would make it so I could have the following syntax

```d

nullable!int foo;

assert(foo==null);

foo=1;

assert(foo==1);

foo=null;

assert(foo==null);

```

That is what I mean by nullable ,which is very very different from the one in the std as is, with the nullify, get and all the asserts. Also there are 7 wasted bits there, maybe I could think up a way to make a templete that allows a 7 bit data structure in the nullable.

