smallest([Head|[]], Head).

smallest( [Head|Tail], Min )
	:- smallest(Tail, TailMin), TailMin < Head, Min is TailMin.

smallest( [Head|Tail], Min )
	:- smallest(Tail, TailMin), Head < TailMin, Min is Head.
