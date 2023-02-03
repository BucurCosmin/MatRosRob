function msg = stringArrayAssign(blankMsg)
% stringArrayAssign - Assign a string array in a ROS message
%
%  blankMsg (input): A bus for a 'sensor_msgs/JointState' message. This is 
%      used to initialize the output.
%  msg (output): A bus for a 'sensor_msgs/JointState' message message, with 
%      Name field set to a string array.
%
%   Copyright 2015 The MathWorks, Inc.

%#codegen

% Note: The datatype of 'msg' has been explicitly set to the appropriate 
% Simulink bus type ("SL_Bus_robotROSMessageUsageExample_sensor_msgs_JointState"). 
%
% If the model name is changed, the datatype needs to be changed as well:
%   1) Click "Edit Data" in the Editor toolstrip to open "Ports and Data Manager"
%   2) Select "msg". From the "Type" dropdown, select "--- Refresh data types ---"
%   3) Set datatype to "Bus: SL_Bus_<modelname>_sensor_msgs_JointState"

strArrayToAssign = {'shoulder_pan_joint'; 'shoulder_lift_joint'; 'elbow_joint'; 'wrist_1_joint';'wrist_2_joint';'wrist_3_joint'};
msg = blankMsg;

% Set the number of strings in the string array.
% msg (sensor_msgs/JointState) includes the following fields
%           Name : array of std_msgs/String (string array)
%   Name_SL_Info : struct with fields CurrentLength, ReceivedLength
numStringsInArray = length(strArrayToAssign);
msg.joint_names_SL_Info.CurrentLength = uint32(numStringsInArray);

% Set the individual strings in the array
for idx=1:numStringsInArray
    str = strArrayToAssign{idx};
    strLength = length(str);
    msg.joint_names(idx).data(1:strLength) = uint8(str);
    msg.joint_names(idx).data_SL_Info.CurrentLength = uint32(strLength);
end