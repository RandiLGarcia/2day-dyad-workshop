Comment Test of Specialized Models.

Comment Base Model.


MIXED
  Satisfaction_A WITH OtherPos_A OtherPos_P
  /FIXED = OtherPos_A OtherPos_P 
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(coupleid) COVTYPE(CS) .

Comment Model with Specialized Terms.


COMPUTE Sum = OtherPos_A+OtherPos_P .
COMPUTE Diff = OtherPos_A-OtherPos_P .
EXECUTE .

MIXED
  Satisfaction_A WITH sum diff
  /FIXED =   Sum Diff 
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(coupleid) COVTYPE(CS) .

Comment Test of Gender Interactions.

MIXED
  Satisfaction_A WITH sum diff Gender_A
  /FIXED =   Sum Diff Gender_A Gender_A*Sum Gender_A*Diff
  /PRINT = SOLUTION TESTCOV
  /REPEATED = Gender_A | SUBJECT(coupleid) COVTYPE(CSH) .


