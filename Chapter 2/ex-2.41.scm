(load "ex-2.40.scm")                    ; filter, flatmap

(define (ordered-triples n s)
  (filter (lambda (triple)
            (= s (accumulate + 0 triple)))
          (flatmap (lambda (k)
                     (flatmap (lambda (j)
                                (map (lambda (i) (list i j k))
                                     (enumerate-interval 1 (- j 1))))
                              (enumerate-interval 2 (- k 1))))
                   (enumerate-interval 3 n))))
