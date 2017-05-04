% ----------------------------------------------------------------------------
%  Project:     Tukey g- and h- transformations    
% ----------------------------------------------------------------------------
%  Quantlet:    TukeyQQ
% ----------------------------------------------------------------------------
%  Description: TukeyQQ plots quantiles based on a simulated sample from Tukey    
%               g- and h- transformed variables vs standard normal
%               quantiles. Matlab code for standard normal quantiles is
%               provided for reference. 
% ----------------------------------------------------------------------------
%  Author:      Matlab: Natalia Sirotko-Sibirskaya
% ----------------------------------------------------------------------------

% clear history
clear all
close all
clc

% Tukey QQs %

y = randn(1,10000);
g=-0.0465;
h=0.1325;
R=randn(1,10000);
x =(1/g).*exp(h*R.^2/2).*(exp(g.*R)-1);
qqplot(x,y);
ylabel('Standard Normal Quantiles','FontWeight','bold')
xlabel('Sample Quantiles from Tukey g- and h- distribution','FontWeight','bold')
title('QQ plot: Standard Normal vs Tukey','FontWeight','bold')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Standard Normal QQs %
clear all
clc
x = randn(1,10000);
y = randn(1,10000);
qqplot(x,y);
ylabel('Standard Normal Quantiles','FontWeight','bold')
xlabel('Standard Normal Quantiles','FontWeight','bold')
title('Standard Normal QQs','FontWeight','bold')

% For reference see Headrick et al. (2008), "Parametric probability
% densities and distribution functions for Tukey g- and h- Transformations
% and their Use for Fitting Data", Applied Mathematical Science 2/9,
% 449-462.
