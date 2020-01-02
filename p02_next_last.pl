last_but_one(X, [X, _]) .
last_but_one(X, [_ | L]) :-  last_but_one(X, L).

:- begin_tests(tests).

test(last_but_one__simple, all(Last == [2]))) :-
        last_but_one(Last, [1, 2, 3]) .
        
test(last_but_one__two_elements, all(Last == [1])) :-
        last_but_one(Last, [1, 2]) .

test(last_but_one__one_element, fail) :-
        last_but_one(_, [4]) .
        
test(last_element__empty_list, fail) :-
        last_but_one(_, []) .

:- end_tests(tests).