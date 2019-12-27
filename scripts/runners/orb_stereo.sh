SEQUENCE_NUMBER=01
KITTI_CONFIG=KITTI00-02.yaml
ORB_ROOT=/work/ORB_SLAM2

$ORB_ROOT/Examples/Stereo/stereo_kitti \
    $ORB_ROOT/Vocabulary/ORBvoc.txt \
    $ORB_ROOT/Examples/Stereo/$KITTI_CONFIG \
    /work/dataset1/kitti_odometry/sequences/$SEQUENCE_NUMBER

