ORBSLAM2 수정사항
add `#include <unistd.h>` to `System.h`
find `MatrixXd::Flags & AlignedBit ? Aligned : Unaligned` in Thirdparty/g2o/g2o/core/base_binary_edge.h
`Matrix<double,D,D>::Flags & AlignedBit ? Aligned : Unaligned` in Thirdparty/g2o/g2o/core/base_multi_edge.h
`Matrix<double, Di, Dj>::Flags & AlignedBit ? Aligned : Unaligned` in Thirdparty/g2o/g2o/core/base_vertex.h
to replace them with `Aligned16`
https://github.com/goodgodgd/ORB_SLAM2/commit/43effa6e73c5ca205e00ff4156ee2c7b6dee33c4?diff=unified#diff-5482b92a742d4f2d9121942a23debc89L56

