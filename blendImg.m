% Separate Script
function res = blendImg ( im1 , im2 , alpha, beta )
% alpha is blending weight for image 1
% beta is blending weight for image 2
 res = alpha .* im1 + beta .* im2 ;
end