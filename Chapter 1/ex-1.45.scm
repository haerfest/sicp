; Easily testable by trying various values for n and (pow 2 n): it should always
; return a value close to 2.0 when it converges:
; > (nth-root 5 (pow 2 5))
; 2.0000015129957607
;
; Experiments show:
;
; nth-root | required dampening | log2(n)
; ---------+--------------------+--------
;     2    |        1x          |  1.0
;     3    |        1x          |  1.6
;     4    |        2x          |  2.0
;     5    |        2x          |  2.3
;     6    |        2x          |  2.6
;     7    |        2x          |  2.8
;     8    |        3x          |  3.0
;    15    |        3x          |  3.9
;    16    |        4x          |  4.0
;
; To have calculating the nth-root converge, a dampening must be repeated
; x times, where x = floor(log2(n)).

(define (nth-root n x)
  (fixed-point-of-transform (lambda (y) (/ x (pow y (- n 1))))
                            (repeated average-damp (floor (log2 n)))
                            1.0))

(define (log2 x) (/ (log x) (log 2)))

(define (pow x y)
  (if (= y 0)
      1
      (* x (pow x (- y 1)))))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y) 2))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x)
    (f (g x))))