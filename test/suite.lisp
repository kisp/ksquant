(in-package :ksquant)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (unintern (intern "TEST" "KSQUANT") "KSQUANT"))

(use-package :it.bese.FiveAM)

(5am:def-suite :ksquant-test)

