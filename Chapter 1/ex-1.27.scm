; > (congruent? 561)
; #t
; > (congruent? 1105)
; #t
; > (congruent? 1729)
; #t
; > (congruent? 2465)
; #t
; > (congruent? 2821)
; #t
; > (congruent? 6601)
; #t

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