(define x (list (list 1 2) 3 (list 4 (list 5 6))))

(define (count-leaves t)
  (accumulate (lambda (x y)
                (+ x y))
              0
              (map (lambda (x)
                     (if (pair? x)
                         (count-leaves x)
                         1))
                   t)))
