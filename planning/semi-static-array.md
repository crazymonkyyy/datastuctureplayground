The "debate" for custom allocators, even after a week of stating my postion, seems to have not moved poeple to the ovisous conclusion that a static large data structure only needs to be allocated once so don't worry about it, just throw asserts if you go pass a max size and call it a day. Dynamic allocation is the problem just don't do it even for cases which poeple ussally do and hope the gc will be compident enough when you use it rarely; they after are battle tested on what everyone else does. But I digress here is my planed compromise:

A semi static array is a array that will act as its supposed to, sanily large allocation, that is configurable when it overflows.

What happens when it overflows is handled by compile time enums, with the defualt being crashing out with an assert saying to not overflow.

Another for copying itself over to a dynamic array, possibly logging an error, or throwing an expection.

Another for bringing in a custom allocator and the nightmare that would bring.

It will be narrowly nogc compilent but prehaphs it will be enough.

All with the same interface to allow duck typing.