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

