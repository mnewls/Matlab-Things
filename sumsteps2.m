function [sum] = sumsteps2(in)
sum = 0;
for i=1:2:in
    sum = i + sum;
end

end