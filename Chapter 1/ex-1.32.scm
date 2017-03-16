(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (accumulate-it combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (id x) x)
(define (inc x) (+ x 1))

(define (factorial n)
  (accumulate * 1 id 1 inc n))

(define (factorial-it n)
  (accumulate-it * 1 id 1 inc n))

(factorial 10)     ; => 3628800
(factorial-it 10)  ; => 3628800