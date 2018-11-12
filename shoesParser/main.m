
clc;
close all;
clear;

%% Extracting data
addpath(genpath(fullfile(pwd,'/dumpedData')));
bucket.pathToData =fullfile(pwd,'/dumpedData/dumper/ft');

%% Load shoes measurements YARP files 
shoes = struct;

% LEFT---------------------------------------------------------------------    
bucket.leftShoe_frontForce = fullfile(bucket.pathToData,'ftShoe_left_front/analog_o/data.log');
bucket.leftShoe_rearForce  = fullfile(bucket.pathToData,'ftShoe_left_rear/analog_o/data.log');
%bucket.leftShoe_totalForce = fullfile(bucket.pathToData,'ftShoe_left/analog_o/data.log');

% RIGHT--------------------------------------------------------------------
bucket.rightShoe_frontForce = fullfile(bucket.pathToData,'ftShoe_right_front/analog_o/data.log');
bucket.rightShoe_rearForce  = fullfile(bucket.pathToData,'ftShoe_right_rear/analog_o/data.log');
%bucket.rightShoe_totalForce = fullfile(bucket.pathToData,'ftShoe_right/analog_o/data.log');

%% Parse shoes measurements
% LEFT---------------------------------------------------------------------
% shoes.Left.frameRate  = 100; %100Hz
shoes.Left.front = parseYARPftShoes_fromDriver(bucket.leftShoe_frontForce);
shoes.Left.rear  = parseYARPftShoes_fromDriver(bucket.leftShoe_rearForce);
%shoes.Left.total = parseYARPftShoes_fromDriver(bucket.leftShoe_totalForce);

% RIGHT--------------------------------------------------------------------
% shoes.Right.frameRate  = 100; %100Hz
shoes.Right.front = parseYARPftShoes_fromDriver(bucket.rightShoe_frontForce);
shoes.Right.rear  = parseYARPftShoes_fromDriver(bucket.rightShoe_rearForce);
%shoes.Right.total = parseYARPftShoes_fromDriver(bucket.rightShoe_totalForce);
