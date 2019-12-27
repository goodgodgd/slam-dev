roslaunch vins vins_rviz.launch &
rosrun vins kitti_odom_test \
    /work/catkin_ws/src/VINS-Fusion/config/kitti_odom/kitti_config00-02.yaml \
    /work/dataset/kitti_odometry/sequences/01

