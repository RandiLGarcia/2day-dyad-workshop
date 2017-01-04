Comment Indistinguishable Dyads.
Comment Use Pairwise Dataset.


Comment Actor Effect Partial r Effect Size.

PARTIAL CORR
  /VARIABLES=OtherPos_A Satisfaction_A BY OtherPos_P
  /SIGNIFICANCE=TWOTAIL
  /MISSING=LISTWISE.

Comment Partner Effect Partial r Effect Size.

PARTIAL CORR
  /VARIABLES=OtherPos_P Satisfaction_A BY OtherPos_A
  /SIGNIFICANCE=TWOTAIL
  /MISSING=LISTWISE.

Comment Distinguishable Dyads.
Comment Use Dyad Dataset.


Comment Actor Effect for Husbands Partial r Effect Size.

PARTIAL CORR
  /VARIABLES=OtherPos_H Satisfaction_H BY OtherPos_W
  /SIGNIFICANCE=TWOTAIL
  /MISSING=LISTWISE.


Comment Actor Effect for Wives Partial r Effect Size.


PARTIAL CORR
  /VARIABLES=OtherPos_W Satisfaction_W BY OtherPos_H
  /SIGNIFICANCE=TWOTAIL
  /MISSING=LISTWISE.

Comment Partner Effect for Husbands Partial r Effect Size.

PARTIAL CORR
  /VARIABLES=OtherPos_W Satisfaction_H BY OtherPos_H
  /SIGNIFICANCE=TWOTAIL
  /MISSING=LISTWISE.

Comment Partner Effect for Wives Partial r Effect Size.

PARTIAL CORR
  /VARIABLES=OtherPos_H Satisfaction_W BY OtherPos_W
  /SIGNIFICANCE=TWOTAIL
  /MISSING=LISTWISE.

