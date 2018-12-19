function [D_TrueP, D_FalseP] = distvec(TrueP,FalseP,distanceM,numClasses);
TrueP = TrueP';
FalseP = FalseP';
for i=1:5
    for j=1:numClasses
        D_TrueP{i,j} = distanceM{i}(TrueP{j,i}==1,j);
        D_FalseP{i,j} = distanceM{i}(FalseP{j,i}==1,j);
    end 
end 
end 