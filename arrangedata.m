function [cluN, spkN, resN, indices] = arrangedata(partsNum,clu,spk,res,fold) 
spkN = reshape(permute(spk,[2,1,3]),(size(spk,1)*size(spk,2)),[]);
clu = clu+1;
clu = clu(2:end);
idx = randi([1 length(clu)],1,length(clu));
cluN = clu(idx);
resN = res(idx);
spkN = spkN(:,idx);
indices = crossvalind('Kfold',cluN,fold);
%clu_parts = {};
%res_parts = {};
%spk_parts = {};
%temp = floor(length(res)/partsNum);
%for k = 1:partsNum
%  clu_parts{k} = cluN(1+temp*(k-1):temp*k);
%   res_parts{k} = resN(1+temp*(k-1):temp*k);
%   spk_parts{k} = spkN(:,1+temp*(k-1):temp*k);
%end
%cluN = clu_parts;
%resN = res_parts;
%spkN = spk_parts;
%indices = crossvalind('Kfold',cluN,fold);
end 