% Read wind speed and direction from a ThingSpeak channel and visualize 
% wind velocity using the MATLAB COMPASS plot function. 
   
% Channel 12397 contains data from the MathWorks Weather Station, located 
% in Natick, Massachusetts. The data is collected once every minute. Field 
% 1 contains wind direction data and field 2 contains wind speed data. 
   
% Channel ID to read data from 
readChannelID = 12397; 
% Wind Direction Field ID 
WindDirFieldID = 1; 
% Wind Speed Field ID 
WindSpeedFieldID = 2; 
   
% Channel Read API Key   
% If your channel is private, then enter the read API 
% Key between the '' below:   
readAPIKey = ''; 
   
% Fetch wind direction for the last 60 points from the MathWorks weather 
% station. Learn more about the THINGSPEAKREAD function by going to 
% MathWorks Documentation www.mathworks.com/help. 
windDir = thingSpeakRead(readChannelID,'Fields',WindDirFieldID,'NumPoints',60,...
'ReadKey',readAPIKey); 
   
% Fetch wind speed for the last 60 points from the MathWorks weather station 
windSpeed = thingSpeakRead(readChannelID,'Fields',WindSpeedFieldID,...
'NumPoints',60,'ReadKey',readAPIKey); 
   
% Convert to radians 
rad = windDir*2*pi/360; 
   
% Add 90 counter clockwise rotation to align the compass with true North 
rad = rad+pi/2; 
   
% Calculate the x component 
u = cos(rad) .* windSpeed;   
   
% Calculate the y component 
v = sin(rad) .* windSpeed;   
   
% Generate a compass plot 
compass(u,v);
