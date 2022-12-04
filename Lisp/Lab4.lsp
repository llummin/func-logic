;Lab4

;Функция для добавления числа в список
(defun add-to-tree (v tree)
    (cond ((null tree)(list nil v nil))
        ((> v (cadr tree))
            (list (car tree)(cadr tree)(add-to-tree v (caddr tree))))
        (t (list (add-to-tree v (car tree))(cadr tree)(caddr tree)))))

;Функция для преобразоваения списка в дерево
(defun list-to-tree (lst &optional (tree nil))
    (cond ((null lst ) tree)
        (t (list-to-tree (cdr lst) (add-to-tree (car lst) tree)))))

;Сумма всех чисел в дереве
(defun sum-to-tree (tree)
    (cond ((numberp tree) tree)
        ((atom tree) 0)
        (t (+ (sum-to-tree (car tree))
              (sum-to-tree (cdr tree))))))


(defun get-tree-data ()
    (with-open-file (stream "C:\Labs\Lisp\timber.txt")
        (let ((tree-loc (read stream))
               (tree-table (read stream))
               (num-trees (read stream)))
        (format t "~&There are ~S trees on ~S."
                num-trees tree-loc)
        (format t "~&They are: ~S" tree-table))))



