;Lab2

(defun UF1(n m)
    (if (zerop n) 0 (+ m (UF1 (1- n) m)))
)

(trace UF1)
(setq my-output-stream (open "C:\LL\XL\outdata.txt" :direction :output))
(princ s my-output-stream)
(terpri my-output-stream)
(close my-output-stream)

