(defun UF1(n m)                                		  ; Функция для вычисления произведения двух целых положительных чисел
    (if (zerop n) 0 (+ m (UF1 (1- n) m)))             ; Для вычисления используется суммирование      
)

(trace UF1)                                           ; Применение отладочной функции trace
(setq my-output-stream                                ; Запись результата функции в файл
	(open "C:\LL\XL\outdata.txt" :direction :output)
)
(princ s my-output-stream)                            ; Запись в файл (поток) одного символа
(terpri my-output-stream)                             ; Поместить в конец потока символ перевода строки
(close my-output-stream)                              ; Закрытие файла