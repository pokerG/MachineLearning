
clear ; close all; clc

fprintf('Generate data \n');
m = 20;
X = ones(m,2);
% mean_t = ones(40,1);

for i = 1:m
	X(i,1) = i / m;
	X(i,2) = sin(2 * pi * i / m);
end

% figure;

% plot(X(:,1),X(:,2),'rx','MarkerSize',10);

noise_var = 0.01; % Vary this to change the noise level
noisy_t = X(:,2) + randn(size(X(:,2))).*sqrt(noise_var);
X(:,2) = noisy_t;
figure;

plot(X(:,1),X(:,2),'rx','MarkerSize',10);

fid=fopen('data.txt','w');  
[x,y]=size(X);  
for i=1:x  
    for j=1:y-1  
        fprintf(fid,'%g,',X(i,j));  
    end  
    fprintf(fid,'%g\n',X(i,y));%每一行回车\n  
end  
fclose(fid);  