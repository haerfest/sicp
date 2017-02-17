(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (>= x y z)
  (and (not (< x y))
       (not (< y z))))

(define (sum-of-squares-of-two-larger x y z)
  (cond ((>= x y z) (sum-of-squares x y))
        ((>= x z y) (sum-of-squares x z))
        ((>= y x z) (sum-of-squares y x))
        ((>= y z x) (sum-of-squares y z))
        ((>= z x y) (sum-of-squares z x))
        ((>= z y x) (sum-of-squares z y))))