module Day2 where

   -- Write a function that takes an argument x and returns a lazy sequence that has every
   -- third number, starting with x. Then, write a function that includs every fifth number,
   -- beginning with y. Combine these functions through composition to return every eighth
   -- number, beginning with x + y.

   every_third x = x:(every_third (x + 3))

   every_fifth y = y:(every_fifth (y + 5))

   every_eigth x y = zipWith (+) (every_third x) (every_fifth y)
