;Lab3

(setf (get 'penza 'x) -300)
(setf (get 'penza 'y) -300)
(setf (get 'kazan 'x) 0)
(setf (get 'kazan 'y) 0)
(setf (get 'votkinsk 'x) 200)
(setf (get 'votkinsk 'y) 100)

(defun UF1(a b)
    (do ( (count 0 (1+ count))
          (result 0 (+ result a)))
        ((>= count b) result)
    )
)

(setq a 50)
(setq b 9)
(setq result (UF1 a b))

(defun UF2(a b c)
    (let ((x1 (get a 'x))
          (y1 (get a 'y))
          (x2 (get b 'x))
          (y2 (get b 'y))
          (x3 (get c 'x))
          (y3 (get c 'y)))
    (/ (+ (+ (sqrt (+ (expt (- x2 x1) 2) (expt (- y2 y1) 2)))
    (sqrt (+ (expt (- x3 x1) 2) (expt (- y3 y1) 2))))
    (sqrt (+ (expt (- x3 x2) 2) (expt (- y3 y2) 2))))3)))



