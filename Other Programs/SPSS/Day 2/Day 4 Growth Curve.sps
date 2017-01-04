comment creating the two intercept variables for man and woman. 

RECODE
  GENDER
  (1=1)  (-1=0)  INTO  man.
EXECUTE .

RECODE
  gender
  (1=0)  (-1=1)  INTO  woman.
EXECUTE .

*****THE ANALYSES START HERE*****************************


USE ALL.
COMPUTE filter_$=(man=1).
VARIABLE LABEL filter_$ 'man=1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMAT filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.


COMMENT Growth Curve MODEL For Males. 

MIXED
  ASATISF  WITH TIME
  /FIXED = INTERCEPT TIME 
  /PRINT = SOLUTION TESTCOV   
  /CRITERIA = MXSTEP(65) 
  /RANDOM INTERCEPT TIME  | SUBJECT(DYADID) COVTYPE(UNR) .

COMMENT With a covariate.

MIXED
  ASATISF  WITH TIME  CAAvoid
  /FIXED = INTERCEPT TIME CAAvoid TIME*CAAvoid
  /PRINT = SOLUTION TESTCOV   
  /CRITERIA = MXSTEP(65) 
  /RANDOM INTERCEPT TIME  | SUBJECT(DYADID) COVTYPE(UNR).


Comment Use All the Data.

FILTER OFF.
USE ALL.
EXECUTE.

COMMENT Dyadic Growth Curve MODEL 1. 

MIXED
  ASATISF  WITH MAN WOMAN TIME BY GENDER
  /FIXED = GENDER TIME*GENDER | NOINT 
  /PRINT = SOLUTION TESTCOV   
  /CRITERIA = MXSTEP(25) 
 /TEST 'Main Effect for Gender' Gender -1 1
 /TEST 'Interaction Effect for Time by Gender' Gender*Time -1 1
  /RANDOM MAN WOMAN TIME*MAN TIME*WOMAN  | SUBJECT(DYADID) COVTYPE(UNR) 
  /REPEATED = PERSON | SUBJECT(DYADID*DAY) COVTYPE(CSH) .

string GenderString (A8).
IF (gender = -1) GenderString = 'women'.
IF (gender = 1) GenderString = 'men'.
execute.

MIXED
  ASATISF  WITH MAN WOMAN TIME BY GenderString
  /FIXED = GenderString TIME*GenderString | NOINT 
  /PRINT = SOLUTION TESTCOV   
  /CRITERIA = MXSTEP(25) 
 /TEST 'Main Effect for Gender' GenderString -1 1
 /TEST 'Interaction Effect for Time by Gender' GenderString*Time -1 1
  /RANDOM GenderString TIME*GenderString | SUBJECT(DYADID) COVTYPE(UN) 
  /REPEATED = GenderString | SUBJECT(DYADID*DAY) COVTYPE(CSH) .

COMMENT TWO INTERCEPT MODEL WITH ATTACHMENT AVOIDANCE AS THE MODERATOR. 

MIXED
  ASATISF  WITH MAN WOMAN TIME CAAvoid CPAvoid BY GENDER
  /FIXED = GENDER TIME*GENDER CAAvoid*GENDER CPAvoid*GENDER
CAAvoid*GENDER*TIME CPAvoid*GENDER*TIME| NOINT 
 /TEST 'Main Effect for Gender' Gender -1 1
 /TEST 'Interaction Effect for Gender by Time' Gender*Time -1 1
 /TEST 'Interaction of Gender with Actor Avoidance' CAAvoid*GENDER -1 1 
 /TEST 'Interaction of Gender with Partner Avoidance' CPAvoid*GENDER -1 1 
 /TEST 'Interaction of Gender with Actor Avoidance with Time' CAAvoid*GENDER*Time -1 1 
 /TEST 'Interaction of Gender with Partner Avoidance with Time' CPAvoid*GENDER*Time -1 1
 /TEST 'Intercept' Gender .5 .5
 /TEST 'Time Main Effect' Gender*Time .5 .5
 /TEST 'Actor Avoidance Effect' CAAvoid*GENDER .5 .5
 /TEST 'Partner Avoidance Effect' CPAvoid*GENDER .5 .5
 /TEST 'Interaction of Actor Avoidance with Time' CAAvoid*GENDER*Time .5 .5
 /TEST 'Interaction of Partner Avoidance with Time' CPAvoid*GENDER*Time .5 .5
  /EMMEANS=TABLES(overall) WITH (CPAvoid=1.002 Time =6.5 CAAvoid=.00)
  /EMMEANS=TABLES(overall) WITH (CPAvoid=1.002 Time =-6.5 CAAvoid=.00)
  /EMMEANS=TABLES(overall) WITH (CPAvoid=-1.002 Time =6.5 CAAvoid=.00)
  /EMMEANS=TABLES(overall) WITH (CPAvoid=-1.002 Time =-6.5 CAAvoid=.00)
  /PRINT = SOLUTION TESTCOV   
  /CRITERIA = MXSTEP(25) 
  /RANDOM MAN WOMAN TIME*MAN TIME*WOMAN  | SUBJECT(DYADID) COVTYPE(UNR) 
  /REPEATED = PERSON | SUBJECT(DYADID*DAY) COVTYPE(CSH) .


COMMENT GENDER AS A MODERATOR WITH ATTACHMENT AVOIDANCE. 

MIXED
  ASATISF  WITH MAN WOMAN TIME gender CAAvoid CPAvoid 
  /FIXED = TIME gender TIME*gender CAAvoid CPAvoid TIME*CAAvoid  TIME*CPAvoid 
 gender*CAAvoid  gender*CPAvoid TIME*gender*CAAvoid  TIME*gender*CPAvoid  
  /PRINT = SOLUTION TESTCOV   
  /CRITERIA = MXSTEP(25) 
  /RANDOM MAN WOMAN TIME*MAN TIME*WOMAN  | SUBJECT(DYADID) COVTYPE(UNR) 
  /REPEATED = PERSON | SUBJECT(DYADID*DAY) COVTYPE(CSH) .


COMMENT TREATING GENDER AS A MODERATOR. 

MIXED
  ASATISF  WITH MAN WOMAN TIME gender 
  /FIXED = TIME gender TIME*gender  
  /PRINT = SOLUTION TESTCOV   
  /CRITERIA = MXSTEP(25) 
  /RANDOM MAN WOMAN TIME*MAN TIME*WOMAN  | SUBJECT(DYADID) COVTYPE(UNR) 
  /REPEATED = Person | SUBJECT(DYADID*DAY) COVTYPE(CSH) .







