
*libname dir 'C:\Documents and Settings\dkenny\My Documents\My Dropbox\Projects\Dyad Datic\SAS\';
libname dir 'C:\Users\Kenny\Dropbox\Projects\Dyad Datic\SAS\';
run;
data rdata;
set dir.acitelli;

CSelfPos_A = SelfPos_A - 4.1865;
CSelfPos_P = SelfPos_P - 4.1865; 

run;quit;
*MEDIATION;

* Distinguishable: Two Intercept;
* Step 1;

proc mixed covtest ;
CLASS  CoupleID Gender_A;
model Satisfaction_A =  Gender_A  Gender_A*OtherPos_A  Gender_A*OtherPos_P /NOINT s ddfm=SATTERTH notest;
repeated Gender_A /rcorr type=csh sub=Coupleid;
run;quit;

* Step 2;

proc mixed covtest ;
CLASS  CoupleID Gender_A;
model Tension_A =  Gender_A  Gender_A*OtherPos_A  Gender_A*OtherPos_P /NOINT s ddfm=SATTERTH notest;
repeated Gender_A /rcorr type=csh sub=Coupleid;
run;quit;

* Step 3 and 4;

proc mixed covtest ;
CLASS  CoupleID Gender_A;
model Satisfaction_A =  Gender_A  Gender_A*OtherPos_A  Gender_A*OtherPos_P 
                        Gender_A*Tension_A  Gender_A*Tension_P /NOINT s ddfm=SATTERTH notest;
repeated Gender_A /rcorr type=csh sub=Coupleid;
run;quit;


* Partially Indistinguishable;
* Step 1;


proc mixed covtest ;
CLASS  CoupleID Gender_A;
model Satisfaction_A = Gender_A  OtherPos_A  OtherPos_P   /s ddfm=SATTERTH notest;
repeated Gender_A /rcorr type=csh sub=Coupleid;
run;quit;

* Step 2;


proc mixed covtest ;
CLASS  CoupleID Gender_A;
model Tension_A  = Gender_A OtherPos_A  OtherPos_P   /s ddfm=SATTERTH notest;
repeated Gender_A /rcorr type=csh sub=Coupleid;
run;quit;

* Steps 3 and 4;

proc mixed covtest ;
CLASS  CoupleID Gender_A;
model Satisfaction_A = Gender_A OtherPos_A  OtherPos_P Tension_A  Tension_P  /s ddfm=SATTERTH notest;
repeated Gender_A /rcorr type=csh sub=Coupleid;
run;quit;



* Totally Indistinguishable;
* Step 1;


proc mixed covtest ;
CLASS  CoupleID partnum;
model Satisfaction_A =  OtherPos_A  OtherPos_P   /s ddfm=SATTERTH notest;
repeated partnum /rcorr type=cs sub=Coupleid;
run;quit;

* Step 2;


proc mixed covtest ;
CLASS  CoupleID partnum;
model Tension_A  =  OtherPos_A  OtherPos_P   /s ddfm=SATTERTH notest;
repeated partnum /rcorr type=cs sub=Coupleid;
run;quit;

* Steps 3 and 4;

proc mixed covtest ;
CLASS  CoupleID partnum;
model Satisfaction_A =  OtherPos_A  OtherPos_P Tension_A  Tension_P  /s ddfm=SATTERTH notest;
repeated partnum /rcorr type=cs sub=Coupleid;
run;quit;

*MODERATION;

* Totally Indistinguishable;

proc mixed covtest ;
CLASS  CoupleID partnum;
model Satisfaction_A =  CSelfPos_A  CSelfPos_P SimHob_A
                        CSelfPos_A*SimHob_A  CSelfPos_P*SimHob_A /s ddfm=SATTERTH notest;
repeated partnum /rcorr type=cs sub=Coupleid;
run;quit;

* With Gender Interactions;

proc mixed covtest ;
CLASS  CoupleID Gender_P;
model Satisfaction_A =  Gender_A CSelfPos_A CSelfPos_P Gender_A*CSelfPos_A  Gender_A*CSelfPos_P 
SimHob_A CSelfPos_A*SimHob_A  CSelfPos_P*SimHob_A Gender_A*SimHob_A Gender_A*CSelfPos_A*SimHob_A  Gender_A*CSelfPos_P*SimHob_A 
				/NOINT s ddfm=SATTERTH notest;
repeated Gender_P /rcorr type=csh sub=Coupleid;
run;quit;


* Two Intercept Model;

proc mixed covtest ;
CLASS  CoupleID Gender_A;
model Satisfaction_A =  Gender_A  Gender_A*CSelfPos_A  Gender_A*CSelfPos_P 
                        Gender_A*SimHob_A Gender_A*CSelfPos_A*SimHob_A  Gender_A*CSelfPos_P*SimHob_A 
				/NOINT s ddfm=SATTERTH notest;
repeated Gender_A /rcorr type=csh sub=Coupleid;
run;quit;
