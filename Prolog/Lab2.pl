predicates
 
 nondeterm parent(STRING, STRING).
 nondeterm woman(STRING).
 nondeterm man(STRING).
 nondeterm married_couple(STRING, STRING).
 nondeterm sister(STRING, STRING).
 nondeterm father(STRING, STRING).
 nondeterm aunt(STRING, STRING).
 nondeterm second_cousin_brother(STRING, STRING).
 nondeterm n_brother (UNSIGNED,STRING, STRING)
 nondeterm any_cousin_brother (UNSIGNED,STRING, STRING)
 nondeterm husband(STRING, STRING).
 
clauses
 
 parent("Николай", "Ольга").
 parent("Николай", "Никита").
 parent("Екатерина", "Ольга").
 parent("Екатерина", "Никита").
 parent("Евгений", "Николай").
 parent("Елизавета", "Николай").
 parent("Евгений", "Анна").
 parent("Елизавета", "Анна").
 parent("Анна","Денис").
 parent("Лев", "Евгений").
 parent("Татьяна", "Евгений").
 parent("Лев", "Алексей").
 parent("Татьяна", "Алексей").
 parent("Алексей", "Альберт").
 parent("Альберт", "Максим").
 parent("София", "Альберт").
 parent("Елена", "Максим").
 
 woman("Ольга").
 woman("Екатерина").
 woman("Анна").
 woman("Елизавета").
 woman("Татьяна").
 woman("София").
 woman("Елена").
 man("Никита").
 man("Николай").
 man("Олег").
 man("Денис").
 man("Евгений").
 man("Лев").
 man("Алексей").
 man("Альберт").
 man("Максим").
 
 married_couple("Николай", "Екатерина").
 married_couple("Олег", "Анна").
 married_couple("Евгений", "Елизавета").
 married_couple("Лев", "Татьяна").
 married_couple("Алексей", "София").
 married_couple("Альберт", "Елена").
 
 father(Father,Child) :- 
    man(Father), 
    parent(Father,Child). 
   
    
 sister(X,Y) :-
    woman(X),
    parent(Z,X),
    parent(Z,Y),
    X <> Y.   
      
 aunt(Aunt, Someone) :- 
    parent(Z, Someone),
    sister(Aunt, Z).
    
 second_cousin_brother(A,Someone) :-
    man(A),
    parent(B,Someone),    % Допустим, что у Someone есть родитель B
    parent(C,B),          % Допустим, что у B есть родитель C
    parent(D,C),          % Допустим, что у C есть родитель D
    parent(D,E),          % Допустим, что у D есть ребёнок E
    parent(E,F),          % Допустим, что у E есть ребёнок F
    parent(F,A),          % Допустим, что у F есть ребёнок A    
    C<>E.                 
    
 n_brother(1,X,Y):- 
    parent(A,X),          % Допустим, что у X есть родитель A 
    parent(A,Y),          % Допустим, что у Y тоже есть родитель A 
    X<>Y.                 
    
 n_brother(N,X,Y):-
    man(X),               
    N>1, 
    S=N-1,                
    parent(A,X),          % Допустим, что у X есть родитель A 
    parent(B,Y),          % Допустим, что у Y есть родитель B 
    n_brother(S, A, B).       
 
 any_cousin_brother(N,X,Y):-   
    man(X),
    n_brother(N,X,Y). 

 
 husband(Husband,Wife) :-
    man(Husband),
    married_couple(Husband,Wife).  
goal

    father(X,Y).
    aunt(A,B).
    second_cousin_brother(X,Y).
    any_cousin_brother(2,X,Y).
    husband(X,Y).
 
 % 6.1 Находится ли субъект a в отношении R с субъектом b? [тип: R(a,b)]
 
    parent("Николай", "Ольга").
    parent("Николай", "Никита").
    parent("Екатерина", "Ольга").
    parent("Екатерина", "Никита").
    parent("Евгений", "Николай").
    parent("Елизавета", "Николай").
    parent("Евгений", "Анна").
 
    married_couple("Николай", "Екатерина").
    married_couple("Олег", "Анна").
    married_couple("Евгений", "Елизавета").
    married_couple("Лев", "Татьяна").
    married_couple("Алексей", "София").
    married_couple("Альберт", "Елена").
 
    father("Евгений", "Николай").
    aunt("Анна", "Никита").
 
    parent("Евгений", "Алексей").
    parent("Татьяна", "Анна").
    parent("Лев", "Альберт").
    parent("Альберт", "Николай").
    parent("София", "Максим").
    parent("Елена", "Альберт").
 
    married_couple("Олег", "Екатерина").
    married_couple("Николай", "Анна").
    married_couple("Евгений", "Татьяна").
    married_couple("Лев", "Елизавета").
    married_couple("Альберт", "София").
    married_couple("Алексей", "Елена").
 
    father("Елизавета", "Николай").
    aunt("Екатерина", "Никита").
 
 % 6.2 Кто находится в отношении R с субъектом a? [тип: R(a,Y), R(X,b)]
 
    parent("Николай", Child), parent(Parent,"Никита").
    parent("Екатерина", Child), parent(Parent,"Ольга").
 
    married_couple("Николай", Wife), parent(Parent,"Ольга").                  
    father("Лев",Child), married_couple(Husband, "Татьяна").
 
 % 6.3 Найти все пары субъектов, находящихся в отношении R. [тип: R(X,Y)]
 
    father(X, Y).                   
    aunt(X,Y).                      
    second_cousin_brother(X, Y).    
    any_cousin_brother(N, X,Y).
    husband(X,Y).
