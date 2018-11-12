clc;
clear;
close all;

addpath(genpath('shoesParser'));

optTotalWrench = true;
bucket.inSituOpt = 'TRUE';

%% path to the dataset
%% Modify the variables depending on your settings
bucket.taskName = 'loaded'; %%This is the name of the task
bucket.dataset = '~/Dataset'; %%This is the location of the dataset


%% Extracting data
addpath(genpath(fullfile(bucket.dataset)));
bucket.pathToTask = fullfile(bucket.dataset,bucket.taskName);
bucket.pathToTaskData = fullfile(bucket.pathToTask,'/ft');
mkdir(bucket.pathToTask,'parsed');
bucket.pathToParsedTaskData = fullfile(bucket.pathToTask,'/parsed');

%% Load shoes measurements YARP files
% LEFT---------------------------------------------------------------------
bucket.leftShoe_frontForce = fullfile(bucket.pathToTaskData,'ftShoe_left_front/analog_o/data.log');
bucket.leftShoe_rearForce  = fullfile(bucket.pathToTaskData,'ftShoe_left_rear/analog_o/data.log');
if optTotalWrench
    bucket.leftShoe_totalForce = fullfile(bucket.pathToTaskData,'ftShoe_left/analog_o/data.log');
end

% RIGHT--------------------------------------------------------------------
bucket.rightShoe_frontForce = fullfile(bucket.pathToTaskData,'ftShoe_right_front/analog_o/data.log');
bucket.rightShoe_rearForce  = fullfile(bucket.pathToTaskData,'ftShoe_right_rear/analog_o/data.log');
if optTotalWrench
    bucket.rightShoe_totalForce = fullfile(bucket.pathToTaskData,'ftShoe_right/analog_o/data.log');
end

disp('-------------------------------------------------------------------');
disp(strcat('[Start] Parsing ftshoes task'," ",bucket.taskName));

%% Parse shoes measurements
shoes = struct;
% LEFT---------------------------------------------------------------------
% shoes.Left.frameRate  = 100; %100Hz
shoes.Left.front = parseYARPftShoes_fromDriver(bucket.leftShoe_frontForce);
shoes.Left.rear  = parseYARPftShoes_fromDriver(bucket.leftShoe_rearForce);
if optTotalWrench
    shoes.Left.total = parseYARPftShoes_fromDriver(bucket.leftShoe_totalForce);
end
% RIGHT--------------------------------------------------------------------
% shoes.Right.frameRate  = 100; %100Hz
shoes.Right.front = parseYARPftShoes_fromDriver(bucket.rightShoe_frontForce);
shoes.Right.rear  = parseYARPftShoes_fromDriver(bucket.rightShoe_rearForce);
if optTotalWrench
    shoes.Right.total = parseYARPftShoes_fromDriver(bucket.rightShoe_totalForce);
end

save(fullfile(bucket.pathToParsedTaskData,'shoes.mat'),'shoes');
disp('[End]');
ftShoesDataPlotter(bucket)