Comment Tension as a Moderator.

Comment Center Other Positivity and Tension..

COMPUTE COtherPos_A = OtherPos_A - 4.2635.
COMPUTE COtherPos_P = OtherPos_P - 4.2635.
COMPUTE CTension_A = Tension_A - 2.4307.
COMPUTE CTension_P = Tension_P - 2.4307.
Execute.

Comment Two Intercept Model.

MIXED
  Satisfaction_A  WITH COtherPos_A CTension_A COtherPos_P CTension_P Satisfaction_P By Gender
  /FIXED = Gender COtherPos_A*Gender  COtherPos_P*Gender CTension_A*Gender CTension_P*Gender
                COtherPos_A*CTension_A*Gender COtherPos_A*CTension_P*Gender COtherPos_P*CTension_A*Gender COtherPos_P*CTension_P*Gender| NOINT
  /PRINT = SOLUTION TESTCOV
  /REPEATED = Gender | SUBJECT(CoupleID) COVTYPE(CSH) .


Comment with Gender Interactions.

MIXED
  Satisfaction_A  WITH COtherPos_A CTension_A COtherPos_P CTension_P Satisfaction_P Gender_A
  /FIXED = COtherPos_A  COtherPos_P CTension_A CTension_P Gender_A
                COtherPos_A*Gender_A  COtherPos_P*Gender_A CTension_A*Gender_A CTension_P*Gender_A
                COtherPos_A*CTension_A COtherPos_A*CTension_P COtherPos_P*CTension_A COtherPos_P*CTension_P
                COtherPos_A*CTension_A*Gender_A COtherPos_A*CTension_P*Gender_A COtherPos_P*CTension_A*Gender_A COtherPos_P*CTension_P*Gender_A
 /PRINT = SOLUTION TESTCOV
  /REPEATED = Gender | SUBJECT(CoupleID) COVTYPE(CSH).

Comment Indistinguishable.

MIXED
  Satisfaction_A  WITH COtherPos_A CTension_A COtherPos_P CTension_P Satisfaction_P
  /FIXED = COtherPos_A  COtherPos_P CTension_A CTension_P 
                COtherPos_A*CTension_A COtherPos_A*CTension_P COtherPos_P*CTension_A COtherPos_P*CTension_P
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR) .

Comment testing simple slopes and making a figure.


COMPUTE High_COtherPos_A = COtherPos_A - .4982.
COMPUTE High_COtherPos_P = COtherPos_P - .4982.
COMPUTE Low_COtherPos_A = COtherPos_A + .4982.
COMPUTE Low_COtherPos_P = COtherPos_P + .4982.
Execute.

MIXED
  Satisfaction_A  WITH High_COtherPos_A CTension_A COtherPos_P CTension_P Satisfaction_P
  /FIXED = High_COtherPos_A  COtherPos_P CTension_A CTension_P 
                High_COtherPos_A*CTension_A High_COtherPos_A*CTension_P COtherPos_P*CTension_A COtherPos_P*CTension_P
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR) .

MIXED
  Satisfaction_A  WITH Low_COtherPos_A CTension_A COtherPos_P CTension_P Satisfaction_P
  /FIXED = Low_COtherPos_A  COtherPos_P CTension_A CTension_P 
                Low_COtherPos_A*CTension_A Low_COtherPos_A*CTension_P COtherPos_P*CTension_A COtherPos_P*CTension_P
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR) .

MIXED
  Satisfaction_A  WITH COtherPos_A CTension_A High_COtherPos_P CTension_P Satisfaction_P
  /FIXED = COtherPos_A  High_COtherPos_P CTension_A CTension_P 
                COtherPos_A*CTension_A COtherPos_A*CTension_P High_COtherPos_P*CTension_A High_COtherPos_P*CTension_P
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR) .

MIXED
  Satisfaction_A  WITH COtherPos_A CTension_A Low_COtherPos_P CTension_P Satisfaction_P
  /FIXED = COtherPos_A  Low_COtherPos_P CTension_A CTension_P 
                COtherPos_A*CTension_A COtherPos_A*CTension_P Low_COtherPos_P*CTension_A Low_COtherPos_P*CTension_P
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR) .

Comment interaction figure.

MIXED
  Satisfaction_A  WITH COtherPos_A CTension_A COtherPos_P CTension_P Satisfaction_P
  /FIXED = COtherPos_A  COtherPos_P CTension_A CTension_P 
                COtherPos_A*CTension_A COtherPos_A*CTension_P COtherPos_P*CTension_A COtherPos_P*CTension_P
  /PRINT = SOLUTION TESTCOV
  /EMMEANS=TABLES(overall) WITH(COtherPos_A=0.49842 CTension_A=0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_A=0.49842 CTension_A=-0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_A=-0.49842 CTension_A=0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_A=-0.49842 CTension_A=-0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_P=0.49842 CTension_A=0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_P=0.49842 CTension_A=-0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_P=-0.49842 CTension_A=0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_P=-0.49842 CTension_A=-0.687245)
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR) .



MIXED
  Satisfaction_A  WITH COtherPos_A CTension_A COtherPos_P CTension_P Satisfaction_P
  /FIXED = COtherPos_A  COtherPos_P CTension_A CTension_P 
                COtherPos_A*CTension_A COtherPos_A*CTension_P COtherPos_P*CTension_A COtherPos_P*CTension_P
  /PRINT = SOLUTION TESTCOV
  /EMMEANS=TABLES(overall) WITH(CTension_A=-0.686 COtherPos_A=-0.496 COtherPos_P=-0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_A=+0.686 COtherPos_A=-0.496 COtherPos_P=-0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_A=-0.686 COtherPos_A=-0.496 COtherPos_P=0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_A=+0.686 COtherPos_A=-0.496 COtherPos_P=0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_A=-0.686 COtherPos_A=0.496 COtherPos_P=-0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_A=0.686 COtherPos_A=0.496 COtherPos_P=-0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_A=-0.686 COtherPos_A=0.496 COtherPos_P=0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_A=0.686 COtherPos_A=0.496 COtherPos_P=0.496)
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR).

MIXED
  Satisfaction_A  WITH COtherPos_A CTension_A COtherPos_P CTension_P Satisfaction_P
  /FIXED = COtherPos_A  COtherPos_P CTension_A CTension_P 
                COtherPos_A*CTension_A COtherPos_A*CTension_P COtherPos_P*CTension_A COtherPos_P*CTension_P
  /PRINT = SOLUTION TESTCOV
  /EMMEANS=TABLES(overall) WITH(CTension_P=-0.686 COtherPos_A=-0.496 COtherPos_P=-0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_P=+0.686 COtherPos_A=-0.496 COtherPos_P=-0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_P=-0.686 COtherPos_A=-0.496 COtherPos_P=0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_P=+0.686 COtherPos_A=-0.496 COtherPos_P=0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_P=-0.686 COtherPos_A=0.496 COtherPos_P=-0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_P=0.686 COtherPos_A=0.496 COtherPos_P=-0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_P=-0.686 COtherPos_A=0.496 COtherPos_P=0.496)
  /EMMEANS=TABLES(overall) WITH(CTension_P=0.686 COtherPos_A=0.496 COtherPos_P=0.496)
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR).





MIXED
  Satisfaction_A  WITH COtherPos_A CTension_A COtherPos_P CTension_P Satisfaction_P
  /FIXED = COtherPos_A  COtherPos_P CTension_A CTension_P 
                COtherPos_A*CTension_A COtherPos_A*CTension_P COtherPos_P*CTension_A COtherPos_P*CTension_P
  /PRINT = SOLUTION TESTCOV
  /EMMEANS=TABLES(overall) WITH(COtherPos_A=0.49842 CTension_P=0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_A=0.49842 CTension_P=-0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_A=-0.49842 CTension_P=0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_A=-0.49842 CTension_P=-0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_P=0.49842 CTension_P=0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_P=0.49842 CTension_P=-0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_P=-0.49842 CTension_P=0.687245)
  /EMMEANS=TABLES(overall) WITH(COtherPos_P=-0.49842 CTension_P=-0.687245)
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR) .

Comment model simplification.

Compute AveOPxT =(COtherPos_A*CTension_A+ COtherPos_A*CTension_P+ COtherPos_P*CTension_A+ COtherPos_P*CTension_P)/4.

MIXED
  Satisfaction_A  WITH COtherPos_A CTension_A COtherPos_P CTension_P Satisfaction_P  AveOPxT 
  /FIXED = COtherPos_A  COtherPos_P CTension_A CTension_P AveOPxT
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR) .


Comment Recenter Tension -- plus one sd above the mean.

*Compute HCOtherPos_A = COtherPos_A - .4982. 
*Compute HCOtherPos_P = COtherPos_P - .4982.
*Compute LCOtherPos_A = COtherPos_A + .4982. 
*Compute LCOtherPos_P = COtherPos_P + .4982.
*Execute.
*Compute AveHOPxT =(HCOtherPos_A*CTension_A+ HCOtherPos_A*CTension_P+ HCOtherPos_P*CTension_A+ HCOtherPos_P*CTension_P)/4.
*Compute AveLOPxT =(LCOtherPos_A*CTension_A+ LCOtherPos_A*CTension_P+ LCOtherPos_P*CTension_A+ LCOtherPos_P*CTension_P)/4.
*Execute.
*MIXED
  Satisfaction_A  WITH HCOtherPos_A CTension_A HCOtherPos_P CTension_P Satisfaction_P  AveHOPxT 
  /FIXED = HCOtherPos_A  HCOtherPos_P CTension_A CTension_P AveHOPxT
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR) .
*MIXED
  Satisfaction_A  WITH LCOtherPos_A CTension_A LCOtherPos_P CTension_P Satisfaction_P  AveLOPxT 
  /FIXED = LCOtherPos_A  LCOtherPos_P CTension_A CTension_P AveLOPxT
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR) .


