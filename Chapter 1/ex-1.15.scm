; a) 5x
; > (sine 12.15)
;   (p (sine (/ 12.15 3.0)))
;   (p (sine 4.05))
;   (p (p (sine (/ 4.05 3.0))))
;   (p (p (sine 1.35)))
;   (p (p (p (sine (/ 1.35 3.0)))))
;   (p (p (p (sine 0.45))))
;   (p (p (p (p (sine (/ 0.45 3.0))))))
;   (p (p (p (p (sine 0.15)))))
;   (p (p (p (p (p (sine (/ 0.15 3.0)))))))
;   (p (p (p (p (p (sine 0.05))))))
;   (p (p (p (p (p 0.05)))))
;
; b) Order of growth of space depends linearly on the angle, so O(n).
;    Order of growth of steps also depends linearly on the angle, as in each
;    invocation of sine at most one branch is taken. The problem is reduced
;    in each step by n / 3.

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))