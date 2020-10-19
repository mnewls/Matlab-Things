% Michael Newlin In Class Assignment
%% problem 1
mat_A = [-16, 31, 36, 31; 84, -93, 52, -66; 59, 70, 49, 41; 92, 87, -22, -94];

min_A = min(mat_A')
max_A = max(mat_A')

A_abs = abs(mat_A)

max_A_abs = max(max(A_abs))

%% problem 2
data = [-40:10:50]

data_2x5 = reshape(data,2,5)

data_2x5(2,3) = 25

data_2x5