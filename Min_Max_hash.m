

clear all;
close all;
save_path = 'Result\FVC2002DB1.mat';
Nraw = 16; % parameter r
m = 300; %number of hash functions
Nhadm = 512; %dimension of partial-HADAMARD 
H = hadamard(Nhadm);
permatrix=zeros(Nraw,Nhadm,m);

% Generation of partial Hadamard Matrix

for k = 1:m
    perm = randperm (Nhadm,Nraw);

    for kk =1:Nraw
        permatrix (kk,:,k) = H(perm(kk),:); 
    end
end

for i = 1:m
    par_hard(:,:,i) = permatrix(:,:,i)';
end



for i = 1:100
    for j = 4:8

        file = strcat(pwd, '\data\',num2str(i),'_',num2str(j), '.mat');
        load(file);
        vector = Ftemplate;
        vector(:,300:512)=vector(:,1:213);   
    
       
        maxout_code = [];
        minout_code = [];
        min_max_code = [];

     for counter = 1:m
         tmp = vector * par_hard(:,:,counter);
         %% minmax index
         [val1, ind] = max(tmp);
         [val2,index] = min(tmp);
         maxout_code = [maxout_code, ind];
         minout_code = [minout_code, index];
     end
         min_max_code = [maxout_code,minout_code];
         
     file2 = strcat(pwd, '\minmaxout\', num2str(i), '_',num2str(j),'.mat');
     save(file2,'min_max_code');
           
    end
end  
[EER,gen,imp] = matching_minmax(save_path);

%%% Plot GEN, IMP  distribution
histogram(gen,'FaceColor',[0.4660 0.6740 0.1880],'Normalization','probability','BinWidth',0.02);
hold on
histogram(imp,'FaceColor',[0 0.4470 0.7410],'Normalization','probability','BinWidth',0.02);
legend('Genuine Scores','Imposter Scores');
title('Distribution of Genuine/Imposter Scores on FVC2002 DB1 (IMM-Hashing)');
xlabel('Scores');
ylabel('Frequency');
%%%%%%%%%5





