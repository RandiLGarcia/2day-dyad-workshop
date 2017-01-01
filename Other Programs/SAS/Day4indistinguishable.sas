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

*Run with a covariate;

proc mixed covtest ;
CLASS  dyadID day person;
model ASatisf = TIME CAAvoid CPAvoid TIME*CAAvoid TIME*CPAvoid / s ddfm=SATTERTH notest;
random I1 I1*time I2 I2*time/g sub=dyadID type=lin(6) ldata=g gcorr;
repeated person /rcorr type=cs sub=dyadid*day;
run;quit;

*STABILITY AND INFLUENCE MODEL for indistinguishable dyads;

*LIN(1) is the intercept variance;
*LIN(2) is the stability variance;
*LIN(3) is the influence variance;
*LIN(4) is the intercept covariance across persons;
*LIN(5) is the stability covariance across persons;
*LIN(6) is the influence covariance across persons;
*LIN(7) is the intercept-stability covariance within person;
*LIN(8) is the intercept-influence covariance within person;
*LIN(9) is the stabillity influence covariance within person;
*LIN(10)is the intercept-stability covariance across persons;
*LIN(11)is the intercept-influence covariance across persons;
*LIN(12)is the stabillity-influence covariance across persons;


proc mixed covtest maxiter=100 scoring=20; 
CLASS  dyadID day person;
model ASatisf = ASATISF_LAGGEDc PSATISF_LAGGEDc/ s ddfm=SATTERTH notest;
random I1 I1*ASATISF_LAGGEDc I1*PSATISF_LAGGEDc 
       I2 I2*ASATISF_LAGGEDc I2*PSATISF_LAGGEDc/g sub=dyadID type=lin(12) ldata=h gcorr;
parms .1 .04 .04 .08 .01 .01 .0 .0 .0 .0 .0 .0  .5 .2;
repeated person /rcorr type=cs sub=dyadid*day;
run;quit;



*STANDARD APIM for indistinguishable dyads;

*STABILITY AND INFLUENCE MODEL for indistinguishable dyads;

*LIN(1) is the intercept variance;
*LIN(2) is the actor variance;
*LIN(3) is the partner variance;
*LIN(4) is the intercept covariance across persons;
*LIN(5) is the actor covariance across persons;
*LIN(6) is the partner covariance across persons;
*LIN(7) is the intercept-actor covariance within person;
*LIN(8) is the intercept-partner covariance within person;
*LIN(9) is the actor-partner covariance within person;
*LIN(10)is the intercept-actor covariance across persons;
*LIN(11)is the intercept-partner covariance across persons;
*LIN(12)is the actor-partner covariance across persons;



data rdata;
set dir.kashy;
if person = 1 then I1 = 1;
if person = 2 then I1 = 0;
if person = 1 then I2 = 0;
if person = 2 then I2 = 1;
run;quit;



proc mixed covtest ;
CLASS  dyadID day person;
model ASatisf = ACONFLICTC PCONFLICTC/ s ddfm=SATTERTH notest;
random I1 I1*ACONFLICTC I1*PCONFLICTC 
       I2 I2*ACONFLICTC I2*PCONFLICTC /g sub=dyadID type=lin(12) ldata=h gcorr;
repeated person /rcorr type=cs sub=dyadid*day;
run;quit;









