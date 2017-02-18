(define (good-enough? guess prev-guess)
  (<= (abs (- guess prev-guess))
     (* guess 0.001)))

(define (square x)
  (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (cube-root-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (cube-root-iter (improve guess x)
                      guess
                      x)))

(define (cube-root x)
  (cube-root-iter 1.0 0.0 x))