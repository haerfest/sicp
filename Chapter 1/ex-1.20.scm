(define (gcd a b)
  (if (= 0 b)
      a
      (gcd b (remainder a b))))

; In normal order the parameters to a function are not evaluated until their
; values are needed.  It requires 11 calls to the remainder function.
(gcd 206 40)
; => {definition}
(if (= 0 40)
    206
    (gcd 40 (remainder 206 40)))
; => {condition false}
(gcd 40 (remainder 206 40))
; => {definition}
(if (= 0 (remainder 206 40))
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
; => {evaluate condition: 1}
(if (= 0 6)
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
; => {condition false}
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; => {definition}
(if (= 0 (remainder 40 (remainder 206 40)))
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))))
; => {evaluate condition: 1+2=3}
(if (= 0 4)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))))
; => {condition false}
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40))))
; => {definition}
(if (= 0 (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40))))
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))))
; => {evaluate condition: 3+4=7}
(if (= 0 2)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))))
; => {condition false}
(gcd (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))
; => {definition}
(if (= 0 (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40)))))
    (remainder (remainder 206 40)
               (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40)
                                          (remainder 40 (remainder 206 40)))))))
; => {evaluate condition: 7+7=14}
(if (= 0 0)
    (remainder (remainder 206 40)
               (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40)
                                          (remainder 40 (remainder 206 40)))))))
; => {condition true}
(remainder (remainder 206 40)
           (remainder 40 (remainder 206 40)))
; => {evalute expression: 7+4=11}
2

; In applicative order the parameters to a function are evaluated before the
; function is called.  It requires 4 calls to the remainder function.
(gcd 206 40)
; => {definition}
(if (= 0 40)
    206
    (gcd 40 (remainder 206 40)))
; => {condition false}
(gcd 40 (remainder 206 40))
; => {applicative order: 1}
(gcd 40 6)
; => {definition}
(if (= 0 6)
    40
    (gcd 6 (remainder 40 6)))
; => {condition false}
(gcd 6 (remainder 40 6))
; => {applicative order: 1+1=2}
(gcd 6 4)
; => {definition}
(if (= 0 6)
    6
    (gcd 4 (remainder 6 4)))
; => {condition false}
(gcd 4 (remainder 6 4))
; => {applicative order: 2+1=3}
(gcd 4 2)
; => {definition}
(if (= 0 2)
    4
    (gcd 2 (remainder 4 2)))
; => {condition false}
(gcd 2 (remainder 4 2))
; => {applicative order: 3+1=4}
(gcd 2 0)
; => {definition}
(if (= 0 0)
    2
    (gcd 0 (remainder 2 0)))
; => {condition true}
2