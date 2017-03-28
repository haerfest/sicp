(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x)
  (+ x 1))

(((double (double double)) inc) 5)  ; => 21

; (double inc) = inc . inc = inc^2
; ((double double) inc) = (inc . inc) . (inc . inc) = inc^4
; ((double (double double)) inc) = inc^4 . inc^4 = inc^16
;
; It executes inc 16 times, and (inc^16 5) = 21.