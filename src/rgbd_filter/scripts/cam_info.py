#!/usr/bin/env python

import rospy

from sensor_msgs.msg import Image, CameraInfo

import geometry_msgs


class Cam_info:
    
    def callback(self, data):
        
        msg = CameraInfo()
        msg.header = data.
        
    
    def __init__(self):
        
        self.sub_topic = "/camera_down/depth/image"
        self.pub_topic = "/camera_info"
        
        self.sub = rospy.Subscriber(self.sub_topic, Image, callback)
        self.pub = rospy.Publisher(self.pub_topic, CameraInfo, queue_size=10)
        
        

