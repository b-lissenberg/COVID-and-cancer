* Encoding: UTF-8.
** multivariable voor scale=34 (continue PRO).
USE ALL. 
COMPUTE filter_$=(scale=34).
FILTER BY filter_$.
EXECUTE.
CROSSTABS /TABLES=comorbidity BY groep BY Measurement /FORMAT=AVALUE TABLES /CELLS=COUNT /COUNT ROUND CELL.
MIXED outcome BY metingR groep comorb_3cat
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep comorb_3cat groep*comorb_3cat metingR*comorb_3cat metingR*groep*comorb_3cat | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
* comorbidity geen effect modificator meer.

