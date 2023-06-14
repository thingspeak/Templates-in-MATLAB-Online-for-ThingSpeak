% Read temperature and wind speed data from a public ThingSpeak channel to   
% calculate wind chill and write it to another ThingSpeak channel. Note that   
% wind chill calculations are only valid at temperatures less than 50 degrees   
% Fahrenheit and wind speeds greater than 3 mph. 
% Learn more about wind chill at http://www.nws.noaa.gov/om/cold/wind_chill.shtml 
   
% Channel ID to read data from 
readChID = 12397; 
   
% Obtain the channel ID and write API key for your channel 
% Replace [] with your channel ID 
writeChID = []; 
% Enter your Write API Key between the '' 
writeAPIKey = ''; 
   
% Read air temperature, time stamps, and wind speed from weather station 
[temp,time] = thingSpeakRead(readChID,'Fields',4); 
windSpeed = thingSpeakRead(readChID,'Fields',2); 
   
% Calculate and display wind chill from weather station data 
windChill = 35.74 + (0.6215*temp) - (35.75*windSpeed^0.16) + (0.4275*temp*windSpeed^0.16); 
display(windChill,'Wind Chill'); 

% Plot air temperature, wind speed, and wind chill to your channel 
thingSpeakWrite(writeChID,[temp,windSpeed,windChill],'Fields',[1,2,3],... 
'TimeStamps',time,'WriteKey',writeAPIKey);