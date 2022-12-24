(defconstant PI 3.141592)                 ; Объявляем константу PI

(defun UF1 (x)                            ; Функция для вычисления UF1(x) = 2sin(x) + cos(2x)
	(+ (* 2 (sin x)) (cos (* 2 x)))
)

(defun UF2 (x)                            ; Функция для вычисления UF1(x) = 2sin(x) + cos(2x)
	(expt (cos (+ x (/ PI 4))) 2)
)
 
(defun UFR (x)                            ; Функция для двухэлементного списка,
	(list (UF1 x) (UF2 x))                ; элементами которого будут результаты 
)                                         ; функций UF1 и UF2 

(setq x1 (reverse UFR))                   ; Вывод обратного списка UFR 
(setq x2 (length UFR))                    ; Вывод длины списка
(setq x3 (eval (cons '+ UFR)))            ; Вывод результата сложения элементов списка


