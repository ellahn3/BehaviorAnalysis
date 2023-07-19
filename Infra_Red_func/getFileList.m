function [thelist] = getFileList(varargin)
% getFileList - Get a list of files that match a specified search tag within a directory.
%
% This function searches for files in a specified directory that match a
% provided search tag. It can search only for file names that end with the
% search tag or anywhere in the file name. The search can include
% subfolders within the specified directory.
%
% Parameters:
%   varargin: Variable-length input arguments for the function.
%     varargin{1}- Search directory path.
%     varargin{2}-  Search tag for files.
%     varargin{3}- Include subfolders (0 = no, 1 = yes).
%     varargin{4}- Search mode ('endonly' or 'anywhere').
%
% Note: For the search tag, you can use '*' as a wildcard character.
%       The function returns a cell array containing the full paths of the
%       matched files.
%
%   Author: Shai Sabbah 
%   Editor: Ella Hanzin 
%   Version: 4.0
%   Last Updated: 02-07-2023


%% Set default values for input arguments
if nargin < 3
    includesubfolders = 0; % default, do not include subfolders
end

searchmode = 'endonly'; % default search mode is 'endonly'

% check the number of input arguments
if nargin < 2
    disp('Not enough input arguments');
    return;
end

%% Parse the input arguments
if nargin > 1
    thedir = varargin{1}; %  directory
    thetag = varargin{2}; %  tag
end

if nargin > 2
    includesubfolders = varargin{3}; 
else
    includesubfolders = 1; % default is to include subfolders
end

if nargin > 3
    searchmode = varargin{4}; % search mode ('endonly' or 'anywhere')
else
    searchmode = 'anywhere'; % default is to search anywhere in the file name
end

%% initialize variables
count = 0;
hitcount = 0;
done = 0;

filelist = dir(thedir); % get the list of files in the directory
filelist(:).name;

thelist = {}; % initialize an empty cell array to store matching file paths

while ~done
    count = count + 1;
    curfile = filelist(count);
    
    if curfile.isdir && ~strcmp(curfile.name(1), '.') && includesubfolders
        % if it's a subfolder and includesubfolders is true, search in the subfolder
        newfiles = dir(fullfile(thedir, curfile.name));
        for i = 1:length(newfiles)
            if ~strcmp(newfiles(i).name(1), '.')
                newfiles(i).name = fullfile(curfile.name, newfiles(i).name);
                filelist(end + 1) = newfiles(i);
            end
        end
    else
        switch searchmode
            case 'anywhere'
                tf = strfind(curfile.name, thetag);% searching for the search tag anywhere in the file name
            case 'endonly'
                % searching for the search tag only at the end of the file name
                thename = shortfile(curfile.name);
                if length(thename) > length(thetag)
                    thename = thename(end - length(thetag) + 1:end);
                    tf = strcmp(thename(end - length(thetag) + 1:end), thetag);
                else
                    tf = 0;
                end
        end
        
        if tf
            % if my tag is found in the file name, add the file path to thelist
            hitcount = hitcount + 1;
            thelist{hitcount} = fullfile(thedir, curfile.name);
        end
    end
    
    if count == length(filelist)
        done = 1; % sto the loop when all files are checked (a Flag)
    end
end

%% Display the list of matched files
for ii = 1:length(thelist)
    disp(thelist{ii});
end

fprintf('Number of files found: %d\n', hitcount);
end
