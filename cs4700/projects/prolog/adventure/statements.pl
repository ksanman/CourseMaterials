look(X) :- room(X), name(X, N), write('Current Location:'), write(N), nl, long_desc(X, D), write('Description: '), write(D), nl, write('Connects to: '), connections(X), write(X), getitems(X).

search(X) :- container(X), name(X, N), write('Current Object: '), write(N), nl, long_desc(X, D),write('Description: '), write(D), nl, getitems(X).

connections(P) :- (door(P, C), write(C), nl, name(C,N), 
((N = "") -> fail
; write(' Name: '), write(N), nl, short_desc(C, D),
((D = "") -> fail
; write(' Description: '), write(D), nl, nl, fail), fail), true).
connections(P) :- (door(C, P), write(C), nl, name(C,N), 
((N = "") -> fail
; write(' Name: '), write(N), nl, short_desc(C, D),
((D = "") -> fail
; write(' Description: '), write(D), nl, nl, fail), fail), true).
connections(_).

getitems(L) :- write(' Contains: '), (location(I, L), nl, write(I), name(I, N),
((N = "") -> fail
; write('Name: '), write(N), nl, short_desc(I, D), nl,
((D = "") -> fail
; write('Description: '), write(D), nl, nl, fail), fail), true).
getitems(_).
