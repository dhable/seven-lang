concatenate([], List, List).

concatenate([Head|Tail1], List, [Head|Tail2]) :- concatenate(Tail1, List, Tail2).

sort([Head1|[Head2|[]]], SortedList)
	:- concatenate([Head1], [Head2], SortedList), Head1 < Head2.

sort([Head1|[Head2|[]]], SortedList)
	:- concatenate([Head2], [Head1], SortedList), Head2 < Head1.

sort([Head|Tail], SortedList)
	:- sort(Tail, [SortedHead|SortedTail]), Head < SortedTail, concatenate([Head], [SortedHead|SortedTail], SortedList).

sort([Head|Tail], SortedList)
	:- sort(Tail, [SortedHead|SortedTail]), Head > SortedTail, concatenate([SortedHead], [Head|SortedTail], SortedList).