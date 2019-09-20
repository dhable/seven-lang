module Day2 where

   myRange start step = start:(myRange (start + step) step)
