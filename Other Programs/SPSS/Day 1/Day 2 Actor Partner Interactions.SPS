Comment Center Variables.

COMPUTE COtherPos_A = OtherPos_A - 4.2635.
COMPUTE COtherPos_P = OtherPos_P - 4.2635.
EXECUTE .

Comment  Compute discrepancy (make sure variables are centered first).

COMPUTE Spouse_Disc = ABS(COtherPos_P-COtherPos_A) .
EXECUTE .

Comment Actor-Partner Interaction: Product Term.

Mixed Satisfaction_A  WITH COtherPos_A COtherPos_P  Gender_A
  /FIXED = COtherPos_A COtherPos_P  COtherPos_A*COtherPos_P 
  /PRINT = SOLUTION TESTCOV
  /EMMEANS=TABLES(overall) WITH(COtherPos_A=0.49842 COtherPos_P=0.49842)
  /EMMEANS=TABLES(overall) WITH(COtherPos_A=0.49842 COtherPos_P=-0.49842)
  /EMMEANS=TABLES(overall) WITH(COtherPos_A=-0.49842 cOtherPos_P=0.49842)
  /EMMEANS=TABLES(overall) WITH(COtherPos_A=-0.49842 COtherPos_P=-0.49842)
 /REPEATED=Partnum | SUBJECT(CoupleID) COVTYPE(CSR).

Comment Actor-Partner Interaction: Discrepancy.

MIXED
  Satisfaction_A  WITH COtherPos_A COtherPos_P  Gender_A Spouse_Disc
  /FIXED = COtherPos_A COtherPos_P  Spouse_Disc 
  /PRINT = SOLUTION TESTCOV
  /REPEATED = Partnum | SUBJECT(coupleid) COVTYPE(CSR) .


Comment Actor-Partner Interaction: Product Term.with Gender Moderation.

MIXED
  Satisfaction_A  WITH COtherPos_A COtherPos_P  Gender_A
  /FIXED = COtherPos_A COtherPos_P  COtherPos_A*COtherPos_P Gender_A
    COtherPos_A*Gender_A COtherPos_P*Gender_A  COtherPos_A*COtherPos_P*Gender_A
  /PRINT = SOLUTION TESTCOV
  /REPEATED = Gender_A | SUBJECT(coupleid) COVTYPE(CSR) .

Comment Actor-Partner Interaction: Discrepancy with Gender Moderation.

MIXED
  Satisfaction_A  WITH COtherPos_A COtherPos_P  Gender_A Spouse_Disc
  /FIXED = COtherPos_A COtherPos_P  Spouse_Disc Gender_A
	COtherPos_A*Gender_A COtherPos_P*Gender_A  Spouse_Disc*Gender_A
  /PRINT = SOLUTION TESTCOV
  /REPEATED = Gender_A | SUBJECT(coupleid) COVTYPE(CSR).

Comment OPTIONAL Seeing how the Actor-Partner Interaction (Product Term) weakens
 when squared terms are entered.

Mixed Satisfaction_A  WITH COtherPos_A COtherPos_P  Gender_A
  /FIXED = COtherPos_A COtherPos_P  
 COtherPos_A*COtherPos_A COtherPos_P*COtherPos_P
 COtherPos_A*COtherPos_P 
  /PRINT = SOLUTION TESTCOV
 /REPEATED=Partnum | SUBJECT(CoupleID) COVTYPE(CSR).



