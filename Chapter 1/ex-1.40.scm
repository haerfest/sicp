; Calculates x^3 + ax^2 + bx + c.
(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a x x)
       (* b x)
       c)))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define tolerance 0.00001)

; Finds a fixed point x of f, where f(x) = x.
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; Returns a function that calculates the Newton transform of g,
; namely x - g(x) / g'(x).
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define dx 0.00001)

; Returns a function that calculates g'(x).
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

; x^3 = 0
; => {math}
; x = 0
(newtons-method (cubic 0 0 0) 1)  ; => 2.6531990291797187e-05

; x^3 + x^2 + x - 14 = 0
; => {math}
; x = 2
(newtons-method (cubic 1 1 -14) 1)  ; => 2.0000000000000133