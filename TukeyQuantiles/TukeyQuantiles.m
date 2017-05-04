% ----------------------------------------------------------------------------
%  Project:     Tukey g- and h- transformations    
% ----------------------------------------------------------------------------
%  Quantlet:    TukeyQuantiles
% ----------------------------------------------------------------------------
%  Description: TukeyQuantiles calculates quantiles for g- and h- modified
%               standard normal random variables
% ----------------------------------------------------------------------------
%  Author:      Matlab: Natalia Sirotko-Sibirskaya
% ----------------------------------------------------------------------------

% clear history
clear all
close all
clc

% quantile of the standard normal distribution is given as
prob=((1:100)-0.5)/100;
qp=norminv(prob,0,1);

% specify values of 'g' and 'h' parameters
g= -0.5;
h= -0.5;

% calculate Tukey quantiles
t =(1./g).*exp(h.*qp.^2/2).*(exp(g.*qp)-1);

% For reference see Headrick et al. (2008), "Parametric probability
% densities and distribution functions for Tukey g- and h- Transformations
% and their Use for Fitting Data", Applied Mathematical Science 2/9,
% 449-462.