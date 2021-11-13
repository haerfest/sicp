(load "../Chapter 1/ex-1.33.scm")       ; prime?
(load "ex-2.33.scm")                    ; accumulate

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (filter pred items)
  (define (iter items)
    (cond ((null? items) nil)
          ((pred (car items)) (cons (car items) (iter (cdr items))))
          (else (iter (cdr items)))))
  (iter items))

(define (enumerate-interval i j)
  (if (> i j)
      nil
      (cons i (enumerate-interval (+ i 1) j))))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list j i))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (make-pair-sum pair)
  (let ((j (car pair))
        (i (cadr pair)))
    (list j i (+ j i))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))
