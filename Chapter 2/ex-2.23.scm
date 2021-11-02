(define (for-each f items)
  (when (not (null? items))
    (f (car items))
    (for-each f (cdr items))))
