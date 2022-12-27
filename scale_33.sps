﻿* Encoding: UTF-8.
** multivariable voor scale=33 (continue PRO).
USE ALL. 
COMPUTE filter_$=(scale=33).
FILTER BY filter_$.
EXECUTE.
CROSSTABS /TABLES=fam04a_cat fam04b_cat cidep07.24 smok_daily.24 statusM24 BY groep BY Measurement /FORMAT=AVALUE TABLES /CELLS=COUNT /COUNT ROUND CELL.
* cidep07.24 en smok_daily.24 te kleine sample sizes voor stratificatie.

*  univariaat sterkte modificator: fam04b_cat.
SORT CASES BY fam04b_cat.
SPLIT FILE LAYERED BY fam04b_cat.
MIXED outcome BY metingR groep WITH Age
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep Age groep*Age metingR*Age metingR*groep*Age | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep gender
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep gender groep*gender metingR*gender metingR*groep*gender | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep edu01_cat
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep edu01_cat groep*edu01_cat metingR*edu01_cat metingR*groep*edu01_cat | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep fam04a_cat
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep fam04a_cat groep*fam04a_cat metingR*fam04a_cat metingR*groep*fam04a_cat | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep WITH extrave
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep extrave groep*extrave metingR*extrave metingR*groep*extrave | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep tum_site
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep tum_site groep*tum_site metingR*tum_site metingR*groep*tum_site | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep stage_1
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep stage_1 groep*stage_1 metingR*stage_1 metingR*groep*stage_1 | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep Treatment
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep Treatment groep*Treatment metingR*Treatment metingR*groep*Treatment | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep treatment_dich
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep treatment_dich groep*treatment_dich metingR*treatment_dich metingR*groep*treatment_dich | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep comorbidity
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep comorbidity groep*comorbidity metingR*comorbidity metingR*groep*comorbidity | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep WHO_dich
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep WHO_dich groep*WHO_dich metingR*WHO_dich metingR*groep*WHO_dich | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep cidep07.24
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep cidep07.24 groep*cidep07.24 metingR*cidep07.24 metingR*groep*cidep07.24 | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep cidep11.24
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep cidep11.24 groep*cidep11.24 metingR*cidep11.24 metingR*groep*cidep11.24 | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep WITH iadl_tot.24
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep iadl_tot.24 groep*iadl_tot.24 metingR*iadl_tot.24 metingR*groep*iadl_tot.24 | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep smok_daily.24
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep smok_daily.24 groep*smok_daily.24 metingR*smok_daily.24 metingR*groep*smok_daily.24 | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep alco_excess.24
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep alco_excess.24 groep*alco_excess.24 metingR*alco_excess.24 metingR*groep*alco_excess.24 | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep WITH klb_bmi.24
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep klb_bmi.24 groep*klb_bmi.24 metingR*klb_bmi.24 metingR*groep*klb_bmi.24 | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep statusM24
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep statusM24 groep*statusM24 metingR*statusM24 metingR*groep*statusM24 | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .
MIXED outcome BY metingR groep M24intent
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=metingR groep metingR*groep M24intent groep*M24intent metingR*M24intent metingR*groep*M24intent | SSTYPE(3) /METHOD=ML /PRINT=SOLUTION /RANDOM=INTERCEPT | SUBJECT(pident) COVTYPE(CS) .

* not married: cidep07.24 (p<0.001), cidep11.24 (p=0.028).
* married: tum_site (p=0.005).
* sample sizes voor deze dubbele stratificatie?.
CROSSTABS /TABLES=tum_site cidep07.24 cidep11.24 BY groep BY Measurement /FORMAT=AVALUE TABLES /CELLS=COUNT /COUNT ROUND CELL.
* allen kleine sample size voor stratificatie.
