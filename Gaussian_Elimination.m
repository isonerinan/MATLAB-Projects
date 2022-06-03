%% Excercise 2 %%
%% Gaussian Elimination code for nxn matrices %%
clc;
%A = input("Please enter nxn A matrix: ");
%b = input("Please enter nx1 b matrix: ");

A = [7 -3 -1; 2 5 -3; 6 1 4];
b = [1; 2; -1];

disp("Step by Step Naive Gauss Method: ");
augmentedMatrix = [A b]
n = length(A);
tolerance = 1e-6;   % To prevent any rounding errors around zero

%% Forward Elimination
% For each pivot along the diagonal
for k = 1 : n-1
    % For each row under the pivot
    for m = k + 1 : n
        if abs(augmentedMatrix(m, k)) > tolerance
            % Factor is the ration between pivot value
            % and the entry below pivot in row m
            factor = augmentedMatrix(k, k) / augmentedMatrix(m, k);

            % Row replacement operation
            augmentedMatrix(m, :) = factor * augmentedMatrix(m, :) - augmentedMatrix(k, :)

            disp("-------------------------------------")
        end
    end
end

%% Backward Substitution for Ax = b -> finding x

% Normalization for A
% For each row
for k = n : -1 : 1
    % For each column
    for m = k : n
        if abs(augmentedMatrix(k, m)) > tolerance
            augmentedMatrix(k, :) = augmentedMatrix(k, :) / augmentedMatrix(k, m);
            break
        end
    end
end

disp("Normalized augmented matrix:"); disp(augmentedMatrix);

% Actual solution
x = zeros(n, 1);
x(n, 1) = augmentedMatrix(n, n+1);
% For each row
for k = n-1 : -1 : 1
    % For each column
    for m = n : -1 : k
        if abs(augmentedMatrix(k, m)) > tolerance
                % xk is equal to b' minus the multiplication of other x
                % values with the corresponding coefficients in the
                % augmented matrix
                x(k, 1) = augmentedMatrix(k, n+1) - augmentedMatrix(k, m+1:n) * x(m+1 : n, 1);

        end
    end
end

disp("Solution vector: "); x

%% LU Decomposition code for nxn Matrices %%
disp("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");disp("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
disp("Step by Step LU Decomposition: ");
[L, U] = lu(A)

L_augmented = [L b]
% Normalization for L
% For each row
for k = 1 : n
    % For each column
    for m = n : -1 : k
        if abs(L_augmented(k, m)) > tolerance
            L_augmented(k, :) = L_augmented(k, :) / L_augmented(k, m);
            break
        end
    end
end

disp("Normalized augmented L matrix: "); disp(L_augmented);
%% Forward Substitution for Ly = b -> finding y

y = zeros(n, 1);
y(1, 1) = L_augmented(1, n+1);
% For each row
for k = 2 : n
    % For each column
    for m = n : -1 : k
        if abs(L_augmented(k, m)) > tolerance
                % xk is equal to b' minus the multiplication of other x
                % values with the corresponding coefficients in the
                % augmented matrix
                y(k, 1) = L_augmented(k, n+1) - L_augmented(k, 1 : m-1) * y(1 : m-1, 1);
        end
    end
end

y

U_augmented = [U y]

%% Backward Substitution for Ux = y -> finding x

% Normalization for U
% For each row
for k = n : -1 : 1
    % For each column
    for m = k : n
        if abs(U_augmented(k, m)) > tolerance
            U_augmented(k, :) = U_augmented(k, :) / U_augmented(k, m);
            break
        end
    end
end

disp("Normalized augmented U matrix:"); disp(U_augmented);

% Actual solution
x = zeros(n, 1);
x(n, 1) = U_augmented(n, n+1);
% For each row
for k = n-1 : -1 : 1
    % For each column
    for m = n : -1 : k
        if abs(U_augmented(k, m)) > tolerance
                % xk is equal to b' minus the multiplication of other x
                % values with the corresponding coefficients in the
                % augmented matrix
                x(k, 1) = U_augmented(k, n+1) - U_augmented(k, m+1:n) * x(m+1 : n, 1);

        end
    end
end

disp("Solution vector: "); x