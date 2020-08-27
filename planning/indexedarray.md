Snar has suggested that the defualt aa arrays are implimented less then ideally. 

I think he meant something like this by indexed arrays:
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

Should test something like that vs the standard aa arrays to see if there is an issue.