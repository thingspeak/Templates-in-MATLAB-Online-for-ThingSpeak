% Template MATLAB code for reading numeric data from a webpage, analyzing
% the data and storing the analyzed data in a channel.

% Prior to running this MATLAB code template, assign the url for the
% webpage to scrape to the 'url' variable. Also assign the target string to
% search for in the web page to the 'targetString' variable.

% To store the scraped data, you will need to write it to a channel other
% than the one you are reading data from.  Assign this channel ID to the
% 'writeChannelID' variable. Also assign the write API Key to the
% 'writeAPIKey' variable below. You can find the write API Key on the API Keys tab
% of your channel view.

% TODO - Specify URL of the page to read data from
url = '';
% TODO - Specify the target string to search in webpage
targetString = '';

% TODO - Replace the [] with channel ID to write data to:
writeChannelID = [];
% TODO - Enter the Write API Key between the '' below:
writeAPIKey = '';

%% Scrape the webpage %%
% Read data from the URL and scrape the first numeric value after the 
% targetString
data = urlfilter(url, targetString);
% To learn more about the URLFILTER function see the Documentation 
% tab on the right side of this page.

%% Analyze Data %%
% Add code in this section to analyze data and store the result in the
% 'analyzedData' variable.
analyzedData = data;

%% Write Data %%
thingSpeakWrite(writeChannelID, analyzedData, 'WriteKey', writeAPIKey);
