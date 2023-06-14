% Read temperature data from a ThingSpeak channel for three seperate days 
% and visualize the data in a single plot using the PLOT function. 

% Channel 12397 contains data from the MathWorks Weather Station, located 
% in Natick, Massachusetts. The data is collected once every minute. 
% Field 4 contains temperature data. 

% Channel ID to read data from 
readChannelID = 12397; 
% Temperature Field ID 
myFieldID = 4; 
% One day date range
oneDay = [datetime('yesterday') datetime('today')];

% Channel Read API Key 
% If your channel is private, then enter the read API key between the '' below: 
readAPIKey = ''; 

% Read Temperature Data. Learn more about the THINGSPEAKREAD function by 
% going to MathWorks Documentation at www.mathworks.com/help. 
temperatureDay1 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                 'dateRange', oneDay, 'ReadKey',readAPIKey); 
temperatureDay2 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                 'dateRange',oneDay-days(1),'ReadKey',readAPIKey); 
temperatureDay3 = thingSpeakRead(readChannelID,'Fields',myFieldID, ...
                                'dateRange', oneDay-days(2),'ReadKey',readAPIKey); 

% Create array of durations 
myTimes1 = minutes(1:length(temperatureDay1));
myTimes2 = minutes(1:length(temperatureDay2));
myTimes3 = minutes(1:length(temperatureDay3));

% Visualize the data
plot(myTimes1,temperatureDay1, myTimes2,temperatureDay2, myTimes3, temperatureDay3);
legend({'Day1','Day2','Day3'});
xlabel('Minutes');
ylabel('Temperature F');
title('3-Day Temperature Comparison');
