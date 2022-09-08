#lang plait


(define-type ArithC
  (numC [n : Number])
  (plusC [l : ArithC] [r : ArithC])
  (multC [l : ArithC] [r : ArithC]))


(define-type ArithS
  (numS [n : Number])
  (plusS [l : ArithS] [r : ArithS])
  (multS [l : ArithS] [r : ArithS])
  (subtS [l : ArithS] [r : ArithS])
  (negS [n : ArithS]))

(define (parse [s : S-Exp]) : ArithS
  (cond
    [(s-exp-number? s) (numS (s-exp->number s))]
    [(s-exp-list? s)
     (let ([sl (s-exp->list s)])
       (case (s-exp->symbol (first sl))
         [(+) (plusS (parse (second sl)) (parse (third sl)))]
         [(*) (multS (parse (second sl)) (parse (third sl)))]
         [(-) (if (= (length sl) 2)
                  (negS (parse (second sl)))
                  (subtS (parse (second sl)) (parse (third sl))))]
         [else (error 'parse "List is not valid.")]))]
    [else (error 'parse "Expression is not valid.")]))

(define (interp [a : ArithC]) : Number
  (type-case ArithC a
    [(numC n) n]
    [(plusC l r) (+ (interp l) (interp r))]
    [(multC l r) (* (interp l) (interp r))]))


(define (desugar [aS : ArithS]) : ArithC
  (type-case ArithS aS
    [(numS n) (numC n)]
    [(plusS l r) (plusC (desugar l) (desugar r))]
    [(multS l r) (multC (desugar l) (desugar r))]
    [(subtS l r) (plusC (desugar l) (multC (numC -1) (desugar r)))]
    [(negS n) (multC (numC -1) (desugar n))]))


(define (eval [input : S-Exp]) : Number
  (interp (desugar (parse input))))