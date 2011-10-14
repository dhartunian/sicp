Copyright (C) 2010 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO warranty; not even for
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Tuesday March 9, 2010 at 9:43:38 PM
  Release 9.0.1 || Microcode 15.1 || Runtime 15.7 || Win32 1.8 || SF 4.41 || LIAR/i386 4.118
  Edwin 3.116
;You are in an interaction window of the Edwin editor.
;Type `C-h' for help, or `C-h t' for a tutorial.
;`C-h m' will describe some commands.
;`C-h' means: hold down the Ctrl key and type `h'.
;Package: (user)

(define (smallest-divisor n)
  (find-divisor n 2))
;Value: smallest-divisor


(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
;Value: find-divisor


(define (divides? a b)
  (= (remainder b a) 0))
;Value: divides?


(define (prime? n)
  (= n (smallest-divisor n)))
;Value: prime?


; n is prime
; a^n mod n = a mod n

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
;Value: expmod

(define (try-it a n)
  (= (expmod a n n) a))
;Value: try-it

  
(define (fermat-test n)
  ((lambda (a) (= (expmod a n n) a))
   (+ 1 (random (- n 1)))))
;Value: fermat-test


(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
;Value: fast-prime?


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
