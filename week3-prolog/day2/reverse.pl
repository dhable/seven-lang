concatenate([], List, List).
concatenate([Head|Tail1], List, [Head|Tail2]) :- concatenate(Tail1, List, Tail2).

reverse([Head|[]], [Head]).
reverse([Head|Tail1], List) :- reverse(Tail1, Tail2), concatenate(Tail2, [Head], List).