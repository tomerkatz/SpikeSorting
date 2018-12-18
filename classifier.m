function clLabel=classifier(meanWf,testWf,Distance,covWf) 
mat=zeros(size(testWf,2),size(meanWf,1));

for i =1:26
    distanceMat = pdist2(testWf',meanWf(i,:),Distance);
    
    mat(:,i)=distanceMat;
end
[min_value,~] = min(mat,[],2);


clLabel=min_value;