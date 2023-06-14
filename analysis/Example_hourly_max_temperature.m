% Read temperature data from a ThingSpeak channel over the past 24 hours 
% to calculate the high and low temperatures and write to another channel. 
   
% Channel 12397 contains data from the MathWorks Weather Station, located 
% in Natick, Massachusetts. The data is collected once every minute. Field 
% 4 contains temperature data. 
   
% Channel ID to read data from 
readChannelID = 12397; 
% Temperature Field ID 
TemperatureFieldID = 4; 
   
% Channel Read API Key   
% If your channel is private, then enter the read API Key between the '' below: 
readAPIKey = ''; 
   
% Read temperature data for the last 24 hours from the MathWorks weather 
% station channel. Learn more about the thingSpeakRead function by going to 
% ThingSpeak documentation. 
   
[tempF,timeStamp] = thingSpeakRead(readChannelID,'Fields',TemperatureFieldID, ...
                                                'numDays',1,'ReadKey',readAPIKey); 
   
% Calculate the maximum and minimum temperatures 
[maxTempF,maxTempIndex] = max(tempF); 
[minTempF,minTempIndex] = min(tempF); 
   
% Select the timestamps at which the maximum and minimum temperatures were measured
timeMaxTemp = timeStamp(maxTempIndex); 
timeMinTemp = timeStamp(minTempIndex); 
   
display(maxTempF,'Maximum Temperature for the past 24 hours is'); 
display(minTempF,'Minimum Temperature for the past 24 hours is'); 
   
fprintf(['Note: To write data to another channel, assign the write channel ID \n',... 
    'andAPI Key to ''writeChannelID'' and  ''writeAPIKey'' variables. Also \n',... 
    'uncomment the line of code containing ''thingSpeakWrite'' \n',... 
    '(remove ''%%'' sign at the beginning of the line.)']); 
   
% To store the maximum temperature, write it to a channel other than 
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

%thingSpeakWrite(writeChannelID,maxTempF,'timestamp',timeMaxTemp,'WriteKey',writeAPIKey);
