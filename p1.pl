my_last(X, [X | []]) .
my_last(X, [_ | L]) :- my_last(X, L) .

:- begin_tests(tests).

test(my_last__simple, all(Last == [3])) :-
        my_last(Last, [1, 2, 3]) .

test(my_last__one_element, all(Last == [4])) :-
        my_last(Last, [4]) .
        
test(my_last__empty_list, fail) :-
        my_last(_, []) .

:- end_tests(tests).
