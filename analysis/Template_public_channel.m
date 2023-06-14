% Template MATLAB code for reading data from a public channel, analyzing
% the data and storing the analyzed data in another channel.

% Prior to running this MATLAB code template, assign the channel variables.
% Set 'readChannelID' to the channel ID of the channel to read from. 

% To store the analyzed data, you will need to write it to a channel other
% than the one you are reading data from. Assign this channel ID to the
% 'writeChannelID' variable. Also assign the write API Key to the
% 'writeAPIKey' variable below. You can find the write API Key on the API Keys tab
% of your channel view.

% TODO - Replace the [] with channel ID to read data from:
readChannelID = [];

% TODO - Replace the [] with channel ID to write data to:
writeChannelID = [];
% TODO - Enter the Write API Key between the '' below:
writeAPIKey = '';

%% Read Data %%
[data, time] = thingSpeakRead(readChannelID);


%% Analyze Data %%
% Add code in this section to analyze data and store the result in the
% 'analyzedData' variable.
analyzedData = data;

%% Write Data %%
thingSpeakWrite(writeChannelID, analyzedData, 'WriteKey', writeAPIKey);
