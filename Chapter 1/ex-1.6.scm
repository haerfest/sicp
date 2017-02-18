; The new-if function will cause all its arguments to be
; evaluated, always, since it is not a special form. That
; means that the recursive definition of sqrt-iter will
; always evaluate the improvement step, ad infinitum. The
; program will not terminate, or crash.