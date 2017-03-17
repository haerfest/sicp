(define (filtered-accumulate combiner null-value term a next b filter?)
  (if (> a b)
      null-value
      (let ((acc (filtered-accumulate combiner null-value term (next a) next b filter?)))
        (if (filter? a)
            (combiner (term a) acc)
            acc))))

(define (sum-squared-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (product-relative-prime-integers-below n)
  (define (relative-prime? i)
    (= (gcd i n) 1))
  (filtered-accumulate * 1 id 1 inc (- n 1) relative-prime?))

(define (id x) x)

(define (inc x) (+ x 1))

(define (prime? n)
  (fast-prime? n 5))

(define (fast-prime? n times)
  (cond ((= n 1) true)  ; calling (fermat-test 1) will fail
        ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

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

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))