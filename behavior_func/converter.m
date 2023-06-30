function newdata = converter(path,file)
%UNTITLED3 Summary of this function goes here
%   converting data table to .mat
% converting
pdata = fullfile(path, file); %path to the selected file
data=readtable(pdata);
n=size(data);
for i=1:n(1)
    if strcmp(data{i,1},'CT13')
        switch char(data.Var2(i))
            case 'open feild'
                if strcmp(data{i,3},'duration')
                    newdata.CT13.OF.duration=data{i,4:9};
                else
                    newdata.CT13.OF.distance=data{i,4:9};
                end
            case 'EPM'
                if strcmp(data{i,3},'duration')
                    newdata.CT13.EPM.duration=data{i,4:9};
                else
                    newdata.CT13.EPM.distance=data{i,4:9};
                end
            case 'sugar preference test'
                if strcmp(data{i,3},'Right')
                    newdata.CT13.SP.Right=data{i,4:6};
                elseif strcmp(data{i,3},'Left')
                    newdata.CT13.SP.Left=data{i,4:6};
                else
                    newdata.CT13.SP.Baseline =data{i,4:6};
                end
            case 'forced swiming test'
                if strcmp(data{i,3},'Frequency')
                    newdata.CT13.FS.frequency=data{i,4:9};
                else
                    newdata.CT13.FS.duration=data{i,4:9};
                end
        end
    else
        switch char(data.Var2(i))
            case 'open feild'
                if strcmp(data{i,3},'duration')
                    newdata.T24.OF.duration=data{i,4:9};
                else
                    newdata.T24.OF.distance=data{i,4:9};
                end
            case 'EPM'
                if strcmp(data{i,3},'duration')
                    newdata.T24.EPM.duration=data{i,4:9};
                else
                    newdata.T24.EPM.distance=data{i,4:9};
                end
            case 'sugar preference test'
                if strcmp(data{i,3},'Right')
                    newdata.T24.SP.Right=data{i,4:6};
                elseif strcmp(data{i,3},'Left')
                    newdata.T24.SP.Left=data{i,4:6};
                else
                    newdata.T24.SP.Baseline =data{i,4:6};
                end
            case 'forced swiming test'
                if strcmp(data{i,3},'Frequency')
                    newdata.T24.FS.frequency=data{i,4:9};
                else
                    newdata.T24.FS.duration=data{i,4:9};
                end
        end
    end
end
fn="behavioralData.mat";
save(fullfile(path, fn),"newdata");

end