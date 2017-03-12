; Non-primes check out:
; > (map miller-rabin-test '(4 6 8 9 10 12 14 15))
; (#f #f #f #f #f #f #f #f)
;
; So do primes:
; > (map miller-rabin-test '(2 3 5 7 11 13))
; (#t #t #t #t #t #t)
;
; Is not fooled by the Carmichael numbers, as was the Fermat-test:
; > (map miller-rabin-test '(561 1105 1729 2465 2821 6601))
; (#f #f #f #f #f #f)

(define (miller-rabin-test n)
  (define (try-it a count)
    (cond ((= 0 count) true)
          ((= (expmod a (- n 1) n) 1) (try-it (+ 1 (random (- n 1)))
                                              (- count 1)))
          (else false)))
  (try-it (+ 1 (random (- n 1)))
          (+ 1 (floor (/ n 2)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (let* ((number (expmod base (/ exp 2) m))
                (number-squared (remainder (square number) m)))
           (if (non-trivial-square-root? number number-squared m)
               0
               number-squared)))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (non-trivial-square-root? x x-squared n)
  (and (= x-squared 1)
       (not (= x 1))
       (not (= x (- n 1)))))
      
(define (even? x)
  (= (remainder x 2) 0))

(define (square x)
  (* x x))