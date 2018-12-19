function [TP,TN,FP,FN,LS,TParr,FParr]=sRartePerUnit(clLabels,testLabels,numClasses);
TP=zeros(1,numClasses);
TN=zeros(1,numClasses);
FP=zeros(1,numClasses);
FN=zeros(1,numClasses);
LS=zeros(1,numClasses);
for i=1:numClasses
        tp=sum((clLabels==i)&(testLabels==i));
        fn=sum((clLabels~=i)&(testLabels==i));
        fp=sum((clLabels==i)&(testLabels~=i));
        tn=sum((clLabels~=i)&(testLabels~=i));
        TParr{i} = ((clLabels==i)&(testLabels==i));
        FParr{i} = ((clLabels==i)&(testLabels~=i));
        
        TP(i)=tp/(tp+fn);
        FP(i)=fp/(fp+tn);
        TN(i)=tn/(tn+fp);
        FN(i)=fn/(fn+tp);
        LS(i)=fp/(tp+fn);

        
end
   
% 
%         TP(i)=tp/total;
%         
%         s=sum((clLabels==i)&(testLabels~=i));
%         total=sum(testLabels==i);
%         TN(i)=s/total;
%         
%         s=sum((clLabels~=i)&(testLabels==i));
%         total=sum(testLabels==i);
%         FP(i)=s/total;