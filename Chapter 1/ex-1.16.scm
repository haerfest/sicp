
; When n even:
; (iter a b n)
; => {definition}
; a * b^n
; => {n even, arithmetic}
; a * b^(2n/2)
; => {arithmetic}
; a * (b^2)^(n/2)
; => {definition}
; (iter a (* b b) (/ n 2))
;
; When n odd:
; (iter a b n)
; => {definition}
; a * b^n
; => {n odd, arithmetic}
; a * b^(1+n-1)
; => {arithmetic}
; a * b^1 * b^(n-1)
; => {arithmetic}
; (a * b) * b^(n-1)
; => {definition}
; (iter (* a b) b (- n 1))

(define (fast-expt b n)
  (define (even? x)
    (= (remainder x 2) 0))
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n)  (iter a
                            (* b b)
                            (/ n 2)))
          (else (iter (* a b)
                      b
                      (- n 1)))))
  (iter 1 b n))