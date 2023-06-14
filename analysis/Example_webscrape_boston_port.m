% Scrape a website to identify the number of vessels currently in the Port
% of Boston. Then write the number of vessels to another ThingSpeak channel.

% Specify the URL containing information on Boston Harbor traffic
url = 'https://www.marinetraffic.com/en/ais/details/ports/131/USA_port:BOSTON';

% Fetch data and parse it to find information of interest. Learn more about
% the URLFILTER function in  File Exchange (https://www.mathworks.com/matlabcentral/fileexchange/44751-url-filter).
filteredData = urlfilter(url,'Vessels in Port:',2);

% filteredData contains two elements of data:
% 1. Vessels in Port
% 2. Expected Arrivals

display(filteredData(1),'Vessels in Port');
display(filteredData(2),'Expected Arrivals');

fprintf(['Note: To write data to another channel, assign the write channel ID \n',...
'and API Key to ''writeChannelID'' and ''writeAPIKey'' variables. Also \n',...
'uncomment the line of code containing ''thingSpeakWrite'' \n',...
'(remove ''%%'' sign at the beginning of the line.)']);

% To store the number of vessels info, write it to a channel other than
% the one used for reading data. To write to a channel, assign the write
% channel ID to the 'writeChannelID' variable, and the write API Key to the
% 'writeAPIKey' variable below. Find the write API Key on the API Keys
% tab of your channel view.

% Replace the [] with channel ID to write data to:
writeChannelID = [];
% Enter the Write API Key between the '' below:
writeAPIKey = '';

% Learn more about the THINGSPEAKWRITE function by going to the mathworks documentation at http://www.mathworks.com/support.

% thingSpeakWrite(writeChannelID,filteredData,'WriteKey',writeAPIKey);
