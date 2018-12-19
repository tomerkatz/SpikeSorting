% load SPK RES and CLU files
% load r
% r.pc.TP=[];
% r.pc.FN=[];
% r.pc.FP=[];
% r.pc.LS=[];
% r.pc.TPFN=[];
% r.pc.srate=[];
%  
% 
load spk
load res
load clu

% clu=importdata("F:\stark_lab\mC41_33\mC41_33.clu.5");
% res=importdata("F:\stark_lab\mC41_33\mC41_33.res.5");
% spk=readspk("F:\stark_lab\mC41_33\mC41_33.spk.5",10,32);
numClasses=clu(1)+1;

%%
recTime=[0 60;30 90;90 150;120 180];
results=[];
srate=[];
for j=1:4
    duration=recTime(j,:);
[labels,times,wf,indices]= orgnizeData(clu,res,spk,duration,5);
allTP=[];
allTN=[];
allFP=[];
allFN=[];
TrueP=[];
FalseP=[];
for i =1:5
    [trainWf,trainLabels,testWf,testLabels]=trsinTest(wf,labels,indices,i);
    [meanWf,stdWf,covWf]=wfPrameters(trainLabels,trainWf);
    Distance='euclidean';
    [clLabel,distanceM{i}] = sclassifier(meanWf,testWf,Distance);
    %clLabel=classifier(meanWf,testWf,Distance,covWf);

    check=clLabel==testLabels;
    succ(i)=sum(check)/length(testLabels);
   
   [TP,TN,FP,FN,LS,TParr,FParr]=sRartePerUnit(clLabel,testLabels,numClasses);
   TrueP = [TrueP;TParr];
   FalseP = [FalseP;FParr];
   allTP=[allTP;TP];
   allTN=[allTN;TN];
   allFP=[allFP;FP];
   allFN=[allFN;FN];
end

[D_TrueP, D_FalseP] = distvec(TrueP,FalseP,distanceM,numClasses);

succ'   
meanTN=mean(allTN);
meanTP=mean(allTP);
meanFP=mean(allFP);
meanFN=mean(allFN);

results=[results,[meanTP';meanFN';meanFP';LS';meanTP'./meanFN']];
srate=[srate;succ'];
end


%   n=size(meanFN,2);
%   r.pc.TP=[r.pc.TP;results(1+(0*n):(0+1)*n,:)];
%   r.pc.FN=[r.pc.FN;results(1+(1*n):(1+1)*n,:)];
%   r.pc.FP=[r.pc.FP;results(1+(2*n):(2+1)*n,:)];
%   r.pc.LS=[r.pc.LS;results(1+(3*n):(3+1)*n,:)];
%   r.pc.TPFN=[r.pc.TPFN;results(1+(4*n):(4+1)*n,:)];
%   r.pc.srate=[r.pc.srate,nanmean(srate)];

  


% figure;bar(meanTP);title('TP');
% figure;bar(meanFP);title('FP');
% figure;bar(meanFN);title('FN');
% figure;bar(meanTP./meanFN);
% figure;bar(LS);
% % 
% % 
% % % %%
% figure;
% bar(histcounts(testLabels((clLabel==18)&(testLabels~=18))));
% xlabel('unit');
% ylabel('counts');
% title('Unit 18 miss hist euc-dis');
