#lang racket

(require rackunit
         rackunit/text-ui
         "problemas.rkt")

(define-test-suite pruebas
  (test-case "countdown"
    (check-equal? (countdown 5)
                  '(5 4 3 2 1 0))
    (check-equal? (countdown 1)
                  '(1 0))
    (check-equal? (countdown 0)
                  '(0)))
  
  (test-case "insertL"
    (check-equal? (insertL 'x 'y '(x z z x y x))
                  '(y x z z y x y y x))
    (check-equal? (insertL 'z '1 '(x z z x y x))
                  '(x 1 z 1 z x y x))
    (check-equal? (insertL 'a 'y '(x z z x y x))
                  '(x z z x y x)))
  
  (test-case "remv-1st"
    (check-equal? (remv-1st 'x '(x y z x))
                  '(y z x))
    (check-equal? (remv-1st 'y '(x y z y x))
                  '(x z y x))
    (check-equal? (remv-1st 'z '(a b c))
                  '(a b c))
    (check-equal? (remv-1st 'a '(a b c))
                  '(b c)))

  (test-case "map"
    (check-equal? (map sub1 '(1 2 3 4))
                  '(0 1 2 3))
    (check-equal? (map add1 '(1 2 3 4))
                  '(2 3 4 5))
    (check-equal? (map abs '(-1 -2 -3 -4))
                  '(1 2 3 4)))
  
  (test-case "filter"
    (check-equal? (filter even? '(1 2 3 4 5 6))
                  '(2 4 6))
    (check-equal? (filter odd? '(1 2 3 4 5 6))
                  '(1 3 5))
    (check-equal? (filter positive? '(-1 2 3 -4 5 -6))
                  '(2 3 5))
    (check-equal? (filter zero? '(1 2 3 4))
                  '()))
  
  (test-case "zip"
    (check-equal? (zip '(1 2 3) '(a b c))
                  '((1 . a) (2 . b) (3 . c)))
    (check-equal? (zip '(1 2 3 4 5 6) '(a b c))
                  '((1 . a) (2 . b) (3 . c)))
    (check-equal? (zip '(1 2 3) '(a b c d e f))
                  '((1 . a) (2 . b) (3 . c)))
    (check-equal? (zip '() '(a b c d e f))
                  '())
    (check-equal? (zip '(1 2 3 4 5 6) '())
                  '()))
  
  (test-case "list-index-ofv"
    (check-eqv? (list-index-ofv 'x '(x y z x x)) 0)
    (check-eqv? (list-index-ofv 'x '(y z x x)) 2)
    (check-eqv? (list-index-ofv 1 '(0 2 4 1)) 3))
  
  (test-case "append"
    (check-equal? (append '(42 120) '(1 2 3))
                  '(42 120 1 2 3))
    (check-equal? (append '(a b c) '(cat dog))
                  '(a b c cat dog))
    (check-equal? (append '() '(1 2 3))
                  '(1 2 3))
    (check-equal? (append '(a b c) '())
                  '(a b c))))
    

(run-tests pruebas 'verbose)
