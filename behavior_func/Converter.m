function newdata = Converter(path, file)
%CONVERTER Converts a CSV file to a structured MATLAB data (.mat) file.
%   The CSV data table should have  three columns that determine the
%   hierarchy of the resulting struct. Each row in the CSV corresponds to a
%   nested struct in the resulting MATLAB struct.
%
%   Parameters:
%       path: String representing the path to the directory where the CSV file is located.
%       file: String representing the name of the CSV file to be converted.
%
%   Returns:
%       newdata: A MATLAB struct containing the converted data with a nested structure.
%
%   Note: This function is designed to be very general and can handle diverse CSV data tables with three 
%   columns to create a nested MATLAB struct. It is ideal for converting structured data into a more 
%   organized and easily accessible format.

data = readtable(pdata);% reading the CSV data table
n = size(data);    %size of the data table
newdata = struct();    % initializing a struct to store the converted data

for i = 1:n(1)% loop through the rows of the data table
    myvec = data{i, 4:end};         % extracting the data vector from the 4th column onwards for the current row
    nanIndices = isnan(myvec);    % finding indices of NaN values in the data vector
    cleanedData = myvec(~nanIndices);    % removing NaN values from the data vector using logical indexing
    % creating nested struct fields based on the first three columns of the data table
    newdata.(char(data.Var1(i))).(char(data.Var2(i))).(char(data.Var3(i))) = cleanedData;
end
f = split(file, '.');% spliting the file name to remove the file extension
% saving the converted data struct to a .mat file with the same name as the original file
save(fullfile(path, char(f(1))), "newdata");
end
