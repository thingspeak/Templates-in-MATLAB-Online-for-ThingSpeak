% Template MATLAB code for visualizing data using the YYAXIS and PLOT functions.

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

%% Read Data %%

% Read first data variable
[data1, time1] = thingSpeakRead(readChannelID, 'Field', fieldID1, 'NumPoints', 30, 'ReadKey', readAPIKey);

% Read second data variable
[data2, time2] = thingSpeakRead(readChannelID, 'Field', fieldID2, 'NumPoints', 30, 'ReadKey', readAPIKey);

%% Visualize Data %%

yyaxis left;
plot(time1, data1)

yyaxis right;
plot(time2, data2);