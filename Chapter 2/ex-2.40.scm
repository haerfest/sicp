(load "ex-2.33.scm")                    ; accumulate

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval i j)
  (if (> i j)
      nil
      (cons i (enumerate-interval (+ i 1) j))))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list j i))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))
