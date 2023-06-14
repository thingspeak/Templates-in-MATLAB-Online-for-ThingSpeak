% Weather data with missing values is read from a ThingSpeak channel. The
% data is cleaned of missing values using the listwise deletion algorithm
% and written to another ThingSpeak channel.

% Channel 12397 contains data from the MathWorks Weather Station, located
% in Natick, Massachusetts. The data is collected once every minute.

% Channel ID to read data from
readChannelID = 12397;

% Channel Read API Key 
% If your channel is private, then enter the read API
% Key between the '' below: 
readAPIKey = '';

% To store the cleaned weather data, write it to a channel other than
% the one used for reading data. To write to a channel, assign the write
% channel ID to the 'writeChannelID' variable, and the write API Key to the
% 'writeAPIKey' variable below. Find the write API Key on the API Keys tab
% of your channel view.

% TODO - Replace the [] with channel ID to write data to:
writeChannelID = [];
% TODO - Enter the Write API Key between the '' below:
writeAPIKey = '';

% Read the last 10 weather data points from MathWorks Weather Station
% channel. Learn more about the THINGSPEAKREAD function by going to 
% MathWorks Documentation at www.mathworks.com/help. 

[weatherData, timeStamp] = thingSpeakRead(readChannelID, 'numPoints', 10, 'ReadKey', readAPIKey);

% Check for missing values - Missing values are represented with NaN values.
% We use the ISNAN function to find NaN values in the returned array. To
% quickly identify if NaN values are present in the data we sum the result
% of ISNAN function.

anyMissingValues = sum(isnan(weatherData));

% If there are missing values then anyMissingValues is greater than 0
if sum(anyMissingValues) > 0

    % Find the indices of rows with missing value
    missingValueIndex = find(~sum(isnan(weatherData),2));

    % Select only the rows that do not have any missingValues
    cleanWeatherData = weatherData(missingValueIndex, :);

    % Select only the appropriate timestamps. An entire row / entry
    % will be removed from analysis if any single value is missing
    cleanTimeStamps = timeStamp(missingValueIndex);
    
else
    % If no missing values are found, then the data read from the
    % MathWorks Weather Station is directly used
    cleanWeatherData = weatherData;
    cleanTimeStamps = timeStamp;
end

display(cleanWeatherData, 'Cleaned data');

% Write the maximum temperature to another channel specified by the
% 'writeChannelID' variable

display(['Note: To successfully write data to another channel, ',...
    'assign the write channel ID and API Key to ''writeChannelID'' and ',...
    '''writeAPIKey'' variables above. Also uncomment the line of code ',...
    'containing ''thingSpeakWrite'' (remove ''%'' sign at the beginning of the line.)'])

% Learn more about the THINGSPEAKWRITE function by going to the Documentation tab on
% the right side pane of this page.

% thingSpeakWrite(writeChannelID, cleanWeatherData, 'Timestamp', cleanTimeStamps, 'WriteKey', writeAPIKey);
