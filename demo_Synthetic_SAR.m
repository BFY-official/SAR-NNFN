clear;
close all;

addpathrec('.');
deterministic('on');

L = 1;
fprintf('L = %2d \n',L')
denoiser = @synthetic_SARNNFN;

eps = 1e-5;
ima = loadimage('data/syn.png');
x = ima.^2;

[m, n] = size(x);
y = x .* mean((randn(m, n, L).^2 + randn(m, n, L).^2) / 2, 3);


disp('Run SAR-NNFN');

final_result = denoiser(ima, log(y+eps), sqrt(psi(1, L)),L);


subplot(1,3,1);imshow(uint8(ima));
title('Clean');
subplot(1,3,2);imshow(uint8(sqrt(y)));
title('Speckled');
subplot(1,3,3);imshow(uint8(final_result));
title('Despeckled');


% imwrite(uint8(final_result),'final_results.png')

