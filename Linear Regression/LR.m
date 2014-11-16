clear ; close all; clc

data = load('data.txt');
X = data(:, 1);
y = data(:, 2);
n = length(y);
figure;hold on
plot(X,y,'rx','MarkerSize',10);
% Print out some data points
M = 3;
tmp = X;

for i=2:M
	X = [X,X(:,1).^i];
end 
X = [ones(n, 1) X];
alpha = 0.01;
num_iters = 100000;
theta = zeros(M + 1, 1);
m = length(y);
for i=1:num_iters
   z = X' * (X*theta -y);
   theta = theta - alpha * z;
end

plot(tmp, X*theta);





