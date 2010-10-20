(in-package :asdf)

(defsystem #:ksquant-test
  :components
  ((:module :test
            :serial t
	    :components
	    ((:file "suite")
	     (:file "main")
	     (:file "simple2voice-basic"))))
  :depends-on (:ksquant :fiveam))

