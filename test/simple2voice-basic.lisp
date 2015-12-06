(in-package :ksquant)

(in-suite :ksquant-test)

(deftest simple2voice-basic.1
  (is (equal '(((1 ((1 :NOTES (60))))
                (1 ((1 :NOTES (60))))
                (1 ((1 :NOTES (60))))
                (1 ((1 :NOTES (60))))
                :TIME-SIGNATURE
                (4 4)
                :METRONOME
                (4 60)))
             (SIMPLE2VOICE '((0.0 :NOTES (60))
                             (1.0 :NOTES (60))
                             (2.0 :NOTES (60))
                             (3.0 :NOTES (60))
                             4.0)
                           :TIME-SIGNATURES
                           '(4 4)
                           :METRONOMES
                           '(4 60)
                           :SCALE
                           '1/4
                           :MAX-DIV
                           '8
                           :FORBIDDEN-DIVS
                           '(7)
                           :FORBIDDEN-PATTS
                           NIL
                           :MERGE-MARKER
                           :BARTOK-PIZZICATO))))

(deftest simple2voice-basic.2
  (is (equal '(((1 ((1 :NOTES (60))))
                (1 ((1 :NOTES (60))))
                (1 ((1 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (4 4)
                :METRONOME
                (4 60))
               ((1 ((1.0 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                (1 ((1 :NOTES (60))))
                :TIME-SIGNATURE
                (4 4)
                :METRONOME
                (4 60)))
             (SIMPLE2VOICE '((0.0 :NOTES (60))
                             (1.0 :NOTES (60))
                             (2.0 :NOTES (60))
                             (7.0 :NOTES (60))
                             8.0)
                           :TIME-SIGNATURES
                           '(4 4)
                           :METRONOMES
                           '(4 60)
                           :SCALE
                           '1/4
                           :MAX-DIV
                           '8
                           :FORBIDDEN-DIVS
                           '(7)
                           :FORBIDDEN-PATTS
                           NIL
                           :MERGE-MARKER
                           :BARTOK-PIZZICATO))))

(deftest simple2voice-basic.3
  (is (equal '(((1
                 ((1 :NOTES (66))
                  (1 :NOTES (66))
                  (1 :NOTES (66))
                  (1 :NOTES (66))
                  (1 :NOTES (66))))
                (1 ((1 :NOTES (66)) (1 :NOTES (66)) (1 :NOTES (66)) (1 :NOTES (66))))
                (1 ((1 :NOTES (66)) (1 :NOTES (66)) (1 :NOTES (66))))
                (1 ((1 :NOTES (66)) (1 :NOTES (66))))
                :TIME-SIGNATURE
                (4 4)
                :METRONOME
                (4 60)))
             (SIMPLE2VOICE '((0.0 :NOTES (66))
                             (0.2 :NOTES (66))
                             (0.4 :NOTES (66))
                             (0.6 :NOTES (66))
                             (0.8 :NOTES (66))
                             (1.0 :NOTES (66))
                             (1.25 :NOTES (66))
                             (1.5 :NOTES (66))
                             (1.75 :NOTES (66))
                             (2.0 :NOTES (66))
                             (2.333 :NOTES (66))
                             (2.667 :NOTES (66))
                             (3.0 :NOTES (66))
                             (3.5 :NOTES (66))
                             4.0)
                           :TIME-SIGNATURES
                           '(4 4)
                           :METRONOMES
                           '(4 60)
                           :SCALE
                           '1/4
                           :MAX-DIV
                           '8
                           :FORBIDDEN-DIVS
                           '(7)
                           :FORBIDDEN-PATTS
                           NIL
                           :MERGE-MARKER
                           :BARTOK-PIZZICATO))))

(deftest simple2voice-basic.4
  (is (equal '(((1
                 ((1 :NOTES (66))
                  (1 :NOTES (66))
                  (1 :NOTES (66))
                  (1 :NOTES (66))
                  (-1 :NOTES (60))))
                (1
                 ((1 :NOTES (66)) (1 :NOTES (66)) (-1 :NOTES (60)) (1 :NOTES (66))))
                (1 ((1 :NOTES (66)) (-1 :NOTES (60)) (1 :NOTES (66))))
                (1 ((1 :NOTES (66)) (1 :NOTES (66))))
                :TIME-SIGNATURE
                (4 4)
                :METRONOME
                (4 60)))
             (SIMPLE2VOICE '((0.0 :NOTES (66))
                             (0.2 :NOTES (66))
                             (0.4 :NOTES (66))
                             (0.6 :NOTES (66))
                             -0.8
                             (1.0 :NOTES (66))
                             (1.25 :NOTES (66))
                             -1.5
                             (1.75 :NOTES (66))
                             (2.0 :NOTES (66))
                             -2.333
                             (2.667 :NOTES (66))
                             (3.0 :NOTES (66))
                             (3.5 :NOTES (66))
                             4.0)
                           :TIME-SIGNATURES
                           '(4 4)
                           :METRONOMES
                           '(4 60)
                           :SCALE
                           '1/4
                           :MAX-DIV
                           '8
                           :FORBIDDEN-DIVS
                           '(7)
                           :FORBIDDEN-PATTS
                           NIL
                           :MERGE-MARKER
                           :BARTOK-PIZZICATO))))

(deftest simple2voice-basic.5
  (is (equal '(((1
                 ((1 :NOTES (70 67))
                  (1 :NOTES (70 65))
                  (1 :NOTES (70 65))
                  (1 :NOTES (70 77))
                  (-1 :NOTES (60))))
                (1
                 ((1 :NOTES (65 70))
                  (1 :NOTES (73 70))
                  (-1 :NOTES (60))
                  (1 :NOTES (70 66))))
                (1 ((1 :NOTES (70 73)) (-1 :NOTES (60)) (1 :NOTES (70 70))))
                (1 ((1 :NOTES (70 73)) (1 :NOTES (70 66))))
                :TIME-SIGNATURE
                (4 4)
                :METRONOME
                (4 60)))
             (SIMPLE2VOICE '((0.0 :NOTES (70 67))
                             (0.2 :NOTES (70 65))
                             (0.4 :NOTES (70 65))
                             (0.6 :NOTES (70 77))
                             -0.8
                             (1.0 :NOTES (65 70))
                             (1.25 :NOTES (73 70))
                             -1.5
                             (1.75 :NOTES (70 66))
                             (2.0 :NOTES (70 73))
                             -2.333
                             (2.667 :NOTES (70 70))
                             (3.0 :NOTES (70 73))
                             (3.5 :NOTES (70 66))
                             4.0)
                           :TIME-SIGNATURES
                           '(4 4)
                           :METRONOMES
                           '(4 60)
                           :SCALE
                           '1/4
                           :MAX-DIV
                           '8
                           :FORBIDDEN-DIVS
                           '(7)
                           :FORBIDDEN-PATTS
                           NIL
                           :MERGE-MARKER
                           :BARTOK-PIZZICATO))))

(deftest simple2voice-basic.6
  (is (equal '(((2 ((1 :NOTES (60))))
                (1 ((1 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1.0 :NOTES (60)) (1 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1 :NOTES (60))))
                (1 ((-1 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60)))
             (SIMPLE2VOICE '((0.0 :NOTES (60))
                             (1.0 :NOTES (60))
                             (2.0 :NOTES (60))
                             (3.0 :NOTES (60))
                             4.0)
                           :TIME-SIGNATURES
                           '(3 8)
                           :METRONOMES
                           '(4 60)
                           :SCALE
                           '1/4
                           :MAX-DIV
                           '8
                           :FORBIDDEN-DIVS
                           '(7)
                           :FORBIDDEN-PATTS
                           NIL
                           :MERGE-MARKER
                           :BARTOK-PIZZICATO))))

(deftest simple2voice-basic.7
  (is (equal '(((2 ((1 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1.0 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1.0 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1.0 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1.0 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1.0 :NOTES (60)) (1 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1 :NOTES (60))))
                (1 ((1 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1.0 :NOTES (60)) (-1 :NOTES (60))))
                (1 ((-1 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60)))
             (SIMPLE2VOICE '((0.0 :NOTES (60))
                             (8.0 :NOTES (60))
                             (9.0 :NOTES (60))
                             (10.0 :NOTES (60))
                             11.0)
                           :TIME-SIGNATURES
                           '(3 8)
                           :METRONOMES
                           '(4 60)
                           :SCALE
                           '1/4
                           :MAX-DIV
                           '8
                           :FORBIDDEN-DIVS
                           '(7)
                           :FORBIDDEN-PATTS
                           NIL
                           :MERGE-MARKER
                           :BARTOK-PIZZICATO))))

(deftest simple2voice-basic.8
  (is (equal '(((2 ((1 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1.0 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1.0 :NOTES (60)) (4 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1.0 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((2.0 :NOTES (60)) (3 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1.0 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((3.0 :NOTES (60)) (2 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((1.0 :NOTES (60))))
                (1 ((1.0 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60))
               ((2 ((4.0 :NOTES (60)) (-1 :NOTES (60))))
                (1 ((-1 :NOTES (60))))
                :TIME-SIGNATURE
                (3 8)
                :METRONOME
                (4 60)))
             (SIMPLE2VOICE '((0.0 :NOTES (60))
                             (1.0 :NOTES (60))
                             (2.0 :NOTES (60))
                             (3.0 :NOTES (60))
                             4.0)
                           :TIME-SIGNATURES
                           '(3 8)
                           :METRONOMES
                           '(4 60)
                           :SCALE
                           '0.8
                           :MAX-DIV
                           '8
                           :FORBIDDEN-DIVS
                           '(7)
                           :FORBIDDEN-PATTS
                           NIL
                           :MERGE-MARKER
                           :BARTOK-PIZZICATO))))
