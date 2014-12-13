clear ; close all; clc

data = load('data.txt');
X = data(:, 1);
y = data(:, 2);
n = length(y);
figure;hold on
plot(X,y,'rx','MarkerSize',10);
% Print out some data points
M = 10;
tmp = X;

for i=2:M
	X = [X,X(:,1).^i];
end 
X = [ones(n, 1) X];
alpha = 0.1;
num_iters = 100000;
theta = zeros(M + 1, 1);
n = length(y);
lamda = 0.01;
for i=1:num_iters
   z = X' * (X*theta -y) + lamda * theta;
   theta = theta - alpha / n * z;
end

plot(tmp, X*theta);





