(in-package :ksquant)

(defun flat (list)
  (labels ((rec (obj accum)
             (cond
               ((consp obj)
                (rec (cdr obj) (rec (car obj) accum)))
               ((null obj) accum)
               (t (cons obj accum)))))
    (nreverse (rec list nil))))

(defun gen-duration ()
  (lambda ()
    (random 5.0)))

(defun gen-sorted-list (start end &key (duration (gen-duration)))
  (lambda ()
    (iter
      (for dur = (funcall duration))
      (for x initially start then (+ x dur))
      (cond
        ((< x end)
         (collect x))
        (t (collect end)
           (terminate))))))

(defun group-by-grid (time-points grid-points)
  (labels ((rec (time-points grid-points group groups)
             (cond
               ((null grid-points)
                (nreverse groups))
               ((and time-points
                     (< (car time-points) (car grid-points)))
                (rec (cdr time-points) grid-points
                     (cons (car time-points) group) groups))
               (t (rec time-points (cdr grid-points)
                       nil (cons (nreverse group) groups))))))
    (assert (and (consp grid-points) (cdr grid-points)) nil
            "GRID-POINTS needs to be a list of min length 2.")
    (rec (remove-if #'(lambda (x) (< x (car grid-points))) time-points)
         (cdr grid-points) nil nil)))

(test group-by-grid
  (is (equal '((0 0.5) (1 1.75)) (group-by-grid '(0 0.5 1 1.75 2) '(0 1 2))))
  (is (equal '((0.5) (1 1.75)) (group-by-grid '(0 0.5 1 1.75 2) '(0.5 1 2))))
  (is (equal '(nil (5 6) nil) (group-by-grid '(5 6) '(0 2 8 10))))
  (is (equal '(nil (5) nil) (group-by-grid '(5 16) '(0 2 8 10))))
  (signals error (group-by-grid '(0 0.5 1 1.75 2) nil))
  (signals error (group-by-grid '(0 0.5 1 1.75 2) '(0)))
  (for-all ((time-points (gen-sorted-list 0.0 10.0))
            (grid-points (gen-sorted-list 0 10 :duration (gen-integer :min 1 :max 3))))
    (let ((groups (group-by-grid time-points grid-points)))
      (is (= (1- (length grid-points)) (length groups)))
      (is (equal (remove-if-not #'(lambda (x) (and (<= (first grid-points) x)
                                                   (< x (first (last grid-points)))))
                                time-points)
                 (flat groups))))))
