; Auto-generated. Do not edit!


(cl:in-package rgbd_filter-msg)


;//! \htmlinclude CustomArray.msg.html

(cl:defclass <CustomArray> (roslisp-msg-protocol:ros-message)
  ((array
    :reader array
    :initarg :array
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass CustomArray (<CustomArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CustomArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CustomArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rgbd_filter-msg:<CustomArray> is deprecated: use rgbd_filter-msg:CustomArray instead.")))

(cl:ensure-generic-function 'array-val :lambda-list '(m))
(cl:defmethod array-val ((m <CustomArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rgbd_filter-msg:array-val is deprecated.  Use rgbd_filter-msg:array instead.")
  (array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CustomArray>) ostream)
  "Serializes a message object of type '<CustomArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'array))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CustomArray>) istream)
  "Deserializes a message object of type '<CustomArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CustomArray>)))
  "Returns string type for a message object of type '<CustomArray>"
  "rgbd_filter/CustomArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CustomArray)))
  "Returns string type for a message object of type 'CustomArray"
  "rgbd_filter/CustomArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CustomArray>)))
  "Returns md5sum for a message object of type '<CustomArray>"
  "71f1005c81b671681646a574c6360c24")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CustomArray)))
  "Returns md5sum for a message object of type 'CustomArray"
  "71f1005c81b671681646a574c6360c24")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CustomArray>)))
  "Returns full string definition for message of type '<CustomArray>"
  (cl:format cl:nil "float32[] array~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CustomArray)))
  "Returns full string definition for message of type 'CustomArray"
  (cl:format cl:nil "float32[] array~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CustomArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CustomArray>))
  "Converts a ROS message object to a list"
  (cl:list 'CustomArray
    (cl:cons ':array (array msg))
))
