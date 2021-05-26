function [EER,gen,imp] = matching_minmax(scorepath)
gen = [];
for i = 1:100
    combination = nchoosek(4:8, 2);
    for j = 1:length(combination)
        file1 = combination(j,:);
        minmaxoutfile1 = strcat(pwd, '\minmaxout\', num2str(i), '_',num2str(file1(1)),'.mat');
        load(minmaxoutfile1);
        template1 = min_max_code;               
        minmaxoutfile2 = strcat(pwd, '\minmaxout\', num2str(i), '_',num2str(file1(2)),'.mat');
        load(minmaxoutfile2);      
        template2 = min_max_code; 
        
        %%% similarity calculation
        C2=abs(template1 - template2);
        CC=find(C2==0);
        totalnumbs=size(CC(),2);
        similiraty= totalnumbs/(length(template1)+length(template2)-totalnumbs);      
        gen = [gen; similiraty];
    end
end
filegen = strcat(pwd, '\Gscore\','Gs','.mat');
save(filegen,'gen');
        
        
imp = [];
combination = nchoosek(1:100, 2);

for i = 1:length(combination)
    files = combination(i,:);  
    minmaxoutfile1 = strcat(pwd, '\minmaxout\', num2str(files(1)), '_4.mat');
    load(minmaxoutfile1);
    template1 = min_max_code;       
    minmaxoutfile2 = strcat(pwd, '\minmaxout\', num2str(files(2)), '_4.mat');
    load(minmaxoutfile2);  
    template2 = min_max_code; 
    
   %% similarity calculation
    C2=abs(template1 - template2);
    CC=find(C2==0);
    totalnumbs=size(CC(),2);
    similiraty = totalnumbs/(length(template1)+length(template2)-totalnumbs);
    imp = [imp; similiraty];
end
fileimp = strcat(pwd, '\Iscore\','Is','.mat');
save(fileimp,'imp');

Impostor_score = imp;
Genuine_score = gen;
Genuine_score = sort(Genuine_score, 'descend');
Impostor_score = sort(Impostor_score, 'descend');
save(scorepath, 'Genuine_score', 'Impostor_score');
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.001);


 



 
 
 
 
