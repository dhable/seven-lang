module Day3 where

   stagger :: (Num t) => t -> t
   stagger d = d + 2

   crawl :: (Num t) => t -> t
   crawl d = d + 1

   treasureMap d = crawl (stagger (stagger d))

   treasureMap2 d = let d1 = stagger d
                        d2 = stagger d1
                        d3 = crawl d2
                    in d3
