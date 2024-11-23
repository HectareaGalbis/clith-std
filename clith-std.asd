
(defsystem "clith-std"
  :author "Héctor Galbis Sanchis"
  :description "Clith expansions for Common Lisp standard functions."
  :license "MIT"
  :depends-on ("alexandria" "clith")
  :components ((:module "src"
                :serial t
                :components ((:file "package")
                             (:file "expansions")))))
