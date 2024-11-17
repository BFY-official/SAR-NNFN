function res = perfs(Shat, S, L, which)
%% Compute PSNR and SSIM values for the amplitude channel of SAR images
%
% Input/Output
%
%    Shat       a SAR image of M x N, OR size D x D x M x N
%
%    S          a refernce SAR image of same size as Shat
%
%    L          the number of looks
%               parameter of the Wishart distribution
%               linking C and Sigma
%               For SLC images: L = 1
%               For MLC images: L = ENL
%
%    res        a structure with field 'psnr' and 'ssim'
%               except if 'which' is used
%
% Optional arguments
%
%    which      'psnr': return PSNR only
%               'ssim': return SSIM only
%
%
% License
%
% This software is governed by the CeCILL license under French law and
% abiding by the rules of distribution of free software. You can use,
% modify and/ or redistribute the software under the terms of the CeCILL
% license as circulated by CEA, CNRS and INRIA at the following URL
% "http://www.cecill.info".
%
% As a counterpart to the access to the source code and rights to copy,
% modify and redistribute granted by the license, users are provided only
% with a limited warranty and the software's author, the holder of the
% economic rights, and the successive licensors have only limited
% liability.
%
% In this respect, the user's attention is drawn to the risks associated
% with loading, using, modifying and/or developing or reproducing the
% software by the user in light of its specific status of free software,
% that may mean that it is complicated to manipulate, and that also
% therefore means that it is reserved for developers and experienced
% professionals having in-depth computer knowledge. Users are therefore
% encouraged to load and test the software's suitability as regards their
% requirements in conditions enabling the security of their systems and/or
% data to be ensured and, more generally, to use and operate it in the
% same conditions as regards security.
%
% The fact that you are presently reading this means that you have had
% knowledge of the CeCILL license and that you accept its terms.
%
% Copyright 2017 Charles Deledalle
% Email charles-alban.deledalle@math.u-bordeaux.fr



if ndims(Shat) == 4 && size(Shat, 1) > 1
    error('Not implemented for multichannel images');
end

% Sqrt to convert intensity to amplitudes
res.psnr = psnr(squeeze(sqrt(Shat)), squeeze(sqrt(S)), quantile(sqrt(S(:)), 0.99));
res.ssim = ssim(squeeze(sqrt(Shat)), squeeze(sqrt(S)));

if exist('which', 'var')
    res = getfield(res, which);
end
