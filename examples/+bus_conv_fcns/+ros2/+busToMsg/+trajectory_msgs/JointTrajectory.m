function rosmsgOut = JointTrajectory(slBusIn, rosmsgOut)
%#codegen
%   Copyright 2021 The MathWorks, Inc.
    rosmsgOut.header = bus_conv_fcns.ros2.busToMsg.std_msgs.Header(slBusIn.header,rosmsgOut.header(1));
    for iter=1:slBusIn.joint_names_SL_Info.CurrentLength
        rosmsgOut.joint_names{iter} = char(slBusIn.joint_names(iter).data).';
        maxlen = length(slBusIn.joint_names(iter).data);
        if slBusIn.joint_names(iter).data_SL_Info.CurrentLength < maxlen
        rosmsgOut.joint_names{iter}(slBusIn.joint_names(iter).data_SL_Info.CurrentLength+1:maxlen) = [];
        end
    end
    if slBusIn.joint_names_SL_Info.CurrentLength < numel(rosmsgOut.joint_names)
        rosmsgOut.joint_names(slBusIn.joint_names_SL_Info.CurrentLength+1:numel(rosmsgOut.joint_names)) = [];
    end
    rosmsgOut.joint_names = rosmsgOut.joint_names.';
    for iter=1:slBusIn.points_SL_Info.CurrentLength
        rosmsgOut.points(iter) = bus_conv_fcns.ros2.busToMsg.trajectory_msgs.JointTrajectoryPoint(slBusIn.points(iter),rosmsgOut.points(1));
    end
    if slBusIn.points_SL_Info.CurrentLength < numel(rosmsgOut.points)
    rosmsgOut.points(slBusIn.points_SL_Info.CurrentLength+1:numel(rosmsgOut.points)) = [];
    end
end
