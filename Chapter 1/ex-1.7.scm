; The original-good-enough? test returns true when:
;   guess^2 - x < 0.001, or
;   guess^2 < 0.001 + x, or
;   guess < sqrt(0.001 + x)
;
; If x is very small, this is approximately equal to:
;   guess < sqrt(0.001)
;
; This means the procedure *always* ends as soon as the
; guess approaches 0.03, which means it cannot find the
; square root of numbers smaller than 0.001.
;
; For example, the square root of 0.0001 is 0.01, yet:
;   > (square-root 0.0001)
;   0.03230844833048122
;
; It doesn't work for finding the square root of very
; large numbers either, because it will overflow in:
;   guess^2
;
; The guess^2 will result in a very large negative number,
; yet the |guess^2 - x| will turn this in a very large
; positive number. This number will always fail the < 0.001
; test, and the procedure will never terminate.
;
; For example, the square root of 1e50 is 1e25, yet it hits
; the precision boundaries of Racket v6.8 and never terminate.

(define (original-good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; This new good-enough? works correctly for both very small
; numbers and very large ones:
;
; > (sqrt 0.0001)
; 0.010000000025490743
;
; > (sqrt 1e50)
; 1.0000003807575104e+25
;
; Note that you have to check whether the difference between
; the previous and the new guess is smaller or *equal* to a
; fraction of the new guess. Otherwise (sqrt 0) would never
; terminate, since (< 0 0) is #f.

(define (good-enough? guess prev-guess)
  (<= (abs (- guess prev-guess))
     (* guess 0.001)))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 0.0 x))