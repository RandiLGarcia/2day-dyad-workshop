data onerandom;
input parm row col value;
datalines;
1 1 1 1
1 2 2 1
2 1 2 1
;
*One random effect model for indistinguishable dyads;
*LIN(1) is the variance for the random term;
*LIN(2) is the covariance of the random effect across persons;
data tworandom;
input parm row col value;
datalines;
1 1 1 1
1 3 3 1
2 2 2 1
2 4 4 1
3 1 2 1
3 3 4 1
4 1 3 1
5 2 4 1
6 1 4 1
6 2 3 1
;
*Two random effects model for indistinguishable dyads;
*LIN(1) is the variance for the first random term;
*LIN(2) is the variance for the second random term;
*LIN(3) is the covariance of the two terms for same person;
*LIN(4) is the covariance across persons of the first random effect;
*LIN(5) is the covariance across persons of the second random effect;
*LIN(6) is the covariance of the two terms for different person;

data threerandom;
input parm row col value;
datalines;
1 1 1 1
1 4 4 1
2 2 2 1
2 5 5 1
3 3 3 1
3 6 6 1
4 1 4 1
5 2 5 1
6 3 6 1
7 1 2 1
7 4 5 1
8 1 3 1
8 4 6 1
9 2 3 1
9 5 6 1
10 1 5 1
10 2 4 1
11 1 6 1
11 3 4 1
12 2 6 1
12 3 5 1
;

*Three random effects for each person for indistinguishable dyads;

*LIN(1) is variance 1;
*LIN(2) is variance 2;
*LIN(3) is variance 3;
*LIN(4) is the covariance across persons of random effect 1;
*LIN(5) is the covariance across persons of random effect 2;
*LIN(6) is the covariance across persons of random effect 3;
*LIN(7) is the covariance within persons of effects 1 and 2;
*LIN(8) is the covariance within person of effects 1 and 3;
*LIN(9) is the covariance within person of effects 2 and 3;
*LIN(10)is the covariance across persons of effects 1 and 2;
*LIN(11)is the covariance across persons of effects 1 and 3;
*LIN(12)is the covariance across persons of effects 2 and 3;

