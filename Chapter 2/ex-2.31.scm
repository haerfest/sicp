(define (tree-map f tree)
  (if (pair? tree)
      (map (lambda (x)
             (tree-map f x))
           tree)
      (f tree)))

(define (square x) (* x x))

(define (square-tree tree) (tree-map square tree))
