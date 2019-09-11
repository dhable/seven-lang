module Day1 where

    -- Solve the map-coloring problem (Map Coloring, on page 83)
    -- using Haskell

    colors = ["red", "green", "blue"]

    st_colors = head [[tn, ms, al, ga, fl] | tn <- colors,
                                             ms <- colors,
                                             al <- colors,
                                             ga <- colors,
                                             fl <- colors,
                                             tn /= ms, tn /= al, tn /= ga,
                                             ms /= tn, ms /= al,
                                             al /= tn, al /= ms, al /= ga, al /= fl,
                                             ga /= tn, ga /= al, ga /= fl,
                                             fl /= ga, fl /= al]

    paintMap = zip ["TN", "MS", "AL", "GA", "FL"] (st_colors)
