(define (cont-frac n d k)
  (define (recur i)
    (if (> i k)
        0
        (/ (n i) (+ (d i)
                    (recur (+ i 1))))))
  (recur 1))

(/ 1.0 1.6180)
; => 0.6180469715698392
; 0.6180 at 4 decimal places

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
; => 0.6179775280898876
; 0.6179 at 4 decimal places

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)
; => 0.6180555555555556
; 0.6180 at 4 decimal places

(define (cont-frac-iter n d k)
  (define (iter i acc)
    (if (= i 0)
        acc
        (iter (- i 1)
              (/ (n i) (+ (d i) acc)))))
  (iter k 0))