;;;; etoh.units.asd

(asdf:defsystem #:etoh.units
  :description "Common and uncommon units used in adult beverage production."
  :author "Elliott Johnson <elliott@elliottjohnson.net>"
  :license "LLGPL"
  :serial t
  :depends-on ("unit-formulas")
  :components ((:file "package")
               (:file "etoh.units")))

