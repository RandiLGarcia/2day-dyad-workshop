require(MASS)

# You need to load the package MASS
 
# You need to enter the appropriate values for the next five variables:
#      a or the actor effect
#      p or the partner effect
#      astd or the standard error for a 
#      pstd or the standard error for p
#      rap or the correlation of a and p effects (NOT the correlation of the actor and partner variables)


a=0.4004231
p=0.2879705
astd= sqrt(0.00223862405881)
pstd= sqrt(0.00223862405881)
rap=  0.0005977126237/0.00223862405881


rep=40000
conf=99
pest=c(p,a)
acov <- matrix(c(pstd^2, rap*astd*pstd,rap*astd*pstd,astd^2),2,2)
mcmc <- mvrnorm(rep,pest,acov,empirical=FALSE)
ab <- mcmc[,1]/mcmc[,2]
low=(1-conf/100)/2
upp=((1-conf/100)/2)+(conf/100)
LL=quantile(ab,low)
UL=quantile(ab,upp)
LL4=format(LL,digits=4)
UL4=format(UL,digits=4)
cat(LL4,UL4)
