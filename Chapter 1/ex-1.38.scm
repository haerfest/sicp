(define (cont-frac n d k)
  (define (recur i)
    (if (> i k)
        0
        (/ (n i) (+ (d i)
                    (recur (+ i 1))))))
  (recur 1))

(define (div a b)
  (floor (/ a b)))

(define (e k)
  (+ 2.0
     (cont-frac (lambda (i) 1.0)
                (lambda (i)
                  (let ((j (remainder (- i 1) 3)))
                    (cond ((= j 0) 1.0)
                          ((= j 1) (+ 2.0 (* 2.0 (div (- i 1) 3))))
                          ((= j 2) 1.0))))
                k)))

(e 20)  ; => 2.7182818284590452