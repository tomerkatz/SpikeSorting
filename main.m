ShankNum = 5;
SampNum=32;
for i = 1:ShankNum
    ChannelNum = 10;
    if i == 4                %%shank 4 has 11 channels
        ChannelNum = 11;
    end 
    [clu, spk, res] = loadfiles('C:\Users\Tomer\Desktop\spike sorting\data',i,SampNum,ChannelNum);
end 

    
