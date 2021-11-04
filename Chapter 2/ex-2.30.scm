(define nil '())

(define (square-tree tree)
  (cond ((null? tree) nil)
        ((pair? tree) (cons (square-tree (car tree))
                            (square-tree (cdr tree))))
        (else (* tree tree))))

(define (square-tree tree)
  (if (pair? tree)
      (map square-tree tree)
      (* tree tree)))
