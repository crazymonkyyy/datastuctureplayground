Revised mission statement: Making 6 reasonably-general high-quality data structures that's complies with the standards of the std to submit it to the std.

For this purpose high-quality means:

1. Robust, given random data should not crash the program expect for asserts with a designed messages.
2. Cache-aware, modern hardware has a counter-intuitive but known behavior, data structures willfully ignorant of the basic facts are bad; I should not be.
3. Comfy user interface.
4. Reasonably compliant with community standards.

Data structure summery(details in separate files):
---

1. Ring array: an array with an access pattern that loops back on itself rather then overflowing
2. Opinionated list of lists: A array of nullable!T, where null is an end of a list.
3. Metadata: like nullable, but adds additional 7 bit int to round out the wasted space of nullable, and more flexible in usage pattern.
4. Member index arrays: A lighter version of SoA. Given a user defined T and a member of T, packs the designated members together for better cache usage for searches. Highly experimental.
5. Fixed length string: When you want char[n] rather then the default char[].
6. Semi-static array: no gc, copy to larger array during overflow and custom allocator friendly array abstraction.

Month 1
----

* Get a dub package up and running
* Drastically improve ring arrays
* Make a *bodged* "race" testing framework that generates documentation
* Get working reasonable quality prototypes for the other 5 data structures
* Learn d style and inline documentation systems, probably adding it to ring array

Month 2
---

* Make/find a more robust testing system
* Create some sort of system for feedback that isn't std.expermental
* Improve 3 more data structures for feedback.

Month 3
---

* Improve remaining data structures.
* Finalize api and code for ring array.
* Respond to feedback.

Month 4
---

* Finalize remaining data structures to my own standards.
* Submit code to the std review process.