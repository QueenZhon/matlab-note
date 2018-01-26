function [ angle , angle_confidence ] = pca_svd( XY )
% PCASVD pca estimation using svd
%

if size(XY,1)~=2
    XY = XY.';
end
pca_size = size(XY,2);
XY_new = XY - mean(XY,2);
XY_svd = XY_new * XY_new.' / pca_size;
[U,S,V] = svd(XY_svd);
xr = U(:,1) * (U(:,1).' * XY_new);
angle_confidence = S(1,1);% / (S(1,1) + S(2,2));
angle = atan2((xr(2, pca_size) - xr(2, 1)) , (xr(1, pca_size) - xr(1, 1)));
% figure;polarplot(XY(1,:)+1i*XY(2,:),'.')
% hold on;polarplot(xr(1,:)+1i*xr(2,:),'r')
end
% [coeff,score,latent,tsquared,explained,mu] = pca(data_xy);
% transMatrix = coeff(:,1);
% step_pca = transMatrix*(transMatrix'*data_xy');
% step_pca_ = bsxfun(@plus,step_pca.',mu);
% angle_pca(step_n) = atan2((step_pca_(end,2)-step_pca_(1,2)),(step_pca_(end,1)-step_pca_(1,1)));