; With applicative order evaluation, a function's arguments are evaluated first,
; prior to calling the function.  This means that in (square x), the argument x
; is evaluated once, and in (* x x), the argument x is evaluated twice.
;
; Below the (expmod ...) expression is evaluated once, and the reduction of the
; problem size by (/ exp 2) results in an order of growth O(log2(n)):
;
;   (square (expmod base (/ exp 2) m))
;
; But below both (expmod ...) expressions are evaluated, and even though each
; evaluation is on half the problem size, because we are doing it twice for
; every step, it is effectively O(2^n * log2(n)), cancelling each other
; out:
; 
;   (* (expmod base (/ exp 2) m)
;      (expmod base (/ exp 2) m))
;
; The net order of growth is therefore just O(n).

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
