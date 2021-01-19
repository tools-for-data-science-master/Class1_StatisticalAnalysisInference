%% draw one example from the normal distribution 
mu = 5;
sigma = 2;
N = 30;
x = randn(N,1)*sigma+mu; 

%% compute the test statistic
x_bar = mean(x);
s = std(x);
Tstat = (x_bar-mu)/s*sqrt(N);

xvec = -4:0.1:4;
yvec = tpdf(xvec,N-1);
plot(xvec,yvec,'linewidth', 2)
ylabel 'Probability Density Function'
xlabel 't'
hold on;
plot([Tstat Tstat],[0 0.4],'k--','linewidth',2)

%% one-command for t-test
[h,p,ci,stat]=ttest(x,5)
