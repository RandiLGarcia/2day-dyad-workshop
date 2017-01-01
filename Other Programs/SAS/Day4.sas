libname dir 'C:\Users\Kenny\Dropbox\Presentations\Dyad 13\Desktop\Other Programs\SAS\';
run;
data rdata;
set dir.kashy;
run;

*GROWTH CURVE MODEL;
*Two Intercept;
proc mixed covtest ;
CLASS  dyadID day person;
model ASatisf =  MAN WOMAN TIME*MAN TIME*WOMAN /noint s ddfm=SATTERTH notest;
random MAN WOMAN TIME*MAN TIME*WOMAN /gcorr sub=dyadid type=un;
repeated person /rcorr type=csh sub=dyadid*day;
run;quit;

*Gender Interactions;
proc mixed covtest ;
CLASS  dyadID day person;
model ASatisf =   TIME Gender TIME*Gender  /noint s ddfm=SATTERTH notest;
random MAN WOMAN TIME*MAN TIME*WOMAN/gcorr sub=dyadid type=un;
repeated person /rcorr type=csh sub=dyadid*day;
run;quit;


* With a moderator;
* Two Intercept;
proc mixed covtest ;
CLASS  dyadID day person;
model ASatisf =  MAN WOMAN TIME*MAN TIME*WOMAN CAAvoid*MAN CAAvoid*WOMAN CPAvoid*MAN CPAvoid*WOMAN 
CAAvoid*MAN*TIME CAAvoid*WOMAN*TIME CPAvoid*MAN*TIME CPAvoid*WOMAN*TIME 
/noint s ddfm=SATTERTH notest;
random MAN WOMAN TIME*MAN TIME*WOMAN /gcorr sub=dyadid type=un;
repeated person /rcorr type=csh sub=dyadid*day;
run;quit;

*Gender Interactions;
proc mixed covtest ;
CLASS  dyadID day person;
model ASatisf = TIME Gender TIME*Gender CAAvoid CPAvoid TIME*CAAvoid  TIME*CPAvoid 
 Gender*CAAvoid  Gender*CPAvoid TIME*Gender*CAAvoid  TIME*Gender*CPAvoid 
/noint s ddfm=SATTERTH notest;
random MAN WOMAN TIME*MAN TIME*WOMAN /gcorr sub=dyadid type=un;
repeated person /rcorr type=csh sub=dyadid*day;
run;quit;

* Stability and Influence MODEL WITH SATISFACTION;   

*Two Intercept;
proc mixed covtest ;
CLASS  dyadID day person;
model ASatisf =  man woman ASATISF_LAGGEDc*MAN ASATISF_LAGGEDc*WOMAN PSATISF_LAGGEDc*MAN PSATISF_LAGGEDc*WOMAN 
 /noint s ddfm=SATTERTH notest;
random man woman man*ASATISF_LAGGEDC woman*ASATISF_LAGGEDc man*PSATISF_LAGGEDC woman*PSATISF_LAGGEDc
 /gcorr sub=dyadid type=un;
repeated person /rcorr type=csh sub=dyadid*day;
run;quit;

*Comment gender as a moderator;
*Note convergence problems and number of iterations increased on the "proc mixed" record;
proc mixed covtest maxiter=100;
CLASS  dyadID day person;
model ASatisf =  Gender  ASATISF_LAGGEDc PSATISF_LAGGEDc ASATISF_LAGGEDc*Gender PSATISF_LAGGEDc*Gender 
 / s ddfm=SATTERTH notest;
random man woman man*ASATISF_LAGGEDC woman*ASATISF_LAGGEDc man*PSATISF_LAGGEDC woman*PSATISF_LAGGEDc
 / gcorr sub=dyadid type=un;
repeated person /rcorr type=csh sub=dyadid*day;
run;quit;

*WITH ATTACHMENT AVOIDANCE AS THE MODERATOR SATURATED;
proc mixed covtest maxiter=100;
CLASS  dyadID day person;
model ASatisf =  Gender CAAvoid CPAvoid  ASATISF_LAGGEDc PSATISF_LAGGEDc
ASATISF_LAGGEDc*Gender PSATISF_LAGGEDc*Gender Gender*CPAvoid Gender*CAAvoid
CAAvoid*ASATISF_LAGGEDc CPAvoid *ASATISF_LAGGEDc  
CAAvoid*PSATISF_LAGGEDc CPAvoid *PSATISF_LAGGEDc 
CAAvoid*ASATISF_LAGGEDc*Gender CPAvoid *ASATISF_LAGGEDc*Gender  
CAAvoid*PSATISF_LAGGEDc*Gender CPAvoid *PSATISF_LAGGEDc*Gender 
  / s ddfm=SATTERTH notest;
random man woman man*ASATISF_LAGGEDC woman*ASATISF_LAGGEDc man*PSATISF_LAGGEDC woman*PSATISF_LAGGEDc
 / gcorr sub=dyadid type=un;
repeated person /rcorr type=csh sub=dyadid*day;
run;quit;


* WITH ATTACHMENT AVOIDANCE AS THE MODERATOR (no three ways);
proc mixed covtest maxiter=100;
CLASS  dyadID day person;
model ASatisf = Gender CAAvoid CPAvoid  ASATISF_LAGGEDc PSATISF_LAGGEDc
ASATISF_LAGGEDc*Gender PSATISF_LAGGEDc*Gender Gender*CPAvoid Gender*CAAvoid
CAAvoid*ASATISF_LAGGEDc CPAvoid *ASATISF_LAGGEDc  
CAAvoid*PSATISF_LAGGEDc CPAvoid *PSATISF_LAGGEDc
  / s ddfm=SATTERTH notest;
random man woman man*ASATISF_LAGGEDC woman*ASATISF_LAGGEDc man*PSATISF_LAGGEDC woman*PSATISF_LAGGEDc
 / gcorr sub=dyadid type=un;
repeated person /rcorr type=csh sub=dyadid*day;
run;quit;

*APIM;
*Two intercept;
proc mixed covtest ;
CLASS  dyadID day person;
model ASatisf = man woman ACONFLICTc*MAN ACONFLICTc*WOMAN PCONFLICTc*MAN PCONFLICTc*WOMAN 
  /noint s ddfm=SATTERTH notest;
random man woman man*ACONFLICTC woman*ACONFLICTc man*PCONFLICTC woman*PCONFLICTc / gcorr sub=dyadid type=un;
repeated person /rcorr type=csh sub=dyadid*day;
run;quit;


*Gender as a moderator;
proc mixed covtest ;
CLASS  dyadID day person;
model ASatisf = Gender ACONFLICTc PCONFLICTc ACONFLICTc*Gender PCONFLICTc*Gender  / s ddfm=SATTERTH notest;
random man woman man*ACONFLICTC woman*ACONFLICTc man*PCONFLICTC woman*PCONFLICTc / gcorr sub=dyadid type=un;
repeated person /rcorr type=csh sub=dyadid*day;
run;quit;

