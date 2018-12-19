  function [labels,times,wf,indices]= orgnizeData(clu,res,spk,time,fold);
%%
% 
clu = clu+1;
clu=clu(2:end);
spk1 =reshape(permute(spk,[2,1,3]),320,[]);
% [a,b,c]=pca(spk1');
% spk1=b';
%%
%            
start=time(1)*60*20000;  %convert to sample
stop= time(2)*60*20000;
firstIdx= min(find(res>start));
lastIdx= max (find(res<stop));
idx=[firstIdx:lastIdx];
wf= spk1(:,idx);
times=res(idx);
labels=clu(idx);
indices = crossvalind('Kfold',labels,fold);
end
%%
