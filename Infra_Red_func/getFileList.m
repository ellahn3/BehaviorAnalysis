function[thelist]=getFileList(varargin);
% argin:
% 1 = search directory
% 2 = search tag
% 3 = include subfolders (0 = no, 1 = yes)
% 4 = searchmode ('endonly' or ['anywhere'])

if(nargin<3) includesubfolders=0; end
searchmode='endonly'
if nargin<2 disp('not enough input arguments'); return; end;
if nargin>1 thedir=varargin{1}; thetag=varargin{2}; end
if nargin>2 includesubfolders=varargin{3}; else includesubfolders=1; end
if nargin>3 searchmode=varargin{4}; else searchmode='anywhere'; end
        
% divider=strfind(thetag,'*');
% 
% switch length(divider)
%     case 0
%         'name-end search only'
%         searchn=1;
%         extlen=length(theextension);
%         minlen=extlen;
%     case 1
%         'wildcard search'
%         searchn=2;
%         extlen1=divider(1)-1;
%         ext1str=theextension(1:extlen1);
%         extlen2=length(theextension)-divider(1);
%         ext2str=theextension(divider(1)+1:end);
%         minlen=extlen1+extlen2+1;
% 
%     case 2
%         'too many wild cards - one only please'
%         return
% end

count=0;
hitcount=0;
done=0;

filelist=dir(thedir);
filelist(:).name;
thelist={};
while ~done
    count=count+1;
    curfile=filelist(count);
    curfile.name;
    if curfile.isdir & ~strcmp(curfile.name(1),'.') & includesubfolders
        newfiles=dir(fullfile(thedir, curfile.name));
        for i = 1:length(newfiles)
            if ~strcmp(newfiles(i).name(1),'.');
                newfiles(i).name=fullfile(curfile.name,newfiles(i).name);
                filelist(end+1)=newfiles(i);
            end
        end
    else
        
            switch searchmode
                case 'anywhere'
                    tf=strfind(curfile.name,thetag);
                case 'endonly'
                   
                    thename=shortfile(curfile.name);
                    if length(thename)>length(thetag);
                    thename=thename(end-length(thetag)+1:end);
                    tf=strcmp(thename(end-length(thetag)+1:end),thetag);
                    else
                       tf=0;
                    end
            end
            if tf
                hitcount=hitcount+1;
                thelist{hitcount}=fullfile(thedir,curfile.name);
            end

    end
    if count == length(filelist)
        done=1;
    end
%         filelist
%         for ii=1:length(filelist);
%             disp(filelist(ii).name)
%         end

end
for ii=1:length(thelist)
    disp(thelist{ii});
end

disp(sprintf('nr of files found: %d', hitcount));
