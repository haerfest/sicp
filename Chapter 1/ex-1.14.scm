; Order of growth in space: O(n).
; Order of growth in steps: O(2^n).
;
; The ugly code below prints a Graphviz file to standard output.

(define *node-id* 0)

(define (node-id)
  (set! *node-id* (inc *node-id*))
  *node-id*)

(define (count-change amount)
  (display "graph {\n")
  (let ((a (cc amount 5 *node-id*)))
    (display "}\n")
    a))

(define (cc amount kinds-of-coins id)
  (if (> id 0)
    (begin
      (display "{ ") (display id) (display "[label=\"(cc ") (display amount) (display " ") (display kinds-of-coins) (display ")\"] }\n")))
    
  (cond ((= amount 0)
         (display id) (display "[style=filled,color=\".7 .3 1.0\"]\n")
         1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else
         (display "  { ") (display id) (display "[label=\"(cc ") (display amount) (display " ") (display kinds-of-coins) (display ")\"] } -- ")
         (let ((a (cc amount
                      (- kinds-of-coins 1)
                      (node-id))))
           (display "  { ") (display id) (display "[label=\"(cc ") (display amount) (display " ") (display kinds-of-coins) (display ")\"] } -- ")
           (let ((b (cc (- amount
                           (first-denomination kinds-of-coins))
                        kinds-of-coins
                        (node-id))))
             (+ a b))))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))