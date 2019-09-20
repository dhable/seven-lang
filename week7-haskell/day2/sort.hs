module Day2 where

   -- Write a sort that takes a list and returns a sorted list.
   merge :: Ord a => [a] -> [a] -> [a]
   merge [] []           = []
   merge left []         = left
   merge [] right        = right
   merge left right
      | l_head < r_head  = l_head:(merge l_tail (r_head:r_tail))
      | otherwise        = r_head:(merge (l_head:l_tail) r_tail)
      where
         (l_head:l_tail) = left
         (r_head:r_tail) = right

   divide :: [a] -> ([a], [a])
   divide []  = ([], [])
   divide [x] = ([x], [])
   divide lst = (left, right)
      where
         mid   = quot (length lst) 2
         left  = take mid lst
         right = drop mid lst

   sort :: Ord a => [a] -> [a]
   sort []  = []
   sort [x] = [x]
   sort lst = merge (sort left) (sort right)
      where
         (left, right) = divide lst


   
   -- Write a sort that takes a list and a function that compares its two arguments
   -- and then returns a sorted list.
   merge_f :: (a -> a -> Bool) -> [a] -> [a] -> [a]
   merge_f cmp [] []      = []
   merge_f cmp left []    = left
   merge_f cmp [] right   = right
   merge_f cmp left right
      | cmp l_head r_head = l_head:(merge_f cmp l_tail (r_head:r_tail))
      | otherwise         = r_head:(merge_f cmp  (l_head:l_tail) r_tail)
      where
         (l_head:l_tail)  = left
         (r_head:r_tail)  = right

   sort_f :: (a -> a -> Bool) -> [a] -> [a]
   sort_f cmp []  = []
   sort_f cmp [x] = [x]
   sort_f cmp lst = merge_f cmp (sort_f cmp left) (sort_f cmp right)
      where
         (left, right) = divide lst
