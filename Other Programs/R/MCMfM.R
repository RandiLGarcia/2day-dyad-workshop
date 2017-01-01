# Base code take from Selig and Preacher

# You need to load the package MASS
 
# You need to enter the appropriate values for the next five variables:
#      a or the path from X to M
#      b or the path from M to Y
#      astd or the standard error for a 
#      bstd or the standard error for b
#      rab or the correlation of a and b (in most applications it equals zero)  


#  You can also change number of replications or "rep" and the confidence level or "conf."

library(MASS)

a=-.444868
b=-.302190
ab=a*b
astd=.073671
bstd=.032842

rep=20000
conf=95
cc=0
pest=c(a,b)
acov <- matrix(c(astd^2, rab*astd,rab*astd, bstd^2),2,2)
mcmc <- mvrnorm(rep,pest,acov,empirical=FALSE)
ab <- mcmc[,1]*mcmc[,2]
for (ii in 1: rep) if (ab[ii] > 0) cc = cc + 1/rep

low=(1-conf/100)/2
upp=((1-conf/100)/2)+(conf/100)
LL=quantile(ab,low)
UL=quantile(ab,upp)
LL4=format(LL,digits=4)
UL4=format(UL,digits=4)
#PP=format(round(cc,5),digits=5)
#if(PP=="5e-05")PP=".00000"


ae=format(a,digits=4)
be=format(b,digits=4)
sea=format(astd,digits=4)
seb=format(bstd,digits=4)
iee=format(a*b,digits=4)


pv=1-2*abs(.5- cc) 
pv=format(round(pv,5),digits=5)


txta= paste0("The a effect is ",ae," with a standard error of ",sea,".")
txtb= paste0("The b effect is ",be," with a standard error of ",seb,".")
txtc= paste0("The indirect effect is ",iee,".")
txt0= paste0("The 95% CI of the indirect effect goes from ",LL4," to ",UL4,".")
txt1= paste0("The p value of the indirect effect is ",pv,".")

txta
txtb
txtc
txt0
txt1

