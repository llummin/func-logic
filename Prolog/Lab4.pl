domains
TJockey_Winner,THorse_Winner=STRING
TWinner=winner(TJockey_Winner,THorse_Winner)
TJockey_Name,THorse_Moniker,TTitle_Race=STRING

facts
jockey_Horse(TJockey_Name,THorse_Moniker)
race_winner(TTitle_Race,TWinner)

predicates
nondeterm repeat.
switch(INTEGER).
  
clauses 
repeat.
repeat:-repeat.


switch(Case) :- Case='0',write("До новых встреч!"),nl,!. 

switch(Case):-Case= '1',write("Введите имя жокея > "),readln(Jockey_Name),
        				write("Введите кличку лошади > "),readln(Horse_Moniker),
        				assert(jockey_Horse(Jockey_Name,Horse_Moniker)),fail.
        
switch(Case):-Case= '2',write("Введите состязание > "),readln(Title_Race),
        				write("Введите имя жокея - победителя состязания > "),readln(Jockey_Winner),
        				write("Введите кличку лошади - победителя состязания > "),readln(Horse_Winner),
        				assert(race_winner(Title_Race,winner(Jockey_Winner,Horse_Winner))),fail.
        
switch(Case):-Case= '3',write("Удаление жокея и лошади"),nl,
        				write("Введите имя жокея > "),readln(Jockey_Name),
        				write("Введите кличку лошади > "),readln(Horse_Moniker),
        				retract(jockey_Horse(Jockey_Name, Horse_Moniker)),nl,
        				write("Удаление прошло успешно!"),fail.
        
switch(Case):-Case= '4',write("Удаление состязания и победителя"),nl,
        				write("Введите состязание > "),readln(Title_Race),
        				write("Введите имя жокея - победителя состязания > "),readln(Jockey_Winner),
        				write("Введите кличку лошади - победителя состязания > "),readln(Horse_Winner),
        				retract(race_winner(Title_Race,winner(Jockey_Winner,Horse_Winner))),nl,
        				write("Удаление прошло успешно!"),fail.
        
switch(Case):-Case= '5',write("Введите имя жокея > "),readln(Jockey_Name),
        				write("Введите кличку лошади > "),readln(Horse_Moniker),
        				retract(jockey_Horse(Jockey_Name,Horse_Moniker)),!,
        				write("Удаление прошло успешно!"),
        				write('\10',"___________________________________", '\10'),
write('\10',"Введите новые данные: ",'\10'),
        				write("Введите новое имя жокея > "),readln(New_Jockey_Name),
        				write("Введите новую кличку лошади > "),readln(New_Horse_Moniker),
        				assert(jockey_Horse(New_Jockey_Name,New_Horse_Moniker)),
        				write("Изменение прошло успешно!"),
        				write('\10',"___________________________________", '\10'),fail. 
        				
switch(Case):-Case= '6',write("Введите состязание > "),readln(Title_Race),
				       write("Введите имя жокея - победителя состязания > "),readln(Jockey_Winner),
				       write("Введите кличку лошади - победителя состязания > "),readln(Horse_Winner),
                                       retract(race_winner(Title_Race,winner(Jockey_Winner,Horse_Winner))),!,
                                       write("Удаление прошло успешно!"),
                                       write('\10',"___________________________________", '\10'),
write('\10',"Введите новые данные: ",'\10'), 
                                       write("Введите новое состязание > "),readln(New_Title_Race),
                                       write("Введите новое имя жокея - победителя состязания > "),readln(New_Jockey_Winner),
                                       write("Введите новое кличку лошади - победителя состязания > "),readln(New_Horse_Winner),   
                                       assert(race_winner(New_Title_Race,winner(New_Jockey_Winner,New_Horse_Winner))),
                                       write("Изменение прошло успешно!"),
                                       write('\10',"___________________________________", '\10'),fail. 
                                       
switch(Case):-Case= '7',retractall(_),consult("C:/Labs/Prolog/db.txt"),write("Загружено из файла C:/Labs/Prolog/db.txt"),nl,fail.

switch(Case):-Case= '8',save("C:/Labs/Prolog/db.txt"),write("Сохранено в файл C:/Labs/Prolog/db.txt"),nl,fail.      
                      
switch(Case):-Case= '9',write('\10'),
	jockey_Horse(Jockey_Name,Horse_Moniker),write("Имя жокея: ",Jockey_Name,". Кличка лошади: ",Horse_Moniker),nl,fail.
	
switch(Case):-Case= '9',write('\10'),
	race_winner(Title_Race,winner(Jockey_Winner,Horse_Winner)),write("Состязание: ",Title_Race,". Победитель состязания (Жокей и Лошадь) : ", Jockey_Winner," и ", Horse_Winner),nl,fail.
	                               
goal
repeat,
  write('\10',"1 - Добавить жокея и лошадь",'\10',
                   "2 - Добавить состязание и победителя",'\10',
                   "3 - Удалить жокея и лошадь",'\10',
                   "4 - Удалить состязание и победителя",'\10',
                   "5 - Редактировать название жокея и лошадь",'\10',
                   "6 - Редактировать состязание и победителя",'\10',
                   "7 - Загрузить из файла",'\10',
                   "8 - Сохранить в файл",'\10',
                   "9 - Вывод на экран ",'\10',
                   "0 - Выход",'\10'),
  readchar(X),nl,switch(X),!.