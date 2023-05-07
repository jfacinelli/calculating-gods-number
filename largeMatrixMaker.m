% Matrix maker for larger formatted matrices

% Reads in the data from a provided path of csv file 
path = 'data/fruDouble.csv';
data = readmatrix(path);

% Instanciates a matrix of all zeros
n = 2592; % Adjust to input size of adjacency matrix
M = zeros(n, n);

% Populates the matrix based on the data
for row = 1:size(data,1)
    M(data(row, 1), data(row, 2)) = 1;
end

% Computes the eignevalues and normalized eigenvalues of the matrix
e = eig(M);
normalized_e = 1 - e/round(max(e));

% Uses normalized eigenvalues to calculate Kemeny's Constant
kemeny = 0;
for index = 1:numel(normalized_e) - 1
    kemeny = kemeny + (1/normalized_e(index));
end

% Calculates distinct eigenvalues based on difference of 
% neighboring values (eigenvalues are already ordered)
distinct = 1; % Always at least 1 distinct value
for index = 1:numel(e) - 1
    if (e(index + 1) - e(index)) > 0.00001
        distinct = distinct + 1;
    end
end