function [meanWf,stdWf,covWf]=WFinfo(trainLabels,trainWf);

cluHist=histcounts(trainLabels);
count=1;
meanWf=[];
stdWf=[];
covWf=[];
for i = 1:length(cluHist)
    if cluHist(i)<=1
        unitMean=ones(1,320).*100;
        unitStd=ones(1,320);
        unitcov=eye(320,320);
        
    else   
        meanWf = [meanWf;mean(trainWf(:,count:count+cluHist(i)-1)')];
        stdWf = [stdWf;std(trainWf(:,count:count+cluHist(i)-1)')];
        unitcov=cov(trainWf(:,count:count+cluHist(i)-1)');
    
    end
    covmat=cat(3,covWf,unitcov);
    count = count+cluHist(i);
end
covWf=covmat;
end    