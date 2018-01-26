function [radian_mean, radian_var] = angleMV(angleMatrix,w,dim)
%ANGLEMV [radian_mean, radian_var] = angleMV(radianList,w,dim)
% get the angle mean and variance
% angleMatrix use radians
if nargin < 3
  dim = 1;
end
if nargin < 2 || isempty(w)
  % if no specific weighting has been specified
  % assume no binning has taken place
	w = ones(size(angleMatrix));
else
  if size(w,2) ~= size(angleMatrix,2) || size(w,1) ~= size(angleMatrix,1) 
    error('Input dimensions do not match');
  end 
end
% compute weighted sum of cos and sin of angles
radian_complex = sum(w.*exp(1i*angleMatrix),dim);
% obtain mean by
radian_mean = angle(radian_complex);
% 
% radian_coord = [cos(radianList),sin(radianList)];
% radian_coord_mean = mean(radian_coord,1);
% radian_mean = atan2(radian_coord_mean(2),radian_coord_mean(1));

radian_size = size(angleMatrix);
if radian_size(dim) > 1
    denom = radian_size(dim) - 1;
else
    denom = radian_size(dim);
end

diff = angleMatrix - repmat(radian_mean,radian_size(dim),1);
radian_diff = angleRange(diff);

radian_var = sum(radian_diff.^2)/denom;
end % endFun