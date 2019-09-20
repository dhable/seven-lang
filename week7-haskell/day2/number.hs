module Day2 where

   -- Write a Haskell function to convert a string to a number. The string
   -- should be in the form of $2,345,678.99 and can possibly have leading
   -- zeros.

   getIndex acc []    c = -1
   getIndex acc (h:t) c
      | c == h = acc
      | otherwise = getIndex (acc + 1) t c

   str_to_num ('$':value) = foldl (\acc n -> acc * 10 + (char_to_digit n)) 0 whole_value +
                            foldl (\acc n -> (acc / 10) + ((char_to_digit n) / 10)) 0.0 fract_value
      where
         whole_value = filter (/= ',') (take (length value - 3) value)
         fract_value = drop (length value - 2) value
         char_to_digit = getIndex 0 "0123456789"
         
