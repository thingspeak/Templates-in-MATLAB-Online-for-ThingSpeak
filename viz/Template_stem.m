% Template MATLAB code for visualizing data using the STEM
% function.

% Prior to running this MATLAB code template, assign the channel variables.
% Set 'readChannelID' to the channel ID of the channel to read from. 
% Also, assign the read field ID to 'fieldID1'. 

% TODO - Replace the [] with channel ID to read data from:
readChannelID = [];
% TODO - Replace the [] with the Field ID to read data from:
fieldID = [];

% Channel Read API Key 
% If your channel is private, then enter the read API
% Key between the '' below: 
readAPIKey = '';

%% Read Data %%

[data, time] = thingSpeakRead(readChannelID, 'Field', fieldID, 'NumPoints', 30, 'ReadKey', readAPIKey);

%% Visualize Data %%

stem(time, data);