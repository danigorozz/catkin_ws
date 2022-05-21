#include "ros/ros.h"
#include "sensor_msgs/Image.h"
#include "sensor_msgs/CameraInfo.h"
#include "sensor_msgs/LaserScan.h"

class CamInfo{
    
public:
    
    CamInfo();
    
    void callback(const sensor_msgs::Image::ConstPtr & msg);
    void callback2(const sensor_msgs::LaserScan::ConstPtr & msg);
    
private:
    
    ros::NodeHandle nh;
    ros::Publisher pub;
    ros::Subscriber sub;
    ros::Subscriber sub2;
    
    
};
