data g;
input parm row col value;
datalines;
1 1 1 1
1 3 3 1
2 2 2 1
2 4 4 1
3 1 2 1
3 3 4 1
4 1 3 1
5 2 4 1
6 1 4 1
6 2 3 1
;

data h;
input parm row col value;
datalines;
1 1 1 1
1 4 4 1
2 2 2 1
2 5 5 1
3 3 3 1
3 6 6 1
4 1 4 1
5 2 5 1
6 3 6 1
7 1 2 1
7 4 5 1
8 1 3 1
8 4 6 1
9 2 3 1
9 5 6 1
10 1 5 1
10 2 4 1
11 1 6 1
11 3 4 1
12 2 6 1
12 3 5 1
;


libname dir 'C:\Users\Kenny\Dropbox\Presentations\Dyad 13\Desktop\Other Programs\SAS\';
run;
data rdata;
set dir.kashy;
if person = 1 then I1 = 1;
if person = 2 then I1 = 0;
if person = 1 then I2 = 0;
if person = 2 then I2 = 1;
run;quit;
*GROWTH CURVE MODEL for indistinguishable dyads;

*LIN(1) is the intercept variance;
*LIN(2) is the slope variance;
*LIN(3) is the intercept-slope covariance same person;
*LIN(4) is the intercept covariance across persons;
*LIN(5) is the slope covariance across persons;
*LIN(6) is the intercept-slope covariance different person;

proc mixed covtest ;
CLASS  dyadID day person;
model ASatisf = TIME / s ddfm=SATTERTH notest;
random I1 I1*time I2 I2*time/g sub=dyadID type=lin(6) ldata=g gcorr;
repeated person /rcorr type=cs sub=dyadid*day;
run;quit;

