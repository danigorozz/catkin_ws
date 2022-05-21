#include "rgbd_filter/get_objects.hpp"

int main(int argc, char** argv){
    
    ros::init(argc, argv, "get_objects");
    
    GetObjects get_objects;
    
    ros::Rate sleep_rate(3);
    
    while(true){
        
        ros::spinOnce();
        
        sleep_rate.sleep();
        
    }
    
}
