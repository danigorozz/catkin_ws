#! /usr/bin/env python3

# Libraries
import cv2
import rospy
import numpy as np
from cv_bridge import CvBridge, CvBridgeError

# ROS Messages
from sensor_msgs.msg import CameraInfo
from sensor_msgs.msg import CompressedImage, Image


class EmulatedCamera(object):

    def __init__(self):

        rospy.logwarn("Initializing emulated camera...")

        # Camera Calibration
        self._width = self.load_param('~image_width', 640)
        self._height = self.load_param('~image_height', 480)
        self._cx = self.load_param('~camera_cx', 320)
        self._cy = self.load_param('~camera_cy', 240)
        self._fx = self.load_param('~camera_fx', 304.0859)
        self._fy = self.load_param('~camera_fy', 312.7741)
        self._depth_range_max = self.load_param('~camera_depth_max_range', 10.0)

        # Subscribers
        rospy.Subscriber("/RobotAtVirtualHome/VirtualCameraRGB", CompressedImage, self._rgb_callback)
        rospy.Subscriber("/RobotAtVirtualHome/VirtualCameraDepth", CompressedImage, self._depth_callback)

        # Publishers
        self._rgb_pub = rospy.Publisher('camera/rgb', Image, queue_size=10)
        self._depth_pub = rospy.Publisher('camera/depth', Image, queue_size=10)
        self._info_pub = rospy.Publisher('camera/camera_info', CameraInfo, queue_size=10)

        # Code Control
        self._publish_rate = 10.0
        self._new_rgb_image = False
        self._new_depth_image = False
        self._counter = -1

        # Variables to store publishing messages
        self._processed_rgb = None
        self._processed_depth = None
        self._camera_info_msg = None

        # Handlers
        self._bridge = CvBridge()

        rospy.logwarn("Emulated camera is ready to use.")

    def create_camera_info_msg(self):
        msg = CameraInfo()
        msg.height = self._height
        msg.width = self._width
        msg.K = [self._fx, 0.0, self._cx, 0.0, self._fy, self._cy, 0.0, 0.0, 1.0]
        msg.distortion_model = "plumb_bob"
        msg.D = [0.0, 0.0, 0.0, 0.0, 0.0]
        msg.R = [1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0]
        msg.P = [self._fx, 0.0, self._cx, 0.0, 0.0, self._fy, self._cy, 0.0, 0.0, 0.0, 1.0, 0.0]

        return msg


    ####################################################################################################################
    # Node operation
    ####################################################################################################################
    def run(self):

        rate = rospy.Rate(self._publish_rate)

        self._camera_info_msg = self.create_camera_info_msg()

        while not rospy.is_shutdown():

            if self._new_rgb_image:

                self._counter += 1
                self._rgb_pub.publish(self._processed_rgb)
                self._camera_info_msg.header = self._processed_rgb.header
                self._camera_info_msg.header.seq = self._counter
                self._info_pub.publish(self._camera_info_msg)
                self._new_rgb_image = False

            if self._new_depth_image:

                self._counter += 1
                self._depth_pub.publish(self._processed_depth)
                self._camera_info_msg.header.seq = self._counter
                self._camera_info_msg.header.stamp = self._processed_depth.header.stamp
                self._info_pub.publish(self._camera_info_msg)
                self._new_depth_image = False

            rate.sleep()

    ####################################################################################################################
    # End node operation
    ####################################################################################################################

    # Callbacks functions definition
    def _rgb_callback(self, rgb_msg):

        rgb_img = self.decode_image_rgb_from_unity(rgb_msg.data)
        self._processed_rgb = self._bridge.cv2_to_imgmsg(rgb_img, 'rgb8')
        self._processed_rgb.header = rgb_msg.header
        self._new_rgb_image = True


    def _depth_callback(self, depth_msg):

        depth_img = self.decode_image_depth_from_unity(depth_msg.data)
        self._processed_depth = self._bridge.cv2_to_imgmsg(depth_img, '16UC1')
        self._processed_depth.header = depth_msg.header
        self._new_depth_image = True

    @staticmethod
    def decode_image_rgb_from_unity(unity_img):
        np_arr = np.fromstring(unity_img, np.uint8)
        im = cv2.imdecode(np_arr, -1)
        img_rgb = cv2.cvtColor(im, cv2.COLOR_RGB2BGR)

        return img_rgb

    @staticmethod
    def decode_image_depth_from_unity(unity_img):
        buf = np.ndarray(shape=(1, len(unity_img)),
                         dtype=np.uint8, buffer=unity_img)
        img_depth = cv2.imdecode(buf, cv2.IMREAD_UNCHANGED)

        return img_depth

    # Static Methods
    @staticmethod
    def load_param(param, default=None):
        new_param = rospy.get_param(param, default)
        rospy.loginfo("[Camera Emulator] %s: %s", param, new_param)
        return new_param

def main():
    rospy.init_node('emulate_camera', anonymous=True)
    node = EmulatedCamera()
    node.run()


if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass
