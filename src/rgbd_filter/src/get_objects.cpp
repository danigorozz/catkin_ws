#include "rgbd_filter/get_objects.hpp"

using namespace sensor_msgs;
using namespace darknet_ros_msgs;

//typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;

GetObjects::GetObjects(){
    
    sub_bboxes = nh.subscribe("/darknet_ros/bounding_boxes", 1, &GetObjects::cb_bboxes, this);
    sub_points = nh.subscribe("/point_cloud/points", 1, &GetObjects::cb_points, this);
    
    pub_marker = nh.advertise<visualization_msgs::Marker>("/visualization_marker", 1000);
    
    id_ = 0;
    
    // Inicializamos los arrays que tendrán el valor de las coordenadas X, Y y Z
    pt_x = {};
    pt_y = {};
    pt_z = {};
}


void GetObjects::cb_bboxes(const BoundingBoxes::ConstPtr& msg){
    
    std::vector<BoundingBox> v = msg->bounding_boxes;
    int n = v.size();
    
    ROS_INFO("Ha entrado en cb_bboxes");
    
    //for(int i=0; i<=n; i++){
        
    //    const BoundingBox bbox_ = msg->bounding_boxes[i];
    //    GetObjects::find_object(points2_, bbox_, i);
        
    //}
    const BoundingBox bbox_ = msg->bounding_boxes[0];
    GetObjects::find_object(pt_x, pt_y, pt_z, bbox_);
    
    
}

void GetObjects::find_object(const nc::NdArray<double> & pt_x, const nc::NdArray<double> & pt_y, const nc::NdArray<double> & pt_z, const BoundingBox & bbox){
    
    ROS_INFO("Ha entrado en find_object");
    
    // Variables que definen la bounding box
    const int xmin = bbox.xmin;
    const int xmax = bbox.xmax;
    const int ymin = bbox.ymin;
    const int ymax = bbox.ymax;
    const std::string Class = bbox.Class;
    
    // Cortamos la matriz para que sola coja los puntos que pertenecen al bounding box
    const nc::NdArray<double> aux_pt_x = pt_x({ymin, ymax}, {xmin, xmin});
    const nc::NdArray<double> aux_pt_y = pt_y({ymin, ymax}, {xmin, xmin});
    const nc::NdArray<double> aux_pt_z = pt_z({ymin, ymax}, {xmin, xmin});
    
    // Obtenemos la media de los valores en cada eje (en forma de array)
    const nc::NdArray<double> x_mean_v = nc::mean(aux_pt_x);
    const nc::NdArray<double> y_mean_v = nc::mean(aux_pt_y);
    const nc::NdArray<double> z_mean_v = nc::mean(aux_pt_z);
    
    // Obtenemos el valor de la media (en forma de una constante doble)
    const double x_mean = x_mean_v[0];
    const double y_mean = y_mean_v[0];
    const double z_mean = z_mean_v[0];
    
    GetObjects::publish_marker(x_mean, y_mean, z_mean, Class);
    
}


void GetObjects::publish_marker(const double & pos_x, const double & pos_y, const double & pos_z, std::string Class){
    // Lo útlimo que me queda, si todo sale bien. Sería generar el mensaje de visualization_marker y enviarlo por el publisher.
    ROS_INFO("Ha entrado en publish_marker");
    visualization_msgs::Marker marker;
    id_++;
    marker.header.frame_id = "base_link";
    marker.header.stamp = ros::Time();
    marker.ns = "objects";
    marker.id = id_;
    marker.type = visualization_msgs::Marker::SPHERE;
    marker.action = visualization_msgs::Marker::ADD;
    marker.pose.position.x = pos_x;
    marker.pose.position.y = pos_y;
    marker.pose.position.z = pos_z;
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;
    marker.scale.x = 0.1;
    marker.scale.y = 0.1;
    marker.scale.z = 0.1;
    marker.color.a = 1.0;
    marker.color.r = 0.0;
    marker.color.g = 1.0;
    marker.color.b = 0.0;
    
    pub_marker.publish(marker);
    
    
}

void GetObjects::cb_points(const sensor_msgs::PointCloud2ConstPtr & msg){
    ROS_INFO("Ha entrado en cb_points");
    pcl::PCLPointCloud2 pcl_pc2;
    pcl_conversions::toPCL(*msg, pcl_pc2);
    pcl::PointCloud<pcl::PointXYZ>::Ptr temp_cloud(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::fromPCLPointCloud2(pcl_pc2,*temp_cloud);
    
    // Obtenemos el numero de filas y columnas de la pointcloud, así como la longitud total.
    const int nf = 480;
    const int nc = 640;
    const int l = nf*nc;
    ROS_INFO("Hecho1");
    nc::NdArray<double> aux_pt_x;
    nc::NdArray<double> aux_pt_y;
    nc::NdArray<double> aux_pt_z;
    ROS_INFO("Hecho2. Punto: %f", temp_cloud->points[0].x);
    // Obtenemos los valores de las coordenadas y lo introducimos en sus matrices correspondientes
    for(int i=0; i<l; i++){
        aux_pt_x[i] = temp_cloud->points[i].x;
        aux_pt_y[i] = temp_cloud->points[i].y;
        aux_pt_z[i] = temp_cloud->points[i].z;
    }
    ROS_INFO("Hecho3");
    // Cambiamos la forma de un vector a una matriz
    pt_x = aux_pt_x.reshape(nf, nc);
    pt_y = aux_pt_y.reshape(nf, nc);
    pt_z = aux_pt_z.reshape(nf, nc);
    ROS_INFO("Hecho4");
}























