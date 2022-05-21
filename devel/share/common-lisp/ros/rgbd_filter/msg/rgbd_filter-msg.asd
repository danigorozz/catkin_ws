
(cl:in-package :asdf)

(defsystem "rgbd_filter-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CustomArray" :depends-on ("_package_CustomArray"))
    (:file "_package_CustomArray" :depends-on ("_package"))
  ))