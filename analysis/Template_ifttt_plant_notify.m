% Read the soil moisture channel data from the past two weeks.
% Send an email via the IFTTT service and tell the user to add water if the value
% is in the lowest 10 %.
%
% Before you begin:
%  Use the IFTTT tutorial at
%   https://www.mathworks.com/help/thingspeak/analyze-channel-data-to-send-email-notification-from-ifttt.html
%  to set up a webhooks applet and get an API key for that applet.

% Store the channel ID for the moisture sensor channel.
channelID = 276330;

% Enter the trigger url from IFTTT.  It will have the form:
%. https://www/maker/com/trigger/<path>/with/key/<ITFFF API key>
iftttURL = '';

% Channel Read API Key (if you are using your own moisture channel)
% If your channel is private, then enter the read API Key between the '' below:
readAPIKey = '';

% Read the last two weeks of moisture data from ThingSpeak.
moistureData = thingSpeakRead(channelID,'NumDays',14,'Fields',1,'ReadKey',readAPIKey);

% Calculate the threshold from the recent data.
span=max(moistureData)-min(moistureData);
dryValue = 0.1*span+min(moistureData);

% Build the ThingSpeak URL.
thingSpeakURL = strcat('https://api.thingspeak.com/channels/',string(channelID),'/fields/1/last.txt');

% GET the data from ThingSpeak.
lastValue = str2double(webread(thingSpeakURL, 'api_key', readAPIKey));

if (lastValue<dryValue)
    plantMessage = ' I need water! ';
    webwrite(iftttURL,'value1',lastValue,'value2',plantMessage);
end

if (lastValue>dryValue)
    plantMessage = ' No Water Needed. ';
    webwrite(iftttURL,'value1',lastValue,'value2',plantMessage);
end