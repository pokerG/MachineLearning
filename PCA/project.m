function Z = project(X, U, K)
Z = zeros(size(X, 1), K);
x = X';
Z = x' * U(:, 1:K);
end
