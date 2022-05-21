#include <ros/ros.h>

#include <sensor_msgs/Image.h>
#include <sensor_msgs/PointCloud2.h>
#include <geometry_msgs/Pose.h>
#include <darknet_ros_msgs/BoundingBoxes.h>
#include <darknet_ros_msgs/BoundingBox.h>
#include <visualization_msgs/Marker.h>

#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>

#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>

#include "NumCpp.hpp"

using namespace sensor_msgs;
using namespace darknet_ros_msgs;

class GetObjects{
    
public:
    
    GetObjects();
    
    void cb_bboxes(const BoundingBoxes::ConstPtr& msg);
    void cb_points(const sensor_msgs::PointCloud2ConstPtr & msg);
    void find_object(const nc::NdArray<double> & pt_x, const nc::NdArray<double> & pt_y, const nc::NdArray<double> & pt_z, const BoundingBox & bbox);
    
    void publish_marker(const double & pos_x, const double & pos_y, const double & pos_z, std::string Class);
    
    
private:
    
    ros::NodeHandle nh;
    ros::Subscriber sub_bboxes;
    ros::Subscriber sub_points;
    ros::Publisher pub_marker;
    
    //pcl::PointCloud<pcl::PointXYZ> points2_;
    
    nc::NdArray<double> pt_x;
    nc::NdArray<double> pt_y;
    nc::NdArray<double> pt_z;
    
    int id_;
    
};
