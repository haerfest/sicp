(define (f g)
  (g 2))

; (f f)
; => {definition}
; (f 2)
; => {definition}
; (2 2)
;
; It will try to apply the procedure 2 to the argument 2 and fail since 2 is not
; a valid procedure.