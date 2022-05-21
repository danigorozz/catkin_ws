;; Auto-generated. Do not edit!


(when (boundp 'rgbd_filter::CustomArray)
  (if (not (find-package "RGBD_FILTER"))
    (make-package "RGBD_FILTER"))
  (shadow 'CustomArray (find-package "RGBD_FILTER")))
(unless (find-package "RGBD_FILTER::CUSTOMARRAY")
  (make-package "RGBD_FILTER::CUSTOMARRAY"))

(in-package "ROS")
;;//! \htmlinclude CustomArray.msg.html


(defclass rgbd_filter::CustomArray
  :super ros::object
  :slots (_array ))

(defmethod rgbd_filter::CustomArray
  (:init
   (&key
    ((:array __array) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _array __array)
   self)
  (:array
   (&optional __array)
   (if __array (setq _array __array)) _array)
  (:serialization-length
   ()
   (+
    ;; float32[] _array
    (* 4    (length _array)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _array
     (write-long (length _array) s)
     (dotimes (i (length _array))
       (sys::poke (elt _array i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _array
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _array (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _array i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get rgbd_filter::CustomArray :md5sum-) "71f1005c81b671681646a574c6360c24")
(setf (get rgbd_filter::CustomArray :datatype-) "rgbd_filter/CustomArray")
(setf (get rgbd_filter::CustomArray :definition-)
      "float32[] array

")



(provide :rgbd_filter/CustomArray "71f1005c81b671681646a574c6360c24")


