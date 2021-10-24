;; Return a lambda that applies f zero times to x.
(define zero
  (lambda (f)
    (lambda (x)
      x)))

;; Return a lambda that applies f (n + 1) times to x.
(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

;; (add-1 zero)
;; =
;; (lambda (f) (lambda (x) (f ((zero f) x))))
;; =
;; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;; =
;; (lambda (f) (lambda (x) (f x)))

;; Return a lambda that applies f one time to x.
(define one
  (lambda (f)
    (lambda (x)
      (f x))))

;; (add-1 one)
;; =
;; (lambda (f) (lambda (x) (f ((one f) x))))
;; =
;; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
;; =
;; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
;; =
;; (lambda (f) (lambda (x) (f (f x))))

;; Return a lambda that applies f two times to x.
(define two
  (lambda (f)
    (lambda (x)
      (f ((one f) x)))))

;; Return a lambda that applies f (n + m) times to x.
(define (plus n m)
  (lambda (f)
    (lambda (x)
      ((n f) ((m f) x)))))

;; Tests:
;; 
;; ((zero 1+) 10)
;; => 10
;; ((one 1+) 10)
;; => 11
;; ((two 1+) 10)
;; => 12
;; (((plus one two) 1+) 10)
;; => 13
      
