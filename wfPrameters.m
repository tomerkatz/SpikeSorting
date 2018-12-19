function [meanWf,stdWf,covWf]=wfPrameters(trainLabels,trainWf);


trainSpk=trainWf;
cluHist=histcounts(trainLabels);
count=1;
meanSpk=[];
stdSpk=[];
covmat=[];
for i= 1:length(cluHist)
    if cluHist(i)<=1
        unitMean=ones(1,320).*100;
        unitStd=ones(1,320);
%         unitcov=eye(320,320);
        
    else
        
    unitMean = mean(trainSpk(:,count:count+cluHist(i)-1)');
    unitStd = std(trainSpk(:,count:count+cluHist(i)-1)');
    unitcov=cov(trainSpk(:,count:count+cluHist(i)-1)');
    
    
    end
    meanSpk=cat(1,meanSpk,unitMean);
    stdSpk=cat(1,stdSpk,unitStd);
    covmat=cat(3,covmat,unitcov);
    count=count+cluHist(i);
end
meanWf=meanSpk;
stdWf=stdSpk;
covWf=covmat;

end    