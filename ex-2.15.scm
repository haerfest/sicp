;; No.
;; 
;; I would say that since the operations of multiplication, division, and
;; to a lesser degree addition, add up uncertanties, you want to prevent
;; combining two uncertain values in a single operation that increases the
;; final uncertainty.
;;
;; par1 does that three times: 1 x multiplication, 1 x addition, and then a
;; final division.

;; par2 only does that once (1 x addition), and three times performs an
;; operation on an uncertainty and the number one without uncertainty
;; (3 x division).
