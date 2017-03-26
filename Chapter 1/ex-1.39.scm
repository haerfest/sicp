(define (cont-frac n d k)
  (define (recur i)
    (if (> i k)
        0
        (/ (n i) (- (d i)
                    (recur (+ i 1))))))
  (recur 1))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (* x x)))
             (lambda (i) (+ 1 (* (- i 1) 2)))  ; 1 3 5 7 9 ...
             k))

; tangent of 4.0 radials is 1.157821282349578
(tan-cf 4.0 18)  ; => 1.1578212823495773