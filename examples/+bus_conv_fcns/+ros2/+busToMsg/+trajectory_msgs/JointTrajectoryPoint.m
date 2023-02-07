function rosmsgOut = JointTrajectoryPoint(slBusIn, rosmsgOut)
%#codegen
%   Copyright 2021 The MathWorks, Inc.
    rosmsgOut.positions = double(slBusIn.positions(1:slBusIn.positions_SL_Info.CurrentLength));
    rosmsgOut.velocities = double(slBusIn.velocities(1:slBusIn.velocities_SL_Info.CurrentLength));
    rosmsgOut.accelerations = double(slBusIn.accelerations(1:slBusIn.accelerations_SL_Info.CurrentLength));
    rosmsgOut.effort = double(slBusIn.effort(1:slBusIn.effort_SL_Info.CurrentLength));
    rosmsgOut.time_from_start = bus_conv_fcns.ros2.busToMsg.builtin_interfaces.Duration(slBusIn.time_from_start,rosmsgOut.time_from_start(1));
end
