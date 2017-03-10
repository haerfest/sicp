; > (map congruent? '(561 1105 1729 2465 2821 6601))
; (#t #t #t #t #t #t)

(define (congruent? n)
  (define (try-it a)
    (cond ((= a n) true)
          ((= (expmod a n n) a) (try-it (+ a 1)))
          (else false)))
  (try-it 1))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (even? x)
  (= (remainder x 2) 0))

(define (square x)
  (* x x))