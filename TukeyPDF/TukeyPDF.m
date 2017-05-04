% ----------------------------------------------------------------------------
%  Project:     Tukey g- and h- transformations    
% ----------------------------------------------------------------------------
%  Quantlet:    TukeyPDF
% ----------------------------------------------------------------------------
%  Description: TukeyPDF produces parametric plots of Tukey g- and h-
%               transformed variables.  
% ----------------------------------------------------------------------------
%  Author:      Matlab: Natalia Sirotko-Sibirskaya
% ----------------------------------------------------------------------------

% clear history
clear all
close all
clc

x=linspace(-3,3,2000);

% specify values for g and h

g1=-0.78;
h1=0.06;

% specify dependent and independent variables for the parametric plot of a
% distribution

T1=(1/g1).*exp(h1*x.^2/2).*(exp(g1.*x)-1);      
y0=1/sqrt(2*pi)*exp(-x.^2./2);
yy1=exp(g1.*x+h1.*x.^2/2)+(1/g1).*exp(h1*x.^2/2).*(exp(g1.*x)-1).*h1.*x;
y1 = y0./yy1;    

g2=0.78;
h2=0.001;

T2=(1/g2).*exp(h2*x.^2/2).*(exp(g2.*x)-1);    
yy2=exp(g2.*x+h2.*x.^2/2)+(1/g2).*exp(h2*x.^2/2).*(exp(g2.*x)-1).*h2.*x;
y2 = y0./yy2;  

plot(T1+5,y1,'Color','magenta','Linewidth',2.5)
hold on
plot(T2-5,y2,'Color',[0.9100    0.4100    0.1700],'Linewidth',2.5)
hold on
plot(x,y0,'Color','b','Linewidth',2.5)
ylim([0,0.6])
xlim([-8,8])
xlabel('X','FontWeight','bold');
ylabel('Y','FontWeight','bold');
title('PDF of Tukey g- and h- transforms','FontWeight','bold')
hold off


% For reference see Headrick et al. (2008), "Parametric probability
% densities and distribution functions for Tukey g- and h- Transformations
% and their Use for Fitting Data", Applied Mathematical Science 2/9,
% 449-462.