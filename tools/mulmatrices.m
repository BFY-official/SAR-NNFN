function x = mulmatrices(x, y)
%%% Multiply matrix-wise two hermitian matrix fields

[D, D, M, N] = size(x);
z = zeros(D, D, M, N);
for i = 1:D
    for j = 1:D
        for k = 1:D
            z(i, j, :, :) = z(i, j, :, :) + ...
                x(i, k, :, :) .* y(k, j, :, :);
        end
    end
end
x = z;

end

