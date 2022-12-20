domains 
 t_list = integer* % объявление домена-списка чисел
predicates 
 nondeterm remove_odd(t_list, t_list).
 nondeterm intersect(t_list, t_list, t_list).
 nondeterm member(integer,t_list)
clauses 
 
 remove_odd([], []).                         % Если список пуст, то необходимо вернуть пустой список
 
 remove_odd([A|List], Result):-              % Если первый элемент списка четный, то остальные элементы обрабатываем рекурсивно.
 	A mod 2 = 0, !,                          % Иначе, добавим элемент к списку
 	remove_odd(List, Result). 
 		
 remove_odd([Head|Tail], [Head|TailResult]):- 
 	remove_odd(Tail, TailResult).
 	
 intersect([], _, []).                       % При пересечении двух пустых множеств получается пустое множество
 
 intersect([Head|Tail1],Set2,[Head|Tail]) :-
 	member(Head,Set2),!,                     % Если голова первого множества Head принадлежит второму множеству Set2
 	intersect(Tail1,Set2,Tail).              % То результатом будет множество, образованное головой первого множества Head и хвостом,
 					                         % полученным пересечением хвоста первого множества Tail1 со вторым множестом Set2
 	
 intersect([_|Tail],Set2,Set) :-             % Иначе, результатом будет множество Set, полученное объединением хвоста первого множества Tail
 	intersect(Tail,Set2,Set).                % со вторым множеством Set2
 	
 member(Head,[Head|_]).                      % Рекурсивная процедура. Когда хвост будет равен [], проверка остановится.
 member(X,[_|Tail]):-                        % Рекурсивное предложение. Сокращение списка происходит за счёт извлечения его хвоста (cdr - рекурсия)
          member(X,Tail).                  

 goal 

 % remove_odd([1, 2, 3, 4, 5, 6, 7, 8, 9],X).
 % remove_odd([2, 3, 4, 5, 6, 7, 8, 9],X).
 % intersect([1, 2, 3, 4, 5, 6, 7, 8, 9],[4, 5, 6, 7, 8, 9, 4, 5, 6, 7], X).