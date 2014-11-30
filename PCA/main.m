clear; clc;
load('faces.csv');
[U,S] = PCA(faces');
imtool(reshape(faces(:,5),50,50));
K = 10;
Z = project(faces',U,K);
Y = recover(Z,U,K);
y1 = Y(5,:);
y1 = reshape(y1,50,50);
imtool(y1);