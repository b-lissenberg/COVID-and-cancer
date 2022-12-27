* Encoding: windows-1252.
USE ALL.
COMPUTE filter_$=(Measurement=24).
VARIABLE LABELS filter_$ 'FILTER'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

** Table 1.
CROSSTABS /TABLES=gender edu01_cat fam04a_cat fam04b_cat tum_site stage_1 Treatment_dich comorbidity cidep07 cidep11_BL WHO_dich smok_daily alco_excess Work.24 statusM24 Residual Recurrence RecType SecPrimary M24intent BY groep
  /FORMAT=AVALUE TABLES /STATISTICS=CHISQ /CELLS=COUNT COLUMM /COUNT ROUND CELL.
T-TEST GROUPS=groep(1 2) /MISSING=ANALYSIS /VARIABLES=Age extrave iadl_tot klb_bmi /ES DISPLAY(FALSE) /CRITERIA=CI(.95).

** Supplemental Table 1.
CROSSTABS /TABLES=gender edu01_cat fam04a_cat fam04b_cat tum_site stage_1 Treatment_dich comorbidity cidep07 cidep11_BL WHO_dich smok_daily alco_excess Work BY incl
  /FORMAT=AVALUE TABLES /STATISTICS=CHISQ /CELLS=COUNT COLUMM /COUNT ROUND CELL.
T-TEST GROUPS=incl(0 1) /MISSING=ANALYSIS /VARIABLES=Age extrave iadl_tot klb_bmi /ES DISPLAY(FALSE) /CRITERIA=CI(.95).




