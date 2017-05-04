% ----------------------------------------------------------------------------
%  Project:     Tukey g- and h- transformations    
% ----------------------------------------------------------------------------
%  Quantlet:    TukeyEmpirical_h
% ----------------------------------------------------------------------------
%  Description: TukeyEmpirical_h estimates parameter 'h' by matching
%               the kurtosis of Tukey g- and h- transformations to the 
%               empirical sample equivalents;
%               Auxiliary code is 'tukeyrooth.m'
%               Distribution is assumed to be symmetric, i.e. g --> 0
% ----------------------------------------------------------------------------
%  Author:      Matlab: Natalia Sirotko-Sibirskaya
% ----------------------------------------------------------------------------

% clear history
clear all
close all
clc

% preliminary steps: 
% 1 load the data
% 2 estimate sample mean, std and kurtosis

% find the value for 'h'
fun = @tukeyrooth; % function
x0 = 0; % initial point
z = fzero(fun,x0) % z is the root == h

% calculate two central moments of Tukey distribution as well as expectation and
% variance
 
E1 = 0;
E2 = 1/(1-2*z)^(3/2);

tukey_mean = E1;
tukey_variance = E2-E1^2;

% calculate values necessary for the linear transformation
% specify your sample mean and std 
 
a=std/tukey_variance;
b=mean - a*tukey_mean;
 
% specify linear transformation as following:
 
R=randn(1,10000);
fit = a*z*exp(z*R.^2/2)+b;
 
% For reference see Headrick et al. (2008), "Parametric probability
% densities and distribution functions for Tukey g- and h- Transformations
% and their Use for Fitting Data", Applied Mathematical Science 2/9,
% 449-462.
 
 
 
 
 
 
