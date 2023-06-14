% Read temperature and humidity from a ThingSpeak channel and visualize the 
% relationship between them using the SCATTER plot 

% Channel 12397 contains data from the MathWorks Weather Station, located 
% in Natick, Massachusetts. The data is collected once every minute. Field 
% 3 contains the humidity data and field 4 contains temperature data. 

% Channel ID to read data from 
readChannelID = 12397; 
% Temperature Field ID 
TemperatureFieldID = 4; 
% Humidity Field ID 
HumidityFieldID = 3; 

% Channel Read API Key   
% If your channel is private, then enter the read API 
% Key between the '' below:   
readAPIKey = ''; 

% Read Temperature and Humidity Data. Learn more about the THINGSPEAKREAD function by 
% going to MathWorks Documentation at https://www.mathworks.com/help. 

data = thingSpeakRead(readChannelID,'Fields',[TemperatureFieldID HumidityFieldID], ...
                                               'NumPoints',300, ...
                                               'ReadKey',readAPIKey); 

temperatureData = data(:,1);

% Read Humidity Data 
humidityData = data(:,2);

% Visualize the data
scatter(temperatureData,humidityData);
xlabel('Temperature');
ylabel('Humidity'); 
