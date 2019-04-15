function [fail_count, fail_log] = integrated_test()
    file = {'ax18_kinematic_control',...
            'comau_kinematic_control',...
            'wam_kinematic_control',...
            'kuka_kinematic_control', ...
            'holonomic_base_control',...
            'cdts_broom_kuka',...
            'cdts_bucket_kuka',...
            'example_damped_numerical_filtered_controller',...
            'draw_lines_planes_using_dual_quaternions',...
            'example_dq_kinematic_control',...
            'matlab_general_operations',...
            'pose_jacobian_time_derivative',...
            'example_little_john(''novisual'')',...
            'robot_serialization(''novisual'')',...
            'whole_body_control_example(''novisual'')',...
            'two_legs_kinematic_control',...
            'kuka_line_control'
            };

    fail_log = sprintf('This is the list of failed tests: ');
    fail_count = 0;
    for i = 1:length(file)        
        try
            close all;
            fprintf('\n%d of %d: Executing %s', i, length(file), file{i});
            eval(file{i});
        catch
           % clc;
            fail_log = [fail_log, file{i}, ', '];
            fprintf('\n');
            warning('Could not execute file %s', file{i});
            fail_count = fail_count + 1; 
        end
    end
  %  clc;
    fprintf('\nNumber of fails: %d', fail_count);
    fprintf('\n%s', fail_log);
end