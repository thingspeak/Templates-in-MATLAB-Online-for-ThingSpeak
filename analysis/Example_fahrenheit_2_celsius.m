% Read the latest temperature in Fahrenheit from a ThingSpeak channel 
% and convert it to Celsius. Write the resulting temperature value to 
% another ThingSpeak channel. 

% Channel 12397 contains data from the MathWorks weather station, located 
% in Natick, Massachusetts. The data is collected once every minute. Field 
% 4 contains temperature data. 

% Channel ID to read data from 
readChannelID = 12397; 
% Temperature Field ID 
temperatureFieldID = 4; 

% Channel Read API Key 
% If your channel is private, then enter the read API 
% Key between the '' below: 
readAPIKey = ''; 

% Read the latest temperature data from the MathWorks Weather Station. 
% Learn more about the THINGSPEAKREAD function by going to 
% MathWorks Documentation at www.mathworks.com/help. 

tempF = thingSpeakRead(readChannelID,'Fields',temperatureFieldID,'ReadKey',readAPIKey); 

% Convert to Celsius 
tempC = (5/9)*(tempF-32); 
display(tempC,'Temperature in Celsius'); 

fprintf(['Note: To write data to another channel, assign the write channel ID \n',... 
    'and API Key to ''writeChannelID'' and  ''writeAPIKey'' variables. Also \n',...
    'uncomment the line of code containing ''thingSpeakWrite'' \n',... 
    '(remove ''%%'' sign at the beginning of the line.)']); 

% To store the temperature in Celsius, write it to a channel other than 
% the one used for reading data. To write to a channel, assign the write 
% channel ID to the 'writeChannelID' variable, and the write API Key to the 
% 'writeAPIKey' variable below. Find the write API Key on the API Keys tab
% of your channel view. 

% Replace the [] with channel ID to write data to: 
writeChannelID = []; 
% Enter the Write API Key between the '' below: 
writeAPIKey = ''; 
     
% Learn more about the THINGSPEAKWRITE function by going to the Documentation tab on 
% the right side pane of this page. 

% thingSpeakWrite(writeChannelID,[tempF,tempC],'WriteKey',writeAPIKey); 
