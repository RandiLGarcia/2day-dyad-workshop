libname dir 'C:\Users\Kenny\Dropbox\Projects\Dyad Datic\SAS\';
run;
data rdata;
set dir.acitelli;
run;quit;
proc mixed covtest ;
CLASS  CoupleID partnum;
model Satisfaction_A =  Gender_A yearsmar  /s ddfm=SATTERTH notest;
repeated partnum /rcorr type=cs sub=Coupleid;
run;quit;

