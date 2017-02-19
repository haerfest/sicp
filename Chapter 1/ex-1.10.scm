(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; > (A 1 10)
; 1024

; > (A 2 4)
; 65536

; > (A 3 3)
; 65536

; (f n) = (A 0 n)
; (f n) = (* 2 n)
; f(n) = 2n
(define (f n) (A 0 n))

; (g n) = (A 1 n)
; (g n) = (A 0 (A 1 (- n 1)))
; (g n) = (f (A 1 (- n 1)))
; (g 4) = (f (A 1 3))
; (g 4) = (f (f (A 1 2)))
; (g 4) = (f (f (f (A 1 1)))
; (g 4) = (f (f (f 2)))
; (g 4) = (* 2 (* 2 (* 2 2)))
; (g 4) = (* 2 2 2 2)
; (g 4) = (pow 2 4)
; g(n) = 2^n
(define (g n) (A 1 n))

; (h n) = (A 2 n)
; (h n) = (A 1 (A 2 (- n 1)))
; (h n) = (g (A 2 (- n 1)))
; (h 4) = (g (A 2 3))
; (h 4) = (g (g (A 2 2)))
; (h 4) = (g (g (g (A 2 1))))
; (h 4) = (g (g (g 2)))
; (h 4) = (pow 2 (pow 2 (pow 2 2)))
; h(n) = 2^(2^(2^( ... ^2)))  (raise power n-1 times)
(define (h n) (A 2 n))