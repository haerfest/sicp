(define (reverse items)
  (define (inner items reversed)
    (if (null? items)
        reversed
        (inner (cdr items) (cons (car items) reversed))))
  (inner items '()))
        
    
