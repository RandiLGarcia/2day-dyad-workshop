Comment Mediation: Distinguishable.

Comment Mediation: Distinguishable Two Intercept.

Comment Step 1.

MIXED
  Satisfaction_A  BY Gender_A  WITH OtherPos_A Tension_A OtherPos_P Tension_P Satisfaction_P
  /FIXED = Gender_A Gender_A*OtherPos_A Gender_A*OtherPos_P  | NOINT
  /PRINT = SOLUTION TESTCOV
  /REPEATED = Gender_A | SUBJECT(CoupleID) COVTYPE(CSH) .

Comment Step 2.

MIXED
  Tension_A  BY Gender_A  WITH OtherPos_A  OtherPos_P Tension_P Satisfaction_A Satisfaction_P
  /FIXED = Gender_A Gender_A*OtherPos_A Gender_A*OtherPos_P | NOINT
  /PRINT = SOLUTION TESTCOV
  /REPEATED = Gender_A | SUBJECT(CoupleID) COVTYPE(CSH) .

Comment Steps 3 and 4.

MIXED
  Satisfaction_A  BY Gender_A  WITH OtherPos_A Tension_A OtherPos_P Tension_P Satisfaction_P
  /FIXED = Gender_A Gender_A*Tension_A Gender_A*Tension_P
         Gender_A*OtherPos_A Gender_A*OtherPos_P  | NOINT
  /PRINT = SOLUTION TESTCOV
  /REPEATED = Gender_A | SUBJECT(CoupleID) COVTYPE(CSH) .



Comment Mediation: Completely Indistinguishable.

Comment Step 1.

MIXED
  Satisfaction_A  WITH OtherPos_A Tension_A OtherPos_P Tension_P Satisfaction_P
  /FIXED = OtherPos_A OtherPos_P  
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR) .

Comment Step 2.

MIXED
  Tension_A  WITH OtherPos_A  OtherPos_P Tension_P Satisfaction_A Satisfaction_P
  /FIXED = OtherPos_A OtherPos_P  
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR) .

Comment Steps 3 and 4.

MIXED
  Satisfaction_A  WITH OtherPos_A Tension_A OtherPos_P Tension_P Satisfaction_P
  /FIXED = Tension_A  Tension_P OtherPos_A OtherPos_P  
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSR) .





COMPUTE Sum_OP=OtherPos_A+OtherPos_P.
COMPUTE Diff_OP=OtherPos_A-OtherPos_P.
COMPUTE Sum_Ten=Tension_A+Tension_P.
COMPUTE Diff_Ten=Tension_A-Tension_P.
EXECUTE.

Comment Step 1.

MIXED Satisfaction_A BY Gender_A WITH Sum_OP Diff_OP
  /FIXED=Sum_OP Diff_OP Gender_A
  /PRINT=SOLUTION TESTCOV
  /REPEATED=Gender_A | SUBJECT(CoupleID) COVTYPE(CSH).

Comment Step 2.

MIXED Tension_A BY Gender_A WITH Sum_OP Diff_OP
  /FIXED= Sum_OP Diff_OP Gender_A 
  /PRINT=SOLUTION TESTCOV
  /REPEATED=Gender_A | SUBJECT(CoupleID) COVTYPE(CSH).

Comment Steps 3 and 4.

MIXED
  Satisfaction_A BY Gender_A WITH Sum_OP Diff_OP Sum_Ten  Diff_Ten
  /FIXED = Sum_OP  Diff_OP Sum_Ten Diff_Ten
  /PRINT = SOLUTION TESTCOV
  /REPEATED = partnum | SUBJECT(CoupleID) COVTYPE(CSH) .








