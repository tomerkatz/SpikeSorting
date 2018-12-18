
function [clLabel,distanceMat] = sclassifier(meanWf,testWf,Distance) 

    distanceMat = pdist2(testWf',meanWf,Distance);
    [min_value,clLabel] = min(distanceMat,[],2);
    
%    clLabel(clLabel>=18)=clLabel(clLabel>=18)+1;
%      clLabel(clLabel==18)=1;
clLabel=clLabel;
% check=clLabel==testClu;
% succ=sum(check)/length(testClu)
end