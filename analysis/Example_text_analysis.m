% Colors requested by users over the last 24 hours for the Cheerlights
% Channel (1417) are read and the most requested color is identified. The
% most requested color is then written to another ThingSpeak channel.

% Channel 1417 contains the Cheerlights colors requested by users
% worldwide. This channel contains only one field.

% Channel ID to read the color from
readChannelID = 1417;

% Channel Read API Key 
% If your channel is private, then enter the read API
% Key between the '' below: 
readAPIKey = '';

% To store the most requested color, you need to write it to a channel
% other than the one you are reading data from.  Assign this channel ID to
% the 'writeChannelID' variable. Also assign the write API Key to the
% 'writeAPIKey' variable below. You can find the write API Key on the API Keys
% tab of your channel view.

% TODO - Replace the [] with channel ID to write data to:
writeChannelID = [];
% TODO - Enter the Write API Key between the '' below:
writeAPIKey = '';

% Read colors specified during the last 24 hours. Learn more about the THINGSPEAKREAD function by going to 
% MathWorks Documentation at www.mathworks.com/help. 
    
colors = thingSpeakRead(readChannelID, 'numDays', 1, 'outputFormat', 'table', 'ReadKey', readAPIKey);

% Convert the color strings to categorical data type
colors24hrs = categorical(colors.LastCheerLightsCommand);

% Partition and bin the colors in the dataset into a distribution corresponding to each color and how often it occurs
[counts, centers] = histcounts(colors24hrs);

% Find the color with the maximum number of counts
[maxCounts, maxCountIndx] = max(counts);

% Find the color that was mentioned the most
maxRequestColor = centers(maxCountIndx);

% Convert categorical type to string
maxRequestColor = char(maxRequestColor);

display(maxRequestColor, 'The most requested color over the last 24 hours');

display(['Note: To successfully write data to another channel, ',...
    'assign the write channel ID and API Key to ''writeChannelID'' and ',...
    '''writeAPIKey'' variables above. Also uncomment the line of code ',...
    'containing ''thingSpeakWrite'' (remove ''%'' sign at the beginning of the line.)'])

% Learn more about the THINGSPEAKWRITE function by going to the Documentation tab on
% the right side pane of this page.

% thingSpeakWrite(writeChannelID, {maxRequestColor}, 'WriteKey', writeAPIKey);
