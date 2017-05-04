% ----------------------------------------------------------------------------
%  Project:     Tukey g- and h- transformations    
% ----------------------------------------------------------------------------
%  Quantlet:    TukeyEmpirical_gh
% ----------------------------------------------------------------------------
%  Description: TukeyEmpirical_gh estimates parameters 'g' and 'h' by matching
%               the skew and the kurtosis of Tukey g- and h-
%               transformations to the empirical sample equivalents;
%               Auxiliary code is 'tukeyroot.m'
% ----------------------------------------------------------------------------
%  Author:      Matlab: Natalia Sirotko-Sibirskaya
% ----------------------------------------------------------------------------

% clear history
clear all
close all
clc

% read data to Matlab workspace

[A,B]=xlsread('dax2Y.xlsx');
dax=horzcat(A);
d=522; % specify the length of the data string

% compute the daily simple returns
 for i=2:d
        sreturns(i)=(dax(i)-dax(i-1))/dax(i); 
 end
 
 %hist(sreturns);
 
 % calculate summary statistics of the data: mean, std, skew, kurtosis
 S=skewness(sreturns);
 K=kurtosis(sreturns);
 mean=mean(sreturns);
 std=std(sreturns);
 
% specify obtained values S for skew and K for kurtosis in the auxiliary 'tukeyroot' file 
% find 'g' and 'h' values by solving the system of nonlinear equations

 x0 = [1; 0];  % Make a starting guess at the solution
[x,fval] = fsolve(@tukeyroot,x0) % Call solver
 x(1) % g
 x(2) % h
 
 % calculate two central moments of Tukey distribution as well as expectation and
 % variance
 
 E1 = (exp(x(1)^2/(2-2*x(2)))-1)/(x(1)*(1-x(2))^(1/2));
 E2 = (1-2*exp(x(1)^2/(2-4*x(2)))+exp(2*x(1)^2/(1-2*x(2))))/(x(1)^2*(1-2*x(2))^(1/2));

 tukey_mean = E1;
 tukey_variance = E2-E1^2;

 % calculate values necessary for the linear transformation
 
 a=std/tukey_variance;
 b=mean - a*tukey_mean;
 
 % specify linear transformation as following:
 
 R=randn(1,10000);
 fit = a*((1/x(1)).*exp(x(2)*R.^2/2).*(exp(x(1).*R)-1))+b;
 
% For reference see Headrick et al. (2008), "Parametric probability
% densities and distribution functions for Tukey g- and h- Transformations
% and their Use for Fitting Data", Applied Mathematical Science 2/9,
% 449-462.
 



