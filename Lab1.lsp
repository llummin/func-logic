(defconstant PI 3.141592)

(defun UF1 (x) 
	(+ (* 2 (sin x)) (cos (* 2 x)))
)

(defun UF2 (x)
	(expt (cos (+ x (/ PI 4))) 2)
)

(defun UFR (x)
	(list (UF1 x) (UF2 x))
)

(setq x1 (reverse UFR))
(setq x2 (length UFR))
(setq x3 (eval (cons '+ UFR)))


