function [trainWf,trainLabels,testWf,testLabels]=trsinTest(wf,labels,indices,i)

    trainIdx=find(indices~=i);
    testIdx=find(indices==i);
    
    [trainLabels,idxLabels]=sort(labels(trainIdx));
    testLabels=labels(testIdx);

    trainWf=wf(:,trainIdx);
    trainWf=trainWf(:,idxLabels);
    testWf=wf(:,testIdx);
    testLabels=labels(testIdx);
    
end
