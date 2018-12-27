function [correlLabel,euclidLabel,EuclidM,CorrelM] = distcalc(meanWf,testWf,j) 
    EuclidM = pdist2(testWf',meanWf,'euclidean');
    CorrelM = pdist2(testWf',meanWf,'correlation');
    [Cmin_value,correlLabel] = min(CorrelM,[],2);
    [Emin_value,euclidLabel] = min(EuclidM,[],2);
end