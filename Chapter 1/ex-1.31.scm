(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (inc x) (+ x 1))
(define (id x) x)

(define (factorial n)
  (product id 1 inc n))

(define (pi n)
  (define (term denominator)
    (/ (* (- denominator 1) (+ denominator 1))
       (* denominator denominator)))
  (define (next denominator)
    (+ denominator 2))
  (* 4.0 (product term 3 next n)))

(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-rec term (next a) next b))))
