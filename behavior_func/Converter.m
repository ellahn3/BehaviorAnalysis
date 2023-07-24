function newdata = Converter(path, file)
% CONVERTER - Convert CSV data to a nested structure and save it as a .mat file.
%   
% newdata = Converter(path, file)
%   This function reads a CSV data table located at the specified file path and processes
%   the data to create a nested structure called 'newdata'. The structure is created by
%   using the first three columns of the CSV data table as the field names, and each field
%   contains a sub-structure with fields corresponding to the fourth column onwards of the
%   data table. Any NaN values in the data are removed before storing in the structure.
%   Finally, the 'newdata' structure is saved as a .mat file with the same name as the
%   original file, but without the file extension.
%   Note: This function is designed to be very general and can handle diverse CSV data tables with three 
%   columns to create a nested MATLAB struct. It is ideal for converting structured data into a more 
%   organized and easily accessible format.
%
%   Inputs:
%     path - A string representing the file path of the CSV data table.
%     file - A string representing the name of the CSV data file.
%
%   Output:
%     newdata - A nested structure containing the converted data.
%
%   Author: Ella Hanzin 
%   Version: 1.0
%   Last Updated: 24-07-2023

%%  getting basic info about data
pdata= fullfile(path, file);
data = readtable(pdata);% reading the CSV data table
n = size(data);    %size of the data table
%newdata = struct();    % initializing a struct to store the converted data

%%
for i = 1:n(1)% loop through the rows of the data table
    myvec = data{i, 5:end};         % extracting the data vector from the 4th column onwards for the current row
    nanIndices = isnan(myvec);    % finding indices of NaN values in the data vector
    cleanedData = myvec(~nanIndices);    % removing NaN values from the data vector using logical indexing
    % creating nested struct fields based on the first three columns of the data table
    newdata.(char(data.Var1(i))).(char(data.Var2(i))).(char(data.Var3(i))).(char(data.Var4(i))) = cleanedData;
end
f = split(file, '.');% spliting the file name to remove the file extension
% saving the converted data struct to a .mat file with the same name as the original file
save(fullfile(path, char(f(1))), "newdata");
end