* Encoding: windows-1252.
VARSTOCASES
  /MAKE outcome FROM eortcc_gql eortcc_pf eortcc_rf eortcc_ef eortcc_cf eortcc_sf eortcc_fa eortcc_nv eortcc_pa eortcc_dy eortcc_sl eortcc_ap eortcc_co eortcc_di eortcc_fi eortcc_som 
    hads_dep hads_anx hads_total lone_emo lone_soc lone_tot lone_cat cws_tot pase_leisure pase_household pase_work pase_total pase_total_group
    eortchn_pa eortchn_sw eortchn_se eortchn_sc eortchn_so eortchn_sp eortchn_sx eortchn_te eortchn_om eortchn_dr eortchn_ss eortchn_co eortchn_fi eortchn_pk eortchn_nu eortchn_fe eortchn_wl eortchn_wg 
  /INDEX=scale(47) 
  /KEEP=pident center Measurement groep Corona Age gender edu01_cat fam04a_cat fam04b_cat extrave 
    tum_site stage_1 Treatment Treatment_dich comorbidity cidep07 cidep11 cidep11_BL cidep12 WHO_dich iadl_tot 
    smok_daily alco_excess klb_bmi statusM24 Residual Recurrence RecType SecPrimary M24intent
  /NULL=KEEP.
value labels scale 1 'EORTC domain - Global quality of life [0-100. Higher score = better quality of life]'
2 'EORTC domain - Physical functioning [0-100. Higher score = better level of functioning]'
3 'EORTC domain - Role functioning [0-100. Higher score = better level of functioning]'
4 'EORTC domain - Emotional functioning [0-100. Higher score = better level of functioning]'
5 'EORTC domain - Cognitive functioning [0-100. Higher score = better level of functioning]'
6 'EORTC domain - Social functioning [0-100. Higher score = better level of functioning]'
7 'EORTC domain - Fatigue [0-100. Higher score = more severe symptoms or impairment]'
8 'EORTC domain - Nausea Vomiting [0-100. Higher score = more severe symptoms or impairment]'
9 'EORTC domain - Pain [0-100. Higher score = more severe symptoms or impairment]'
10 'EORTC domain - Dyspnoe [0-100. Higher score = more severe symptoms or impairment]'
11 'EORTC domain - Insomnia [0-100. Higher score = more severe symptoms or impairment]'
12 'EORTC domain - Loss of appetite [0-100. Higher score = more severe symptoms or impairment]'
13 'EORTC domain - Constipation [0-100. Higher score = more severe symptoms or impairment]'
14 'EORTC domain - Diarrhoea [0-100. Higher score = more severe symptoms or impairment]'
15 'EORTC domain - Financial problems [0-100. Higher score = more severe symptoms or impairment]'
16 'EORTC summary score [0-100. Higher score = better quality of life]'
17 'HADS subscore - Depression [0-21]'
18 'HADS subscore - Anxiety [0-21]'
19 'HADS total score [0-42]'
20 'Emotional loneliness score [0-6]'
21 'Social loneliness score [0-5]'
22 'Total loneliness score [0-11]'
23 'Total loneliness category [0=not lonely [0-2]; 1=moderate [3-8]; 2=severe [9-10]; 3=very severe [11]]'
24 'CWS total score - Fear of recurrence [8-32]'
25 'PASE total score - Leisure activity'
26 'PASE total score - Household activity'
27 'PASE total score - Work activity'
28 'PASE total score - Total activity'
29 'PASE total score - Total activity group [1=very poor; 2=poor; 3=fair; 4=good; 5=very good; 6=excellent]'
30 'EORTC-HN domain - Pain [0-100. Higher score = more severe symptoms or impairment]'
31 'EORTC-HN domain - Swallowing [0-100. Higher score = more severe symptoms or impairment]'
32 'EORTC-HN domain - Senses problems [0-100. Higher score = more severe symptoms or impairment]'
33 'EORTC-HN domain - Trouble with social contact [0-100. Higher score = more severe symptoms or impairment]'
34 'EORTC-HN domain - Trouble with social eating [0-100. Higher score = more severe symptoms or impairment]'
35 'EORTC-HN domain - Speech problems [0-100. Higher score = more severe symptoms or impairment]'
36 'EORTC-HN domain - Less sexuality [0-100. Higher score = more severe symptoms or impairment]'
37 'EORTC-HN domain - Teeth [0-100. Higher score = more severe symptoms or impairment]'
38 'EORTC-HN domain - Opening mouth [0-100. Higher score = more severe symptoms or impairment]'
39 'EORTC-HN domain - Dry mouth [0-100. Higher score = more severe symptoms or impairment]'
40 'EORTC-HN domain - Sticky saliva [0-100. Higher score = more severe symptoms or impairment]'
41 'EORTC-HN domain - Coughing [0-100. Higher score = more severe symptoms or impairment]'
42 'EORTC-HN domain - Felt ill [0-100. Higher score = more severe symptoms or impairment]'
43 'EORTC-HN domain - Painkillers [0=no; 100=yes]'
44 'EORTC-HN domain - Nutritional supplements [0=no; 100=yes]'
45 'EORTC-HN domain - Feeding tube [0=no; 100=yes]'
46 'EORTC-HN domain - Weight loss [0=no; 100=yes]'
47 'EORTC-HN domain - Weight gain [0=no; 100=yes]'.
missing values outcome (lowest thru -1).

compute type=2.
if (scale=23 | scale=29) type=1.
if (scale>=43) type=0.
execute.
formats type (F1.0).
value labels type 0 'binary' 1 'categorical' 2 'continuous'.
variable labels outcome ''.
if (type=0) outcome_dich=(outcome=100).
EXECUTE.

RECODE measurement (24=100) (ELSE=Copy) INTO metingR.
EXECUTE.
formats metingR (F2.0).
value labels metingR 100 '24'.

SORT CASES BY scale.
SPLIT FILE LAYERED BY scale.
RECODE stage_1 (Lowest thru 2=1) (3 thru Highest=2) INTO stage_2cat.
RECODE comorbidity (4=3) (ELSE=Copy) INTO comorb_3cat.
EXECUTE.
missing values stage_2cat comorb_3cat (low thru -1).
value labels stage_2cat 1 'stage 0(Cis)/I/II' 2 'stage III/IV'.
RANK VARIABLES=klb_bmi.24 (A) /NTILES(2) /PRINT=YES /TIES=MEAN.
RANK VARIABLES=Age (A) /NTILES(2) /PRINT=YES /TIES=MEAN.
RANK VARIABLES=iadl_tot.24 (A) /NTILES(2) /PRINT=YES /TIES=MEAN.
RANK VARIABLES=extrave (A) /NTILES(2) /PRINT=YES /TIES=MEAN.
SPLIT FILE OFF.

