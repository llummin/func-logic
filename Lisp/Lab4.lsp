;Lab4.

(defun add-to-tree (v tree)
    (cond ((null tree)(list nil v nil))
        ((> v (cadr tree))
            (list (car tree)(cadr tree)(add-to-tree v (caddr tree))))
        (t (list (add-to-tree v (car tree))(cadr tree)(caddr tree)))))

(defun UTree (lst &optional (tree nil))
    (cond ((null lst ) tree)
        (t (UTree (cdr lst)
           (add-to-tree (car lst) tree)))))

(defun inp ()
 (setq my-input (open "C:/Labs/Lisp/inpdata.txt" :direction :input))
 (setq my-output (open "C:/Labs/Lisp/outdata.txt" :direction :output))
    (setq x (read my-input))
    (setq y (UTree x))
    (print y)
    (princ y my-output)
    (close my-input)
    (close my-output)
)

(trace UTree)

(defun UFunc (tree)
  (cond ((and (null (car tree)) (null (caddr tree))) 0)
         ((> (cadr tree) 0)
        (+ (cadr tree) (UFunc (car tree))(UFunc (caddr tree))))
        (t  (+ (UFunc (car tree)) (UFunc (caddr tree))))))

(trace UFunc)

(defun out ()
 (setq my-input (open "C:/Labs/Lisp/outdata.txt" :direction :input))
   (setq my-output (open "C:/Labs/Lisp/out.txt" :direction :output))
    (setq x (read my-input))
    (setq y (UFunc x))
    (print y)
    (princ y my-output)
    (close my-input)
    (close my-output)
)

(setq tree '(10 5 15 6 16 4 14 3 13))
