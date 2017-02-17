; With applicative-order evaluation, the interpreter will first
; evaluate all the operands. The second operand results in an
; infinite recursive evaluation, and the interpreter will either
; hang or crash by running out of stack space.
;
; With normal-order evaluation, the interpreter will not evaluate
; the operands until their values are needed. The expression will
; never get to evaluating the value of the y argument, since the
; x argument of zero will cause the if-expression to immediately
; return zero also:
;
; (test 0 (p))
; =>
; (if (= 0 0) 0 (p))
; =>
; 0