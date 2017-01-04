Comment Gender with Interactions. 
*Interaction Model.

MIXED
  Satisfaction_A WITH Gender_A OtherPos_A OtherPos_P
  /FIXED = Gender_A  OtherPos_A OtherPos_P Gender_A*OtherPos_A Gender_A*OtherPos_P   
  /PRINT = SOLUTION TESTCOV
  /REPEATED = Gender | SUBJECT(Coupleid) COVTYPE(CSH) .


Comment Two Intercept Model.

 
MIXED
  Satisfaction_A BY Gender WITH OtherPos_A OtherPos_P
  /FIXED = Gender  Gender*OtherPos_A Gender*OtherPos_P | NOINT
  /PRINT = SOLUTION TESTCOV
  /TEST 'Main Effect for Gender' Gender  -1 1 
  /TEST 'Interaction Effect for Actor*Gender' Gender*OtherPos_A  -1 1  
  /TEST 'Interaction Effect for Partner*Gender' Gender*OtherPos_P  -1 1 
  /TEST 'Average Intercept' Gender  .5 .5 
  /TEST 'Average Actor Effect' Gender*OtherPos_A  .5 .5  
  /TEST 'Average Partner Effect' Gender*OtherPos_P  .5 .5 
  /REPEATED = Gender | SUBJECT(Coupleid) COVTYPE(CSH) .

Comment  Empty Model Satisfaction.

MIXED
  Satisfaction_A	BY Gender
  /FIXED = Gender | NOINT
  /PRINT = SOLUTION TESTCOV
  /REPEATED = Gender | SUBJECT(coupleid) COVTYPE(CSH) .

Comment  Standardized Variables.


MIXED
  ZSatisfaction_A BY Gender WITH ZOtherPos_A ZOtherPos_P
  /FIXED = Gender  Gender*ZOtherPos_A Gender*ZOtherPos_P | NOINT
  /PRINT = SOLUTION TESTCOV
  /REPEATED = Gender | SUBJECT(Coupleid) COVTYPE(CSH) .

