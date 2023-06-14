% Read temperature for the last 10 hours from a ThingSpeak channel and 
% visualize temperature variations using the MATLAB HISTOGRAM function. 
   
% Channel 12397 contains data from the MathWorks Weather Station, located 
% in Natick, Massachusetts. The data is collected once every minute. Field 
% 4 contains temperature data. 
% Channel ID to read data from 
readChannelID = 12397; 
   
% Temperature Field ID 
TemperatureFieldID = 4; 
   
% Channel Read API Key   
% If your channel is private, then enter the read API 
% Key between the '' below:   
readAPIKey = ''; 

% Get temperature data from field 4 for the last 10 hours = 10 x 60 
% minutes. Learn more about the THINGSPEAKREAD function by going to 
% MathWorks Documentation at https://www.mathworks.com/help. 
   
tempF = thingSpeakRead(readChannelID,'Fields',TemperatureFieldID,...
'NumMinutes',10*60, 'ReadKey',readAPIKey); 
   
histogram(tempF); 
xlabel('Temperature (F)'); 
ylabel('Number of Measurements\newline for Each Temperature'); 
title('Histogram of Temperature Variation');
