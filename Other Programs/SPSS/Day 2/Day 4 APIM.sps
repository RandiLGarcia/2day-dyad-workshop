Comment APIM run. 

MIXED
  ASATISF WITH man woman ACONFLICTc PCONFLICTc BY GENDER
  /FIXED = Gender  ACONFLICTC*GENDER PCONFLICTc*GENDER | NOINT
  /PRINT = SOLUTION TESTCOV 
 /TEST 'Main Effect for Gender' Gender  -1 1 
 /TEST 'Interaction Effect for Actor Satisfaction by Gender' Gender*ACONFLICTC -1 1  
 /TEST 'Interaction Effect for Partner Satisfaction by Gender  '  Gender*PCONFLICTc -1 1 
  /RANDOM man woman man*ACONFLICTC woman*ACONFLICTc man*PCONFLICTC woman*PCONFLICTc | SUBJECT(DYADID) COVTYPE(UNR) 
  /REPEATED = Person | SUBJECT(DYADID*day) COVTYPE(CSH) .


