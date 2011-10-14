;row = n
;number of item is m

;    1
;   1 1
;  1 2 1
; 1 3 3 1
;1 4 6 4 1

(define pascal-helper
  (lambda (m n)
    (cond ((eq? n m) 1)
          ((eq? m 1) 1)
          (else (+ (pascal-helper m (- n 1))
             (pascal-helper (- m 1) (- n 1)))))))

(define pascal-iterator
  (lambda (m n)
    (cond ((eq? m 0) '())
          (else (cons (pascal-helper m n)
                (pascal-iterator (- m 1) n))))))

(define pascal
  (lambda (n)
    (pascal-iterator n n)))
     
; (pascal-helper 2 5)
; (+ (pascal-helper 2 4)
;    (pascal-helper 1 4))
; (+ (+ (pascal-helper 2 3)
;       (pascal-helper 1 3))
;    1)
; (+ (+ (+ (pascal-helper 2 2)
;          (pascal-helper 1 2))
;        1)
;     1)
;
                               