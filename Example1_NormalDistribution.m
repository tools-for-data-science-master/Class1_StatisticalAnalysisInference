%% create randomly (normally) distributed samples
mu = 5;
sigma = 2;
N = 100;
x = randn(N,1)*sigma+mu; 

%% maximum likelihood estimates
t = mle(x)

%% unbiased estimates
mu_hat = mean(x) % find the mean value of samples
sigma_hat = std(x) % find the stand deviation of samples
pd = fitdist(x,'Normal') % find the unbiased estimates

%% plot 
dx = 0.5;
hist(x,-2:dx:12);
hold on;

xvec = 0:0.1:10;
yvec = normpdf(xvec,mu,sigma);
plot(xvec,yvec*dx*numel(x),'k','linewidth',2);

yvec2 = normpdf(xvec,mu_hat,sigma_hat);
plot(xvec,yvec2*dx*numel(x),'r','linewidth',2);

%% kernal smoothing function for the distribution 
[f,xi,bw] = ksdensity(x);
plot(xi,f*dx*numel(x),'b','linewidth',2)