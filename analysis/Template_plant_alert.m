% Read the soil moisture channel data from the past two weeks.
% Send an email and tell the user to add water if the value
% is in the lowest 10 %.

% Store the channel ID for the moisture sensor channel.
channelID = 276330;

% Provide the ThingSpeak alerts API key.  All alerts API keys start with TAK.
alertApiKey = 'TAKXXXXXXXXXXXXX';

% Set the address for the HTTTP call
alertUrl="https://api.thingspeak.com/alerts/send";

% webwrite uses weboptions to add required headers.  Alerts needs a ThingSpeak-Alerts-API-Key header.
options = weboptions("HeaderFields", ["ThingSpeak-Alerts-API-Key", alertApiKey ]);

% Set the email subject.
alertSubject = sprintf("Plant soil information");

% Read the recent data.
moistureData = thingSpeakRead(channelID,'NumDays',30,'Fields',1);

% Check to make sure the data was read correctly from the channel.
if isempty(moistureData)
    alertBody = ' No data read from plant. ';      
else
    % Calculate a 10% threshold value based on recent data.
    span = max(moistureData) - min(moistureData);
    dryValue = 0.1 * span + min(moistureData);

    % Get the most recent point in the array of moisture data.
    lastValue = moistureData(end); 

    % Set the outgoing message
    if (lastValue<=dryValue)
        alertBody = ' I need water! ';
    elseif (lastValue>dryValue)
        alertBody = ' No water needed. ';
    end
end
 
 % Catch errors so the MATLAB code does not disable a TimeControl if it fails
try
    webwrite(alertUrl , "body", alertBody, "subject", alertSubject, options);
catch someException
    fprintf("Failed to send alert: %s\n", someException.message);
end
