function [trainWf,testWf,trainLabels,testLabels]=trainTest(clu1,spk1,indices,j)

    trainIdx=find(indices~=j);
    testIdx=find(indices==j);
    
    [trainLabels,idxLabels] = sort(clu1(trainIdx));

    trainWf=spk1(:,trainIdx);
    trainWf=trainWf(:,idxLabels);
    testWf=spk1(:,testIdx);
    testLabels=clu1(testIdx);
    
end
