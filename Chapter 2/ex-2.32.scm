(define nil '())

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest
                (map (lambda (r) (cons (car s) r))
                     rest)))))

;; Subsets are defined recursively as the subsets of all but the first item,
;; plus the same subsets but now with the first item prepended.
