(defun add-to-tree (v tree)                                               ; Функция добавления числа в дерево
    (cond ((null tree)(list nil v nil))                                   ; Если дерево пустое, то создаем корневой узел
        ((> v (cadr tree))                                                ; Если добавляемый элемент больше, чем элемент в корне
            (list (car tree)(cadr tree)(add-to-tree v (caddr tree))))     ; Добавляем в правую часть дерева
        (t (list (add-to-tree v (car tree))(cadr tree)(caddr tree)))))    ; Иначе добавляем в левую часть

(defun UTree (lst &optional (tree nil))                                   ; Функция для преобразования списка в дерево
    (cond ((null lst ) tree)                                              ; Если список пуст, то возвращаем накопленное
        (t (UTree (cdr lst)                                               ; Рекурсивно UTree и добавляем голову списка 
           (add-to-tree (car lst) tree)))))

(defun inp ()                                                             ; Функция для прочтения списка из файла и записывания дерева
 (setq my-input (open "C:/Labs/Lisp/inpdata.txt" :direction :input))      ; Открываем файл inpdata.txt - список
 (setq my-output (open "C:/Labs/Lisp/outdata.txt" :direction :output))    ; Открываем файл outdata.txt - дерево
    (setq x (read my-input))                                              ; Считываем содержимое файла inpdata.txt
    (setq y (UTree x))                                                    ; y = (UTree x)
    (print y)                                                             ; Записываем дерево
    (princ y my-output)                                                   ; Запись в файл (поток) символа
    (close my-input)                                                      ; Закрытие файла inpdata.txt
    (close my-output)                                                     ; Закрытие файла outdata.txt
)

(trace UTree)                                                             ; Применение отладочной функции trace

(defun UFunc (tree)                                                       ; Функция для вычисления суммы положительных узлов дерева
  (cond ((and (null (car tree)) (null (caddr tree))) 0)                     
         ((> (cadr tree) 0)                                               
        (+ (cadr tree) (UFunc (car tree))(UFunc (caddr tree))))            
        (t  (+ (UFunc (car tree)) (UFunc (caddr tree))))))

(trace UFunc)                                                             ; Применение отладочной функции trace

(defun out ()                                                             ; Функция для прочтения дерева из файла и записывания результата
 (setq my-input (open "C:/Labs/Lisp/outdata.txt" :direction :input))      ; Открываем файл outdata.txt - дерево
   (setq my-output (open "C:/Labs/Lisp/out.txt" :direction :output))      ; Открываем файл out.txt - результат
    (setq x (read my-input))                                              ; Считываем содержимое файла outdata.txt
    (setq y (UFunc x))                                                    ; y = (UFunc x)
    (print y)                                                             ; Записываем результат
    (princ y my-output)                                                   ; Запись в файл (поток) символа
    (close my-input)                                                      ; Закрытие файла inpdata.txt
    (close my-output)                                                     ; Закрытие файла out.txt
)

(setq tree '(10 5 15 6 16 4 14 3 13))                                     ; Входные данные
