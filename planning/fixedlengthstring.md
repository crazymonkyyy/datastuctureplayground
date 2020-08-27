Strings are an issue from my prosective, dynamic data means randomly unorginized data and unorginizeed data is *the* issue as per dataoirentedism (may intel have mercy on your cache lines).

D just aliases string to the standard dynamtic array, so there is just a causual source of cache issues. But its kinda an annoying problem; theres reasons c is considered to be awful with strings.

In my game I have: 

```d
struct word{
  char[16] text;
```

for some text rendering, but if I were to do anything major with it I expect it to be a nightmare.

Theorically I could write something like:

```d
struct fixedstring(size_t n){
  char[n] payload;
  cat(){}
  append(){}
  opequal(){}
  opassign(){}
  tolower(){}
  tocfriendly(){}
  todfriendly(){}
  etc.
  etc.
  etc.
}
```
I'd consider it to be quite a project to even cover the basics with good appoxiations.