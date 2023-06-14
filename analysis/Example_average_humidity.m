% Read humidity over the past hour from a ThingSpeak channel and write 
% the average to another ThingSpeak channel. 

% Channel 12397 contains data from the MathWorks weather station, located 
% in Natick, Massachusetts. The data is collected once every minute. Field 
% 3 contains humidity data. 

% Channel ID to read data from 
readChannelID = 12397; 
% Humidity Field ID 
humidityFieldID = 3; 

% Channel Read API Key 
% If your channel is private, then enter the read API Key between the '' below: 
readAPIKey = ''; 

% Get humidity data for the last 60 minutes from the MathWorks weather 
% station channel. Learn more about the THINGSPEAKREAD function by going to 
% MathWorks Documentation at www.mathworks.com/help. 

humidity = thingSpeakRead(readChannelID,'Fields',humidityFieldID,'NumMinutes',60,'ReadKey',readAPIKey); 

% Calculate the average humidity 
avgHumidity = mean(humidity); 
display(avgHumidity,'Average Humidity'); 

fprintf(['Note: To write data to another channel, assign the write channel ID \n',... 
    'and API Key to ''writeChannelID'' and  ''writeAPIKey'' variables. Also \n',...
    'uncomment the line of code containing ''thingSpeakWrite'' \n',... 
    '(remove ''%%'' sign at the beginning of the line.)']); 
     
% To store the calculated average humidity, write it to a channel other 
% than the one used for reading data. To write to a channel, assign the 
% write channel ID to the 'writeChannelID' variable, and the write API Key 
% to the 'writeAPIKey' variable below. Find the write API Key on the API Keys  
% tab of your channel view. 

% Replace the [] with channel ID to write data to: 
writeChannelID = []; 
% Enter the Write API Key between the '' below: 
writeAPIKey = ''; 

% Learn more about the THINGSPEAKWRITE function by going to the Documentation tab on 
% the right side pane of this page. 

% thingSpeakWrite(writeChannelID,avgHumidity,'WriteKey',writeAPIKey);
