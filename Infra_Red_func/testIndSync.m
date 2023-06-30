
 data=[];
 for j=1:176/2     % Ta for rest of the days
        %data=[data,zeros(1,180),ones(1,180)];       % for indsync=1
        data=[data,ones(1,180),zeros(1,180)];       % for indsync=0
 end
 data=reshape(data,[],1);
 
 dataTS{1,1}=data;