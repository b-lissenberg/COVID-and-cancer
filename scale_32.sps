* Encoding: UTF-8.
** multivariable voor scale=32 (continue PRO).
USE ALL. 
COMPUTE filter_$=(scale=32).
FILTER BY filter_$.
EXECUTE.
CROSSTABS /TABLES=stage_1 BY groep BY Measurement /FORMAT=AVALUE TABLES /CELLS=COUNT /COUNT ROUND CELL.
MIXED outcome BY metingR groep stage_2cat
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep stage_2cat groep*stage_2cat metingR*stage_2cat metingR*groep*stage_2cat | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
* dan stage_1 geen effect modificator meer.
