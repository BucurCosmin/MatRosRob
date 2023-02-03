function msg = assignNestedArrayMessages(blankMessage,u)
%#codegen

% To set datatype of MSG output:
%  1. Create buses for this model: robotics.ros.createSimulinkBus(gcs)
%  1. Click "Edit Data" in  Toolstrip to open "Ports and Data Manager"
%  2. Select MSG and set datatype to "Bus: SL_Bus_<modelname>_<messageType>"
% See: 
% http://www.mathworks.com/help/simulink/ug/create-structures-in-matlab-function-blocks.html

% blankMessage (geometry_msgs/PoseArray) consists of
%          Header: [1x1 Header]
%           Poses: variable-length array of geometry_msgs/Pose
%   Poses_SL_Info: struct with fields CurrentLength, ReceivedLength
%
% Poses is an array of "geometry_msgs/Pose", which consists of
%        Position: [1x1 Point]
%     Orientation: [1x1 Quaternion]
%
% Position is "geometry_msgs/Point", which consists of
%               X: 0
%               Y: 0
%               Z: 0
%
% Orientation is "geometry_msgs/Quaternion", which consists of
%               X: 0
%               Y: 0
%               Z: 0
%               W: 0

% Set the Poses array to have size 2, and modify the first two Pose
% elements

blankMessage.points_SL_Info.CurrentLength = uint32(1);
blankMessage.points(1).positions_SL_Info.CurrentLength=uint32(6);
blankMessage.points(1).positions(1) = u(1);
blankMessage.points(1).positions(2) = u(2);
blankMessage.points(1).positions(3) = u(3);
blankMessage.points(1).positions(4) = u(4);
blankMessage.points(1).positions(5) = u(5);
blankMessage.points(1).positions(6) = u(6);

%blankMessage.layout.Dim(1).Size = uint32(size(u,1));
%blankMessage.layout.Dim(2).Size = uint32(size(u,2));
%blankMessage.layout.Dim(1).Stride = uint32(prod(size(u)));
%blankMessage.layout.Dim(2).Stride = uint32(prod(size(u,2)));

msg = blankMessage;
