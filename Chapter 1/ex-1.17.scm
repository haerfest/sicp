; When b even:
; a * b
; => {arithmetic}
; a * b * 1
; => {arithmetic}
; a * b * 2/2
; => {arithmetic}
; a * 2 * b / 2
; => {arithmetic}
; (a * 2) * (b / 2)
; => {even b, definition}
; (* (double a) (halve b))
;
; When b odd:
; (* a b)
; => {definition}
; a * b
; => {arithmetic}
; a * (1+b-1)
; => {arithmetic}
; a + a * (b-1)
; => {definition}
; (+ a (* a (- b 1)))

(define (* a b)
  (define (double x)
    (+ x x))
  (define (halve x)
    (/ x 2))
  (define (even? x)
    (= (remainder x 2) 0))
  (cond ((= b 0) 0)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))))