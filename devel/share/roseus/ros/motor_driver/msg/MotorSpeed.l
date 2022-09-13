;; Auto-generated. Do not edit!


(when (boundp 'motor_driver::MotorSpeed)
  (if (not (find-package "MOTOR_DRIVER"))
    (make-package "MOTOR_DRIVER"))
  (shadow 'MotorSpeed (find-package "MOTOR_DRIVER")))
(unless (find-package "MOTOR_DRIVER::MOTORSPEED")
  (make-package "MOTOR_DRIVER::MOTORSPEED"))

(in-package "ROS")
;;//! \htmlinclude MotorSpeed.msg.html


(defclass motor_driver::MotorSpeed
  :super ros::object
  :slots (_motor1 _motor2 ))

(defmethod motor_driver::MotorSpeed
  (:init
   (&key
    ((:motor1 __motor1) 0)
    ((:motor2 __motor2) 0)
    )
   (send-super :init)
   (setq _motor1 (round __motor1))
   (setq _motor2 (round __motor2))
   self)
  (:motor1
   (&optional __motor1)
   (if __motor1 (setq _motor1 __motor1)) _motor1)
  (:motor2
   (&optional __motor2)
   (if __motor2 (setq _motor2 __motor2)) _motor2)
  (:serialization-length
   ()
   (+
    ;; int64 _motor1
    8
    ;; int64 _motor2
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _motor1
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _motor1 (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _motor1) (= (length (_motor1 . bv)) 2)) ;; bignum
              (write-long (ash (elt (_motor1 . bv) 0) 0) s)
              (write-long (ash (elt (_motor1 . bv) 1) -1) s))
             ((and (class _motor1) (= (length (_motor1 . bv)) 1)) ;; big1
              (write-long (elt (_motor1 . bv) 0) s)
              (write-long (if (>= _motor1 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _motor1 s)(write-long (if (>= _motor1 0) 0 #xffffffff) s)))
     ;; int64 _motor2
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _motor2 (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _motor2) (= (length (_motor2 . bv)) 2)) ;; bignum
              (write-long (ash (elt (_motor2 . bv) 0) 0) s)
              (write-long (ash (elt (_motor2 . bv) 1) -1) s))
             ((and (class _motor2) (= (length (_motor2 . bv)) 1)) ;; big1
              (write-long (elt (_motor2 . bv) 0) s)
              (write-long (if (>= _motor2 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _motor2 s)(write-long (if (>= _motor2 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _motor1
#+(or :alpha :irix6 :x86_64)
      (setf _motor1 (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _motor1 (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _motor2
#+(or :alpha :irix6 :x86_64)
      (setf _motor2 (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _motor2 (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get motor_driver::MotorSpeed :md5sum-) "de01eb387e2d4e889acdbdc65ebb888d")
(setf (get motor_driver::MotorSpeed :datatype-) "motor_driver/MotorSpeed")
(setf (get motor_driver::MotorSpeed :definition-)
      "int64 motor1
int64 motor2
")



(provide :motor_driver/MotorSpeed "de01eb387e2d4e889acdbdc65ebb888d")


