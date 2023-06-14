% Read temperature and wind speed data from a ThingSpeak channel and 
% visualize the data on the same plot with different Y-Axes using the 
% YYAXIS and PLOT functions 

% Channel 12397 contains data from the MathWorks Weather Station, located 
% in Natick, Massachusetts. The data is collected once every minute. Field 
% 4 contains the temperature data and field 2 contains wind speed data. 

% Channel ID to read data from 
readChannelID = 12397; 
% Temperature Field ID 
TemperatureFieldID = 4; 
% Wind speed Field ID 
windSpeedFieldID = 2; 

% Channel Read API Key   
% If your channel is private, then enter the read API 
% Key between the '' below:   
readAPIKey = ''; 

% Read Data. Learn more about the thingSpeakRead function by 
% going to MathWorks Documentation at https://www.mathworks.com/help. 
[data, timeStamps] = thingSpeakRead(readChannelID, 'Fields',[TemperatureFieldID windSpeedFieldID], ...
                                                           'NumPoints', 300, ...
                                                           'ReadKey', readAPIKey);

% Extract the temperature data from the first column
temperatureData = data(:, 1);
% Extract the windspeed data from the second column
windSpeedData = data(:, 2);

% Visualize Data
yyaxis left
plot(timeStamps, temperatureData);
ylabel('Temperature');

yyaxis right
plot(timeStamps, windSpeedData);
ylabel('Wind Speed');
