#lang plait

(require "arithlang.rkt")

(test (eval `4) 4)
(test (eval `0) 0)
(test/exn (eval `k) "Expression is not valid")


(test (eval `(+ 1 2)) 3)
(test (eval `(+ (+ 1 2) 3)) 6)
(test (eval `(+ 1 (+ 2 3))) 6)
(test (eval `(+ 1 (* 2 3))) 7)
(test/exn (eval `(+ k s)) "Expression is not valid.")


(test (eval `(* 2 3)) 6)
(test (eval `(* (+ 1 2) (* 2 5))) 30)
(test (eval `(* 0 3)) 0)
(test (eval `(* 5 (+ 3 5))) 40)
(test/exn (eval `(* k s)) "Expression is not valid.")


(test (eval `(- 3 1)) 2)
(test (eval `(- 10 20)) -10)
(test (eval `(- 4 0)) 4)
(test (eval `(- (+ 5 5) (* 2 3))) 4)
(test/exn (eval `(- 1 k)) "Expression is not valid.")


(test (eval `(- 0)) 0)
(test (eval `(- 5)) -5)
(test (eval `(- (- 5))) 5)
(test (eval `(- (* 10 3))) -30)
(test (eval `(- 4.52)) -4.52)
(test/exn (eval `(- a)) "Expression is not valid")

(test/exn (eval `(k 1 3)) "List is not valid.")
(test/exn (eval `(% (+ 1 3) (* 1 3))) "List is not valid.")