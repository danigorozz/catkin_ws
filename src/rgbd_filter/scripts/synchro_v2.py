#!/usr/bin/env python

import rospy
from rospy.numpy_msg import numpy_msg
from rospy_tutorials.msg import Floats
import numpy as np
import message_filters
import sensor_msgs
import geometry_msgs
import cv2
from cv_bridge import CvBridge

class SynchroV2:

    def __init__(self):
        
        self.image_rgb_topic = "RobotAtVirtualHome/VirtualCameraRGB"
        self.image_depth_topic = "RobotAtVirtualHome/VirtualCameraDepth"
        self.pose_topic = "amcl_pose"
        
        self.pub_rgb = rospy.Publisher('rgb_image', sensor_msgs.msg.Image, queue_size=10)
        self.pub_depth = rospy.Publisher('depth_image', sensor_msgs.msg.Image, queue_size=10)
        self.pub_pose = rospy.Publisher('pose', geometry_msgs.msg.Pose, queue_size=10)
        
        self.pub_array = rospy.Publisher('array', numpy_msg(Floats), queue_size=10)
        
        sub_rgb_image = message_filters.Subscriber(self.image_rgb_topic, sensor_msgs.msg.CompressedImage) 
        sub_depth_image = message_filters.Subscriber(self.image_depth_topic, sensor_msgs.msg.CompressedImage) 
        sub_pose_amcl = message_filters.Subscriber(self.pose_topic, geometry_msgs.msg.PoseWithCovarianceStamped) 

        message_filter = message_filters.ApproximateTimeSynchronizer([sub_depth_image, sub_rgb_image, sub_pose_amcl], 10, 0.5) 
        message_filter.registerCallback(self.callback_virtual_image) 
            
            
    @staticmethod 
    def decode_image_rgb_from_unity(unity_img): 
        np_arr = np.fromstring(unity_img, np.uint8) 
        im = cv2.imdecode(np_arr, -1) 
        img_rgb = cv2.cvtColor(im, cv2.COLOR_RGB2BGR) 
        return img_rgb 

    
    @staticmethod 
    def decode_image_depth_from_unity(unity_img): 
        buf = np.ndarray(shape=(1, len(unity_img)), dtype=np.uint8, buffer=unity_img) 
        img_depth = cv2.imdecode(buf, cv2.IMREAD_UNCHANGED) 
        img_depth = np.divide(img_depth, 65535.0) 
        return img_depth

    def callback_virtual_image(self, depth_msg, rgb_msg, pose_msg): 

        self._bridge = CvBridge()
        
        # Si se van a utilizar las imagenes con opencv: 
        img_rgb_cv2 = self.decode_image_rgb_from_unity(rgb_msg.data) 
        img_depth_cv2 = self.decode_image_depth_from_unity(depth_msg.data) 

        # Si se quieren las imágenes en el tipo de mensaje de ROS sensors_msgs/Image: 
        img_rgb_ros = self._bridge.cv2_to_imgmsg(img_rgb_cv2, 'rgb8')
        
        img_depth_cv2 = (img_depth_cv2 * 255).round().astype(np.uint8)
        img_depth_ros = self._bridge.cv2_to_imgmsg(img_depth_cv2, 'mono8') 

        # La pose se incluye en el mensaje pose_msg 
        pose_data = pose_msg.pose.pose 
        
        self.pub_rgb.publish(img_rgb_ros)
        self.pub_depth.publish(img_depth_ros)
        self.pub_pose.publish(pose_data)
        
        array_msg = np.reshape(img_depth_cv2, -1)
        self.pub_array.publish(array_msg)



if __name__ == '__main__':
    rospy.init_node('synchro_v2', anonymous=True)
    myNode = SynchroV2()
    rospy.spin()
