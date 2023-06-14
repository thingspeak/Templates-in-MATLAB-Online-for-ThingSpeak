% Read wind speed data from a ThingSpeak channel and remove outliers, if 
% present. Write the cleaned data to another channel for storage. 
   
% Channel 12397 contains data from the MathWorks weather station, located 
% in Natick, Massachusetts. The data is collected once every minute. Field 
% 2 contains wind speed data. 
   
% Channel ID to read data from 
readChannelID = 12397; 
% Wind Speed Field ID 
windSpeedFieldID = 2; 
   
% Channel Read API Key   
% If your channel is private, then enter the read API Key between the '' below: 
readAPIKey = ''; 

% Read the last 6 hours of wind speed data from the MathWorks weather 
% station channel. Learn more about the THINGSPEAKREAD function by going to 
% MathWorks Documentation at www.mathworks.com/help. 
   
[windSpeed,timeStamp] = thingSpeakRead(readChannelID,'fields',windSpeedFieldID, ...
                                                     'NumMinutes',360, ...
                                                     'ReadKey',readAPIKey); 
   
% We will use the isoutlier function. With the default settings, this   
% calculates whether a value is more than three scaled median absolute 
% deviations away from the median. (See MATLAB documentation for the   
% isoutlier function for more details.) If any such points are found, we   
% will delete the point and the corresponding timestamp. 

% Check for outliers 
% Find the indices of elements which are outliers 
outlierDataIndex = isoutlier(windSpeed); 

% Find the indices of elements which are not outliers 
cleanDataIndex = ~outlierDataIndex;

% Select elements that are outliers 
outlierData = windSpeed(outlierDataIndex); 

% Select elements that are not outliers 
cleanData = windSpeed(cleanDataIndex); 
   

% Select timestamps corresponding to outlier data 
outlierTimeStamps = timeStamp(outlierDataIndex); 

% Select timestamps corresponding to clean data 
cleanTimeStamps = timeStamp(cleanDataIndex); 

% Create a table with outlier data and their respective timestamps 
outlierDataTable = timetable(outlierTimeStamps,outlierData); 

% Create a table with clean data and their respective timestamps 
cleanDataTable = timetable(cleanTimeStamps,cleanData); 

display(outlierDataTable,'Outlier data'); 

fprintf(['Note: To write data to another channel, assign the write channel ID \n',... 
    'and API Key to ''writeChannelID'' and  ''writeAPIKey'' variables. Also \n',...
    'uncomment the line of code containing ''thingSpeakWrite'' \n',... 
    '(remove ''%%'' sign at the beginning of the line.)']); 

% To store the cleaned temperature data, write it to a channel other than 
% the one used for reading data. To write to a channel, assign the write 
% channel ID to the 'writeChannelID' variable, and the write API Key to the 
% 'writeAPIKey' variable below. Find the write API Key on the API Keys tab 
% of your channel view. 
   
% Replace the [] with channel ID to write data to: 
writeChannelID = []; 

% Enter the Write API Key between the '' below: 
writeAPIKey = ''; 

% Learn more about the thingSpeakWrite function by going to the Documentation tab on 
% the right side pane of this page. 

%thingSpeakWrite(writeChannelID,cleanData,'timestamp',cleanTimeStamps,'Writekey',writeAPIKey); 
