;;;; oeno.units.asd

(asdf:defsystem #:oeno.units
  :description "Common and uncommon units used in beverage production."
  :author "Elliott Johnson <elliott@elliottjohnson.net>"
  :license "LLGPL"
  :serial t
  :depends-on ("unit-formulas")
  :components ((:file "package")
               (:file "oeno.units")))

