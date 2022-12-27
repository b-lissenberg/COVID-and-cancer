* Encoding: UTF-8.
** multivariable voor scale=5 (continue PRO).
USE ALL. 
COMPUTE filter_$=(scale=5).
FILTER BY filter_$.
EXECUTE.
CROSSTABS /TABLES=tum_site comorbidity BY groep BY Measurement /FORMAT=AVALUE TABLES /CELLS=COUNT /COUNT ROUND CELL.
* beide te kleine sample size voor stratificatie -> strata samenvoegen voor comorbidity?.
MIXED outcome BY metingR groep comorb_3cat
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep comorb_3cat groep*comorb_3cat metingR*comorb_3cat metingR*groep*comorb_3cat | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
* dan is comorbidity geen effect modificator meer.
* alleen tum_site 1, 2, 4.
USE ALL. 
COMPUTE filter_$=((scale=5)&((tum_site=1)|(tum_site=2)|(tum_site=4))).
FILTER BY filter_$.
EXECUTE.
MIXED outcome BY metingR groep tum_site
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep tum_site groep*tum_site metingR*tum_site metingR*groep*tum_site | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
* dan tum_site geen effect modificator meer.

