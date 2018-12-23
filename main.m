ShankNum = 5;
SampNum= 32;
partsNum = 2;
fold = 5;
dataPath = 'C:\Users\Tomer\Desktop\spike sorting\data';
for i = 1:ShankNum
    ChannelNum = 10;
    if i == 4                %%shank 4 has 11 channels
       ChannelNum = 11;
    end 
    [clu, spk, res] = loadfiles(dataPath,i,SampNum,ChannelNum);
    [cluN, spkN, resN, indices] = arrangedata(partsNum,clu,spk,res,fold);
    for j = 1:fold
        [trainWf,testWf,trainLabels,testLabels] = trainTest(cluN{1},spkN{1},indices,j);
        [meanWf,stdWf,covWf]=WFinfo(trainLabels,trainWf);
    end 
        %[results] = simulation(rec_clus,cluN,spkN,resN,partsNum);
end  


    
