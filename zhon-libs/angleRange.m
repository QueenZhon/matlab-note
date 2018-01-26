function [ angleMatrix ] = angleRange( angleMatrix )
%ANGLERANGE [ angle ] = angleRange( angle )
% angle use radians
% range:(-pi,pi]

angle_size = size(angleMatrix);
if sum(angle_size) < 1
    error('Input is error');
end
for r_iter = 1:angle_size(1)
    for c_iter = 1:angle_size(2)
        while angleMatrix(r_iter,c_iter) > pi
            angleMatrix(r_iter,c_iter) = angleMatrix(r_iter,c_iter) - 2*pi;
        end
        
        while angleMatrix(r_iter,c_iter) <= -pi
            angleMatrix(r_iter,c_iter) = angleMatrix(r_iter,c_iter) + 2*pi;
        end
    end
end
end

