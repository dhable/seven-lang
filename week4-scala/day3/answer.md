Week 4 - Scala
==============

Day 3
-----

__Q: For the sizer program, what would happen if you did not create a new actor
for each link you wanted to follow? What would happen to the performance of the
application?

In order to send the message from the actor to the receiver, scala needs to evaluate the expression for the message. It's during this evaluation that the code fetches the page from the Internet, which is prone to latency and the bottleneck in this code. By forcing the evaluation to occur in different actors, we are basically making each page fetch happen in parallel (different thread). Using a single actor will cause each subsequent line to be blocked by the proceeding line and would turn into a sequencial access routine.