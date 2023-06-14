% MATLAB code for visualizing data from a channel as a filled area
% 2D plot using the AREA function.

% Prior to running this MATLAB code template, assign the channel variables.
% Set 'readChannelID' to the channel ID of the channel to read from. 
% Also, assign the read field IDs to the variables 'fieldID1', and 'fieldID2'. 

% TODO - Replace the [] with channel ID to read data from:
readChannelID = [];
% TODO - Replace the [] with the Field ID to read data from:
fieldID1 = [];
% TODO - Replace the [] with the Field ID to read data from:
fieldID2 = [];

% Channel Read API Key 
% If your channel is private, then enter the read API
% Key between the '' below: 
readAPIKey = '';

%% Read Data

% Read first data variable
data1 = thingSpeakRead(readChannelID, 'Field', fieldID1, 'NumPoints', 30, 'ReadKey', readAPIKey);

% Read second data variable
data2 = thingSpeakRead(readChannelID, 'Field', fieldID2, 'NumPoints', 30, 'ReadKey', readAPIKey);

%% Process Data

% Concatenate the two data variables
data = [data1, data2];

%% Visualize Data

area(data);