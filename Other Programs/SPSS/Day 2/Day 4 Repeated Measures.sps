
Comment Wish to look at only days 3 through 9.

DATASET ACTIVATE DataSet2.
USE ALL.
COMPUTE filter_$=(Day>2 and Day<10).
VARIABLE LABELS filter_$ 'Day>2 and Day<10 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

Comment  Model.

MIXED AConflict BY GENDER DayOfWeek Day 
  /FIXED=DayOfWeek  GENDER  GENDER*DayOfWeek 
  /REPEATED=Day*GENDER | SUBJECT(DYADID) COVTYPE(UN)
  /EMMEANS=TABLES(DayOfWeek) COMPARE  ADJ(BONFERRONI)
  /EMMEANS=TABLES(GENDER).



Comment Bring back all days.

USE ALL.


