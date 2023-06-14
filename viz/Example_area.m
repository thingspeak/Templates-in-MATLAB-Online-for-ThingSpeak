% Read traffic data for the past day from a ThingSpeak channel and 
% visualize hourly number of cars using the AREA function. 
   
% Channel 12397 contains data from the MathWorks Weather Station, located 
% in Natick, Massachusetts. The data is collected once every 15 seconds. 
% Field 1 records westbound and Field 2 is eastbound cars. 
   
% Channel ID to read data from 
readChannelID = 38629; 
   
% Channel Read API Key   
% If your channel is private, then enter the read API 
% Key between the '' below:   
readAPIKey = ''; 
   
% Read traffic data for the last 33 hours in a timetable, including 
% timestamps for each measurement 
carData = thingSpeakRead(readChannelID, 'Fields', [1 2], 'NumMinutes', 2000,...
                         'ReadKey', readAPIKey, 'Outputformat', 'Timetable');
   
% Compute the hourly average of the data 
aveCar = retime(carData, 'hourly', 'mean');
   
% Simplify the variables. Multiply by 240 to estimate the average number 
% of cars per hour from 15 second averages. 
eastCars = aveCar.DensityOfEastboundCars*240; 
westCars = aveCar.DensityOfWestboundCars*240; 
  
% Plot the averaged data as an area plot. 
area(aveCar.Timestamps,[eastCars, westCars]);
xlabel('Time');
ylabel('Average Cars per Hour');
legend({'East','West'});
