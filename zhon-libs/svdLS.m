function [ theta ] = svdLS( b, X )
%SVDLS Multiple linear regression using least squares
%  theta = svdLS(b,X) returns the vector theta of regression coefficients in the
%   linear model b = X*theta.  X is an s-by-m design matrix, with rows
%   corresponding to observations and columns to predictor variables.  b is
%   an s-by-1 vector of response observations.

if  nargin < 2
    error(message('stats:regress:TooFewInputs'));
end

[~, c_r] = size(X);

[Ua,Sa,Va] = svd(X);

theta = Va(:,:)*Sa(1:c_r,:)^(-1)*Ua(:,1:c_r).' * b;

end

