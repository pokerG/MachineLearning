function X_rec = recover(Z, U, K)
X_rec = zeros(size(Z, 1), size(U, 1));
v = Z';
X_rec = v' * U(:, 1:K)';
end
