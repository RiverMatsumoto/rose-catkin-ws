
(cl:in-package :asdf)

(defsystem "motor_driver-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MotorSpeed" :depends-on ("_package_MotorSpeed"))
    (:file "_package_MotorSpeed" :depends-on ("_package"))
  ))