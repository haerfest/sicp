(load "ex-2.40.scm")                    ; filter, flatmap

(define empty-board nil)

(define (in-sight-of? row delta-row positions)
  (cond ((null? positions) #f)
        ((= (car positions) row) #t)
        (else (in-sight-of? (+ row delta-row) delta-row (cdr positions)))))

(define (safe? k positions)             ; assume (safe? (- k 1) positions)
  (let ((row (car positions))
        (rest-of-queens (cdr positions)))
    (not (or (in-sight-of? row        0 rest-of-queens)
             (in-sight-of? (dec row) -1 rest-of-queens)
             (in-sight-of? (inc row)  1 rest-of-queens)))))

(define (adjoin-position row k board)
  (cons row board))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions)
                  (safe? k positions))
                (flatmap (lambda (rest-of-queens)
                           (map (lambda (new-row)
                                  (adjoin-position new-row k rest-of-queens))
                                (enumerate-interval 1 board-size)))
                         (queen-cols (- k 1))))))
  (queen-cols board-size))
