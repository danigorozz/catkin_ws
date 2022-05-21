#!/usr/bin/env python

import rospy
import darknet_ros_msgs as dark
import numpy as np

class Bboxes_V2:
    def __init__(self):
        
        depth_topic = "depth_image"
        bboxes_topic = "darknet_ros/bounding_boxes"
        
        self.pub_rgb = rospy.Publisher('subimg', sensor_msgs.msg.Image, queue_size=10)
        
        sub_depth = message_filters.Subscriber(self.depth_topic, sensor_msgs.msg.Image)
        sub_bboxes = message_filters.Subscriber(self.bboxes_topic, dark.msg.BoundingBoxes)
        
        message_filter = message_filters.ApproximateTimeSynchronizer([sub_depth, sub_bboxes], 10, 0.5) 
        message_filter.registerCallback(self.callback)
    
    def callback(self, depth_msg, bboxes_msg):
        
        #img = np.ndarray(shape=(depth_msg.height, depth_msg.width), dtype=np.uint8, buffer=depth_msg.data) 
        img = np.array(depth_msg.data).reshape(depth_msg.height, depth_msg.width)
        bboxes = bboxes_msg.bounding_boxes
        
        n_bboxes = len(bboxes)
        
        
        xmin = bboxes[0].xmin
        xmax = bboxes[0].xmax
        ymin = bboxes[0].ymin
        ymax = bboxes[0].ymax
        
            
        subimg = img[ymin:ymax+1, xmin:xmax+1]
        
        new_msg.header = depth_msg.header;
        new_msg.encoding = depth_msg.encoding;
        new_msg.is_bigendian = depth_msg.is_bigendian;
            
            
            
            
            

if __name__ == '__main__':
    rospy.init_node('bboxes_v2', anonymous=True)
    myNode = Bboxes_V2()
    rospy.spin()
