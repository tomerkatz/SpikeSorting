function [clu, spk, res] = loadfiles(path,i,SampNum, ChannelNum) 
Files = dir(path);
Files = Files(3:end);
for k=1:length(Files)
       if (strcmp(Files(k).name(end-4:end),['clu.' num2str(i)]))
           clu = importdata([Files(k).folder '\' Files(k).name]);
       end
       if (strcmp(Files(k).name(end-4:end),['spk.' num2str(i)]))
           spk = readspk([Files(k).folder '\' Files(k).name],ChannelNum,SampNum);
       end
       if (strcmp(Files(k).name(end-4:end),['res.' num2str(i)]))
           res = importdata([Files(k).folder '\' Files(k).name]);
       end
end
end