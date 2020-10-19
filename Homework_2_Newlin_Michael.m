% Homework #2
% MEEN 2240 - Spring 2019
% Newlin, Michael
%% Ch.2, Exc.5
row_vec_1 = [3:8]
row_vec_2 = [1.3:0.4:2.5]
row_vec_3 = [9:-2:3]

%% Ch.2, Exc.8
row_vec_1 = [-4:0]
row_vec_2 = linspace(9,5,3)
row_vec_3 = linspace(4,8,3)

%% Ch.2, Exc.10
myend = randi([5,9],1)
myend_vec = [1:3:myend]

%% Ch.2, Exc.12
myvec = [-1:0.5:1]'

%% Ch.2, Exc.15
mat = zeros(2,4)
mat(1,:) = [1:4]
mat(:,3) = 1

%% Ch.2, Exc.20
rows = randi(5,1)
cols = randi(5,1)
mat = zeros(rows, cols)

%% Ch.2, Exc.22
v_mat = zeros(randi(5,1), randi(5,1))
v_vec = size(v_mat)
last = v_mat(v_vec(1), v_vec(2))

% there may be a single line statement to do this I just brute forced it
% b/c lazy

%% Ch.2, Exc.23
mat = randi(10,2,3)
flip(mat)
fliplr(mat)
flipud(mat)
rot90(mat)
rot90(rot90(mat))
% i think there are 6 ways to restucture it in total? or 5?

%% Ch.2, Exc.30
vec_x = linspace(-pi, pi, 20)
vec_y = sin(vec_x)

%% Ch.2, Exc.32
tot_1 = sum([2:2:10])


%% Ch.2, Exc.33
n = 5
%1 ./ [1:1:n]
sum_terms = sum(1 ./ [1:1:n])

%% Ch.2, Exc.36
vec = randi(20,1,6)
min_vec = min(vec)
max_vec = max(vec)
cum_sum_vec = cumsum(vec)
