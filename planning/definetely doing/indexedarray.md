Snar has suggested that the defualt aa arrays are implimented less then ideally. 

~~I think he meant something like this by indexed arrays:~~
```d
struct indexedarray(T,S){
  T[] keys;
  S[] values;
  opIndex(T a){
    where=keys.find!a;
    return values[where];
  }
}
```

~~Should test something like that vs the standard aa arrays to see if there is an issue.~~

----

snar surprized me I meant something requiring decomposing user types

So imagine a struct

```d 

struct usertype{
  size_t id;
  vect2 pos;
  color c;
}```

This would in turn be used to make a type like:

```d
struct modifiedusertype{
  vect2 pos;
  color c;
}```

And would be used to make the data format of 

```d
struct list(usertype, id){
  typeof(usertype.id)[] keys;
  modifiedusertype[] values;
}```

To make a "light" soa system that maybe more general users could be convinced to use.

I worry that template abuse no matter how mild would be prevented from being put into the std or generally approved of as being to hacky. But this is in my wheel house; some experimation is called for.