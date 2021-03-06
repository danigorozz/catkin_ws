#!/usr/bin/env python3

import rospy
import numpy as np
from sensor_msgs.msg import Image, LaserScan
from rospy.numpy_msg import numpy_msg
from rospy_tutorials.msg import Floats

class DepthSmashing:
    
    angle_increment = np.pi / 1200
    angle_min = -4*np.pi/15
    angle_max = 4*np.pi/15
    range_min = 0.0
    range_max = 20.0
    
    def __init__(self):
        #self.depth_sub = rospy.Subscriber('depth_image', Image, self.depth_callback)
        self.laser_sub = rospy.Subscriber('scan', LaserScan, self.laser_callback)
        self.array_sub = rospy.Subscriber('array', numpy_msg(Floats), self.array_callback)
        self.pub = rospy.Publisher('new_scan', LaserScan, queue_size=10)
        
    def laser_callback(self, msg):

        self.time_increment = msg.time_increment
        self.scan_time = msg.scan_time
        self.intensities = msg.intensities
        
    def array_callback(self, msg):
        arr = np.reshape(msg.data, (480, 640))
        height, width = arr.shape
        image_c, image_r = np.meshgrid(np.arange(width), np.arange(height), sparse=True)
        
        cx = 320
        cy = 240
        fx = 304.0859
        fy = 312.7741
        depth_range_max = 10.0
        
        z = arr 
        x = ((cx - image_c) * z / fx)
        
        ranges = np.where((z < 1000.0) & (z >= 0), z, 0)
        ranges = np.amax(ranges, axis=0)
        
        self.ranges = ranges.tolist()
        
        new_laser = LaserScan()
        new_laser.header.stamp = rospy.Time.now()
        new_laser.header.frame_id = "Laser_0"
        new_laser.angle_min = self.angle_min
        new_laser.angle_max = self.angle_max
        new_laser.angle_increment = self.angle_increment
        new_laser.time_increment = self.time_increment
        new_laser.scan_time = self.scan_time
        new_laser.range_min = self.range_min
        new_laser.range_max = self.range_max
        new_laser.ranges = self.ranges
        new_laser.intensities = self.intensities
        self.pub.publish(new_laser)

    

if __name__ == '__main__':
    rospy.init_node('depth_smashing', anonymous=True)
    myNode = DepthSmashing()
    rospy.spin()


