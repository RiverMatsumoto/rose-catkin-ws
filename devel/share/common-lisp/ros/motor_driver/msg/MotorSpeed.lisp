; Auto-generated. Do not edit!


(cl:in-package motor_driver-msg)


;//! \htmlinclude MotorSpeed.msg.html

(cl:defclass <MotorSpeed> (roslisp-msg-protocol:ros-message)
  ((motor1
    :reader motor1
    :initarg :motor1
    :type cl:integer
    :initform 0)
   (motor2
    :reader motor2
    :initarg :motor2
    :type cl:integer
    :initform 0))
)

(cl:defclass MotorSpeed (<MotorSpeed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorSpeed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorSpeed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name motor_driver-msg:<MotorSpeed> is deprecated: use motor_driver-msg:MotorSpeed instead.")))

(cl:ensure-generic-function 'motor1-val :lambda-list '(m))
(cl:defmethod motor1-val ((m <MotorSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_driver-msg:motor1-val is deprecated.  Use motor_driver-msg:motor1 instead.")
  (motor1 m))

(cl:ensure-generic-function 'motor2-val :lambda-list '(m))
(cl:defmethod motor2-val ((m <MotorSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_driver-msg:motor2-val is deprecated.  Use motor_driver-msg:motor2 instead.")
  (motor2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorSpeed>) ostream)
  "Serializes a message object of type '<MotorSpeed>"
  (cl:let* ((signed (cl:slot-value msg 'motor1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'motor2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorSpeed>) istream)
  "Deserializes a message object of type '<MotorSpeed>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'motor1) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'motor2) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorSpeed>)))
  "Returns string type for a message object of type '<MotorSpeed>"
  "motor_driver/MotorSpeed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorSpeed)))
  "Returns string type for a message object of type 'MotorSpeed"
  "motor_driver/MotorSpeed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorSpeed>)))
  "Returns md5sum for a message object of type '<MotorSpeed>"
  "de01eb387e2d4e889acdbdc65ebb888d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorSpeed)))
  "Returns md5sum for a message object of type 'MotorSpeed"
  "de01eb387e2d4e889acdbdc65ebb888d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorSpeed>)))
  "Returns full string definition for message of type '<MotorSpeed>"
  (cl:format cl:nil "int64 motor1~%int64 motor2~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorSpeed)))
  "Returns full string definition for message of type 'MotorSpeed"
  (cl:format cl:nil "int64 motor1~%int64 motor2~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorSpeed>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorSpeed>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorSpeed
    (cl:cons ':motor1 (motor1 msg))
    (cl:cons ':motor2 (motor2 msg))
))
