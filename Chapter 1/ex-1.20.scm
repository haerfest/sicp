(define (gcd a b)
  (if (= 0 b)
      a
      (gcd b (remainder a b))))

; Normal order:
; > (gcd 206 40)
; > (gcd 40 (remainder 206 40))
; going in: (remainder 206 40) gets evaluated for the (if (= 0 b) ...) as well
;           as for the (gcd (remainder b ...))
; > (gcd 6 (remainder 40 6))
; twice again
; > (gcd 4 (remainder 6 4))
; twice again
; > (gcd 2 (remainder 4 2))
; now once, for the (if (= 0 b) ...), and the iteration stops
; total #remainder operations: 7
;
; Applicative order:
; > (gcd 206 40)
; > (gcd 40 (remainder 206 40))
; once, before calling (gcd ...) again
; > (gcd 40 6)
; > (gcd 6 (remainder 40 6))
; once again
; > (gcd 6 4)
; > (gcd 4 (remainder 6 4))
; once again
; > (gcd 4 2)
; > (gcd 2 (remainder 4 2))
; once again
; > (gcd 2 0)
; the iteration stops
; total #remainder operations: 4