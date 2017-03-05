; When b even:
; (iter acc a b)
; => {definition}
; acc + a * b
; => {arithmetic}
; acc + a * b * 1
; => {arithmetic}
; acc + a * b * 2/2
; => {arithmetic}
; acc + a * 2 * b / 2
; => {arithmetic}
; acc + (a * 2) * (b / 2)
; => {even b, definition}
; (iter acc (double a) (halve b))
;
; When b odd:
; (iter acc a b)
; => {definition}
; acc + a * b
; => {arithmetic}
; acc + a * (1+b-1)
; => {arithmetic}
; acc + a + a * (b-1)
; => {arithmetic}
; (acc + a) + a * (b-1)
; => {definition}
; (iter (+ acc a) a (- b 1))

(define (* a b)
  (define (double x)
    (+ x x))
  (define (halve x)
    (/ x 2))
  (define (even? x)
    (= (remainder x 2) 0))
  (define (iter acc a b)
    (cond ((= b 0) acc)
          ((even? b) (iter acc
                           (double a)
                           (halve b)))
          (else (iter (+ acc a)
                      a
                      (- b 1)))))
  (iter 0 a b))