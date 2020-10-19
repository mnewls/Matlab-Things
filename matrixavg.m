function avg = matrixavg(test_vec)
[r c] = size(test_vec);
sum = 0;
for i= 1:r
for j = 1:c
    sum = sum + test_vec(i,j);
end

end

avg = sum / (r * c);
end

