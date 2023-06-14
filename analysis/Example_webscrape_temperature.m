% Scrape a website to identify the current temperature in Natick. The
% temperature is then written to another ThingSpeak channel.

% Specify the url containing information on current temperature in Natick, MA, U.S.A.

url = 'https://forecast.weather.gov/MapClick.php?zoneid=MAZ005&zflg=1';

% TODO - Replace the [] with channel ID to write data to:
writeChannelID = [];

% TODO - Enter the Write API Key between the '' below:
writeAPIKey = '';

% Fetch data and parse it to find information of interest. Learn more about
% the URLFILTER function by going to file exchange (https://www.mathworks.com/matlabcentral/fileexchange/44751-url-filter).
webText = webread(url);
tempF = urlfilter(webText, '<p class="myforecast-current-lrg">');

display(tempF, 'Temperature in Natick');

% Write the temperature data to another channel specified by the
% 'writeChannelID' variable

display(['Note: To successfully write data to another channel, ',...
    'assign the write channel ID and API Key to ''writeChannelID'' and ',...
    '''writeAPIKey'' variables above. Also uncomment the line of code ',...
    'containing ''thingSpeakWrite'' (remove ''%'' sign at the beginning of the line.)'])

% Learn more about the THINGSPEAKWRITE function by going to the MathWorks Documentation
% www.mathworks.com/help.

% thingSpeakWrite(writeChannelID, tempF, 'WriteKey', writeAPIKey);
