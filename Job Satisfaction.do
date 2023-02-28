use "C:\Users\chowd\Dropbox\Nursing Research 2021\Saifur Rahman's study plan\New folder\data_nursing_research.dta" 

**t test and ANOVA test


** Job satisfaction


ttest SIJS_total_score , by(Gender)
ttest SIJS_total_score , by( Marital_status_new )
ttest SIJS_total_score , by( Type_of_job_new )
ttest SIJS_total_score , by( Training_against_wpv )
ttest SIJS_total_score , by( Get_payment_timely )
ttest SIJS_total_score , by( Sufficient_equipment )
ttest SIJS_total_score , by( Have_rewards )
oneway SIJS_total_score Age_cat, tabulate
oneway SIJS_total_score Educational_degree , tabulate
oneway SIJS_total_score Level_of_hospital_new , tabulate
oneway SIJS_total_score Department_new, tabulate
oneway SIJS_total_score Working_hours_cat , tabulate
oneway SIJS_total_score Total_experience_cat , tabulate
oneway SIJS_total_score Income_cat_new, tabulate
oneway SIJS_total_score Division_of_work_place, tabulate



** Pearson's correlation

pwcorr Age_cont SIJS_total_score SNAQ_total_score BMS_mean_score, star(0.05) sig


pwcorr Age_cont SNAQ_total_score BMS_mean_score SIJS_total_score, star(0.05) sig


**Multilevel linear regression model

*Model 1
regress SIJS_total_score i.Age_cat i.Gender i.Marital_status_new i.Educational_degree i.Income_cat_new


*Model 2
regress SIJS_total_score i.Age_cat i.Gender i.Marital_status_new i.Educational_degree i.Income_cat_new i.Type_of_job_new i.Division_of_work_place i.Department_new i.Sufficient_equipment i.Get_payment_timely


*Model 3
regress SIJS_total_score i.Age_cat i.Gender i.Marital_status_new i.Educational_degree i.Income_cat_new i.Type_of_job_new i.Division_of_work_place i.Department_new i.Sufficient_equipment i.Get_payment_timely SNAQ_total_score BMS_mean_score






** Multiple linear regression

regress SIJS_total_score i.Marital_status_new i.Educational_degree i.Income_cat_new i.Type_of_job_new i.Division_of_work_place i.Department_new i.Sufficient_equipment i.Get_payment_timely i.Have_rewards i.Training_against_wpv


** Regression coefficient plot

coefplot, drop(_cons) xline(0)

coefplot, vertical drop(_cons) yline


**regress PHQ_total_score i.Gender i.Age_cat i.Marital_status_new i.Educational_degree i.Income_cat_new i.Type_of_job_new i.Level_of_hospital_new i.Department_new i.Working_hours_cat i.Total_experience_cat i.Sufficient_equipment i.Get_payment_timely i.Have_rewards i.Training_against_wpv

**regress PHQ_total_score i.Age_cat i.Marital_status_new i.Educational_degree i.Income_cat_new i.Type_of_job_new i.Level_of_hospital_new i.Department_new i.Working_hours_cat i.Total_experience_cat i.Sufficient_equipment i.Get_payment_timely i.Have_rewards i.Training_against_wpv

**regress PHQ_total_score i.Marital_status_new i.Educational_degree i.Income_cat_new i.Type_of_job_new i.Level_of_hospital_new i.Working_hours_cat i.Total_experience_cat i.Sufficient_equipment i.Get_payment_timely i.Have_rewards i.Training_against_wpv


** Hieararchical regression

hireg SIJS_total_score (Age_cat Gender Marital_status_new Educational_degree Income_cat_new) (Type_of_job_new Division_of_work_place Department_new Sufficient_equipment Get_payment_timely) (SNAQ_total_score BMS_mean_score)










label define Marital_status_new 1 "married" 2 "unmarried"
label value Marital_status_new Marital_status_new
label define Age_cat 1 "<25 yr" 2 "25-29 yr" 3 ">29 yr"
label value Age_cat Age_cat
label define Division_of_work_place 1 "Dhaka" 2 "Chattogram" 3 "Sylhet" 4 "Others"
label value Division_of_work_place Division_of_work_place
recode Monthly_income (min/20999=1 "<21,000") (21000/29999=2 "21,000-29,999") (30000/max=3 ">29,999"), gen (Income_cat_new)