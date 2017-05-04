% ----------------------------------------------------------------------------
%  Project:     Tukey g- and h- transformations    
% ----------------------------------------------------------------------------
%  Quantlet:    tukeyrooth
% ----------------------------------------------------------------------------
%  Description: tukeyrooth is an auxiliary code for the main code
%               TukeyEmpirical_h; tukeyroot solves two nonlinear equations
%               in order to find 'h' parameter for approximation
%               or replication of symmetric distributions, i.e. g --> 0
% ----------------------------------------------------------------------------
%  Author:      Matlab: Natalia Sirotko-Sibirskaya
% ----------------------------------------------------------------------------

function y = tukeyrooth(x)
K = 5; % specify value for kurtosis
y = -K + 3*(1-2*x).^3*(1/(1-4*x).^(5/2) + 1/(2*x-1)^3);

% In the main code write the following: 

% fun = @tukeyrooth; % function
% x0 = 0; % initial point
% z = fzero(fun,x0) % solution

% For reference see Headrick et al. (2008), "Parametric probability
% densities and distribution functions for Tukey g- and h- Transformations
% and their Use for Fitting Data", Applied Mathematical Science 2/9,
% 449-462.


