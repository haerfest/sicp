(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (g n)
  (define (g-iter n a b c)
    (cond ((= n 0) a)
          ((= n 1) b)
          ((= n 2) c)
          (else (g-iter (- n 1)
                        b
                        c
                        (+ c
                           (* 2 b)
                           (* 3 a))))))
  (g-iter n 0 1 2))