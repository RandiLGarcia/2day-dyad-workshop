
libname dir 'C:\Documents and Settings\dkenny\My Documents\My Dropbox\Projects\Dyad Datic\SAS\';
*libname dir 'C:\Users\Kenny\Dropbox\Projects\Dyad Datic\SAS\';
run;
data rdata;
set dir.acitelli;
Sum =   OtherPos_A + OtherPos_P   ;
Diff =  OtherPos_A - OtherPos_P ;
Disc =  ABS(OtherPos_A - OtherPos_P) ;
OtherPos_AC =   OtherPos_A - 4.2635; 
OtherPos_PC =   OtherPos_P - 4.2635; 

run;quit;

* Indistinguishable;

proc mixed covtest ;
CLASS  CoupleID partnum;
model Satisfaction_A =  OtherPos_A  OtherPos_P   /s ddfm=SATTERTH notest;
repeated partnum /rcorr type=cs sub=Coupleid;
run;quit;

* Distinguishable: Interactions;

proc mixed covtest ;
CLASS  CoupleID Gender_P;
model Satisfaction_A =  OtherPos_A  OtherPos_P Gender_A  Gender_A*OtherPos_A  Gender_A*OtherPos_P /s ddfm=SATTERTH notest;
repeated Gender_P /rcorr type=csh sub=Coupleid;
run;quit;

* Distinguishable: Two Intercept;

proc mixed covtest ;
CLASS  CoupleID Gender_A;
model Satisfaction_A =  Gender_A  Gender_A*OtherPos_A  Gender_A*OtherPos_P /NOINT s ddfm=SATTERTH notest;
repeated Gender_A /rcorr type=csh sub=Coupleid;
run;quit;


* Test of Indistinguishablity;
* Indistinguishable;

proc mixed covtest method=ml ;
CLASS  CoupleID partnum;
model Satisfaction_A =  OtherPos_A  OtherPos_P   /s ddfm=SATTERTH notest;
repeated partnum /rcorr type=cs sub=Coupleid;
run;quit;

* Distinguishable;

proc mixed covtest  method=ml ;
CLASS  CoupleID Gender_P;
model Satisfaction_A =  OtherPos_A  OtherPos_P Gender_A  Gender_A*OtherPos_A  Gender_A*OtherPos_P /s ddfm=SATTERTH notest;
repeated Gender_P /rcorr type=csh sub=Coupleid;
run;quit;

* Indistinguishable: Sum and Diff;

proc mixed covtest ;
CLASS  CoupleID partnum;
model Satisfaction_A =  Sum Diff    /s ddfm=SATTERTH notest;
repeated partnum /rcorr type=cs sub=Coupleid;
* Distinguishable: Interactions Sum and Diff;

proc mixed covtest ;
CLASS  CoupleID Gender_P;
model Satisfaction_A =  Sum Diff Gender_A  Gender_A*Sum  Gender_A*Diff /s ddfm=SATTERTH notest;
repeated Gender_P /rcorr type=csh sub=Coupleid;
run;quit;

* Actor Partner Interacton -- Product;

* Indistinguishable;

proc mixed covtest ;
CLASS  CoupleID partnum;
model Satisfaction_A =  OtherPos_AC  OtherPos_PC OtherPos_AC*OtherPos_PC  /s ddfm=SATTERTH notest;
repeated partnum /rcorr type=cs sub=Coupleid;
run;quit;

* Distinguishable: Interactions;

proc mixed covtest ;
CLASS  CoupleID Gender_P;
model Satisfaction_A =  OtherPos_AC  OtherPos_PC OtherPos_AC*OtherPos_PC
  Gender_A  Gender_A*OtherPos_AC  Gender_A*OtherPos_PC Gender_A*OtherPos_AC*OtherPos_PC
  /s ddfm=SATTERTH notest;
repeated Gender_P /rcorr type=csh sub=Coupleid;
run;quit;

* Actor Partner Interacton -- Discrepancy;

* Indistinguishable;

proc mixed covtest ;
CLASS  CoupleID partnum;
model Satisfaction_A =  OtherPos_A  OtherPos_P Disc  /s ddfm=SATTERTH notest;
repeated partnum /rcorr type=cs sub=Coupleid;
run;quit;

* Distinguishable: Interactions;

proc mixed covtest ;
CLASS  CoupleID Gender_P;
model Satisfaction_A =  OtherPos_A  OtherPos_P Disc
  Gender_A  Gender_A*OtherPos_A  Gender_A*OtherPos_P Gender_A*Disc
/s ddfm=SATTERTH notest;
repeated Gender_P /rcorr type=csh sub=Coupleid;
run;quit;

