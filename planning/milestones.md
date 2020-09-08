
Revised mission statement: Making 6 reasonably-general high-quality data structures that's complies with the standards of the std to submit it to the std.

Stages of improvement of code (for judgement of milestones):
---
Prototype:
1. It passes *a* unit test. 👍
2. Speed tests to verify/correct my assumptions about real world cpu behavior.

Feature complete:
1. No glaring non-complaint with community standards design decisions
  * for example: no passing in strings for mixins.
  * Compiles on both dmd and ldc
2. A reasonable range of unit tests.
3. Written but "first draft"/poor documentation.
4. Compiles with relivent flags
  * -cov=95
  * -w
  * Should *not* use -j

High quality/final:
1. Robust, given random data should not crash the program expect for asserts with a designed messages.
2. Cache-aware, modern hardware has a counter-intuitive but known behavior, data structures can drastically improve speed.
3. Comfy user interface.
4. Reasonably compliant with community standards.
5. Documented.
6. Reasonable belief it could get thru the std review process.

Data structure summery(details in separate files):
---

1. Ring array: an array with an access pattern that loops back on itself rather then overflowing
2. Opinionated list of lists: A array of nullable!T, where null is an end of a list. Highly experimental*.
3. Metadata: like nullable, but adds additional 7 bit int to round out the wasted space of nullable, and more flexible in usage pattern.
4. Member index arrays: A lighter version of SoA. Given a user defined T and a member of T, packs the designated members together for better cache usage for searches. Highly experimental*.
5. Fixed length string: When you want char[n] rather then the default char[].
6. Semi-static array: no gc, copy to larger array during overflow and custom allocator friendly array abstraction.

*Highly experimental: I may be wrong about something fundamental and drop them in the prototype stage.

Month 1
----

* Get a dub package up and running.
* Get ring arrays to "feature complete".
* Make a *bodged* a-b fuzzy race testing/benchmarking framework that generates markdown test results.
  * Bodged: makeshift, slipshod, not intended to be stable.
* Make prototypes for the other 5 data structures.
* Learn d style and inline documentation system the community likes, adding it to ring array

Month 2
---

* Make/find a more robust testing system.
  * testing correctness of specific cases, as opposed to a fuzzer and benchmarker.
* Publish a-b test *results* on github inviting the community to criticize it in issues.
* Improve 3 more data structures to "feature complete".
  * The flexibility of which data structures is intended. To pace myself, or for interdependence, for example I will use metadata in opinionated list of list.

Month 3
---

* Improve remaining data structures to "feature complete".
* "Finalize" ring array.
* Respond to community feedback.

Month 4
---

* "Finalize" remaining data structures.
* Submit code to the std review process.