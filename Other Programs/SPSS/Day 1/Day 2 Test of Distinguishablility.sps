Comment Indistinguishable Model. 

MIXED
  Satisfaction_A WITH OtherPos_A OtherPos_P
  /FIXED = OtherPos_A OtherPos_P 
  /METHOD ML
  /PRINT = SOLUTION TESTCOV
  /REPEATED = Partnum | SUBJECT(Coupleid) COVTYPE(CSR) .


Comment Distinguishable Model. 


MIXED
  Satisfaction_A WITH Gender_A OtherPos_A OtherPos_P
  /FIXED = Gender_A  OtherPos_A OtherPos_P Gender_A*OtherPos_A Gender_A*OtherPos_P   
  /METHOD ML
  /PRINT = SOLUTION TESTCOV
  /REPEATED = Gender | SUBJECT(Coupleid) COVTYPE(CSH) .


