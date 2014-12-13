function [J, grad] = costFunction(theta, X, y)
m = length(y); % number of training examples

J = 0;
grad = zeros(size(theta));

hx = sigmoid(X * theta);
J= 1.0 / m * sum(-y .* log(hx) - (1.0 - y) .* log(1.0 - hx));
grad = (1.0 / m)  .* X' * (hx -y);

end
