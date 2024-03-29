(define (fringe tree)
  (define (iter tree leaves)
    (if (null? tree)
        leaves
        (let ((left (car tree))
              (leaves (iter (cdr tree) leaves)))
          (if (pair? left)
              (append (fringe left) leaves)
              (cons left leaves)))))
  (iter tree '()))
