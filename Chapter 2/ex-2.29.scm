(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; a.

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

;; b.

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (pair? structure)
        (total-weight structure)
        structure)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

;; c.

(define (balanced? mobile)
  (let* ((left (left-branch mobile))
         (right (right-branch mobile))
         (left-structure (branch-structure left))
         (right-structure (branch-structure right)))
    (and (= (* (branch-weight left)
               (branch-length left))
            (* (branch-weight right)
               (branch-length right)))
         (or (not (pair? left-structure))
             (balanced? left-structure))
         (or (not (pair? right-structure))
             (balanced? right-structure)))))


(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

;; d.

(define (right-branch mobile)
  (cdr mobile))

(define (branch-structure branch)
  (cdr branch))


;;    o
;;   / \
;;  /   \
;; 6     o
;;      / \
;;     /   \
;;    o     3
;;   / \
;;  /   2
;; 1

(define mobile
  (make-mobile
   (make-branch 2 6)
   (make-branch 2 (make-mobile
                   (make-branch 2 (make-mobile
                                   (make-branch 2 1)
                                   (make-branch 1 2)))
                   (make-branch 2 3)))))
