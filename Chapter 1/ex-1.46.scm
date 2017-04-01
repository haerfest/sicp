(define (iterative-improve good-enough? improve)
  (lambda (initial-guess)
    (define (try guess)
      (if (good-enough? guess)
          guess
          (try (improve guess))))
    (try initial-guess)))

(define (sqrt x)
  ((iterative-improve (lambda (guess) (< (abs (- x (square guess))) 0.001))
                      (lambda (guess) (average guess (/ x guess))))
   1.0))

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (guess) (< (abs (- guess (f guess))) 0.00001))
                      f)
   first-guess))