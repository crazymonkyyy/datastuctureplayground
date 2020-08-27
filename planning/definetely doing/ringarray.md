
I see 3 choices when making a ring array:

1. The direction, fifo or lifo; or prehaphs even double headed.

2. Manual or automatic, deletion of elements. Maybe you want to comsume if an element is read such as a multithreaded work que, and you want a worker thread to "delete" the work order when it starts the work, or maybe you need to iterate the list seperatly from the managiment of the list and such an automatic process would be annoying to work around.

3. The behavoir of the overflow, in a lazy process maybe you just drop the que, in a multithreaded one, maybe you sleep in the hopes that the list stops being filled, maybe you overwrite the first element, maybe you drop the new one, maybe cutting the list in half.

This calls for several compile time choices and a lot of testing to get any edge cases.

