;; By switching the order of the nested mappings, Louis Reasoner is now
;; calculating all ways to place k - 1 queens on the board *each* time he
;; checks whether queen k can be placed in any of the k possible positions.
;;
;; Before, all ways to place the k - 1 queens were calculated only once, and
;; for each possibility, the k ways in which the k'th queen might be placed
;; are evaluated.
;;
;; The expensive bit is done once, the cheap bit is repeated. Louis Reasoner's
;; version flips this around, he performs the cheap bit once and repeats the
;; expensive bit.
;;
;; If the program from exercise 2.42 solves it in T time, than we can simplify
;; by stating that generating all ways to place k - 1 queens takes T time,
;; since that is by far the most expensive operation.
;;
;; Since Louis Reasoner's version recalculates that k times, his program
;; effectively takes k times as long, or k x T.
