Week 6 - Clojure
================

Day 3
-----

__ Find a queue implementation that blocks when the queue is empty and waits for a new item in the queue. __

I found that, not surprisingly, clojure has some experimental capabilities for such a queue from http://blog.marrowboy.co.uk/2011/10/21/worker-queues-in-clojure/ as promise/deliver.

Of course, one could always use the Java interop and pull in java.util.concurrent.BlockingQueue and just use that.