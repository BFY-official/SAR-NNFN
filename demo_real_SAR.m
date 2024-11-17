clear;
close all;

addpathrec('.');
deterministic('on');

L = 2;
fprintf('L = %2d \n',L')
denoiser = @real_SARNNFN;

eps = 1e-5;
ima = loadimage('data/sar.png');

y = ima.^2;


disp('Run SAR-NNFN');

final_result = denoiser(ima, log(y+eps), sqrt(psi(1, L)),L);

disp('Completed! Please select the best one!');


% imwrite(uint8(final_result),'final_results.png')


