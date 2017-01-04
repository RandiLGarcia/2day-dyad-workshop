Comment  Empty Model Satisfaction.

MIXED
  Satisfaction_A	
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(coupleid) COVTYPE(CSR) .

Comment APIM Model (Acitelli Pairwise; Satisfaction and Positivity of the Other).

MIXED
   Satisfaction_A WITH OtherPos_A OtherPos_P
  /FIXED = OtherPos_A OtherPos_P
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(coupleid) COVTYPE(CSR) .

Comment create standardized variables.

DESCRIPTIVES VARIABLES=OtherPos_A OtherPos_P Satisfaction_A
  /SAVE
  /STATISTICS=MEAN STDDEV MIN MAX.

Comment APIM: Standardized.

MIXED
   ZSatisfaction_A WITH ZOtherPos_A ZOtherPos_P
  /FIXED = ZOtherPos_A ZOtherPos_P
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(coupleid) COVTYPE(CSR) .

Comment APIM with Random Intercept.

MIXED Satisfaction_A WITH OtherPos_A OtherPos_P
  /FIXED=OtherPos_A OtherPos_P 
  /PRINT=SOLUTION TESTCOV
  /RANDOM=INTERCEPT | SUBJECT(CoupleID).


