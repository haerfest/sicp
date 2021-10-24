;; Represent pairs of non-negative integers a and b as 2^a x 3^b.

(define (pow x y)
  (cond
   ((= y 0) 1)
   ((= y 1) x)
   (else (* x (pow x (- y 1))))))

(define (multiples-of n x)
  (if (> (remainder x n) 0)
      0
      (+ 1 (multiples-of n (quotient x n)))))

(define (cons a b)
  (* (pow 2 a) (pow 3 b)))

(define (car z)
  (multiples-of 2 z))

(define (cdr z)
  (multiples-of 3 z))
