clear
cls
capture log close
log using "Econ419_Assignment6_Yuchen_Shi",replace
use "/Users/mikeshi/Downloads/CCT_RD.dta"
egen mean_receives=mean(Receives_CCT), by(bin)
scatter mean_receives bin, msymbol(oh) mlcolor(gs1)|| lowess mean_receives bin if bin<=11, bw(.6) lcolor(gs6) clwidth(medthick)|| lowess mean_receives bin if bin>11 & bin<=21, bw(.6) lcolor(gs6) clwidth(medthick)||, xline(11) xlabel(0(1)21)

egen mean_sewage=mean(Has_Sewage), by(bin)
scatter mean_sewage bin, msymbol(oh) mlcolor(gs1)|| lowess mean_sewage bin if bin<=11, bw(.6) lcolor(gs6) clwidth(medthick)|| lowess mean_sewage bin if bin>11 & bin<=21, bw(.6) lcolor(gs6) clwidth(medthick)||, xline(11) xlabel(0(1)21)

egen mean_gas=mean(Has_Gas), by(bin)
scatter mean_gas bin, msymbol(oh) mlcolor(gs1)|| lowess mean_gas bin if bin<=11, bw(.6) lcolor(gs6) clwidth(medthick)|| lowess mean_gas bin if bin>11 & bin<=21, bw(.6) lcolor(gs6) clwidth(medthick)||, xline(11) xlabel(0(1)21)

egen mean_phone=mean(Has_Phone), by(bin)
scatter mean_phone bin, msymbol(oh) mlcolor(gs1)|| lowess mean_phone bin if bin<=11, bw(.6) lcolor(gs6) clwidth(medthick)|| lowess mean_phone bin if bin>11 & bin<=21, bw(.6) lcolor(gs6) clwidth(medthick)||, xline(11) xlabel(0(1)21)

egen mean_own=mean(Owns_Home), by(bin)
scatter mean_own bin, msymbol(oh) mlcolor(gs1)|| lowess mean_own bin if bin<=11, bw(.6) lcolor(gs6) clwidth(medthick)|| lowess mean_own bin if bin>11 & bin<=21, bw(.6) lcolor(gs6) clwidth(medthick)||, xline(11) xlabel(0(1)21)

egen mean_head=mean(HH_head_completed_hs), by(bin)
scatter mean_head bin, msymbol(oh) mlcolor(gs1)|| lowess mean_head bin if bin<=11, bw(.6) lcolor(gs6) clwidth(medthick)|| lowess mean_head bin if bin>11 & bin<=21, bw(.6) lcolor(gs6) clwidth(medthick)||, xline(11) xlabel(0(1)21)

twoway hist bin if bin<=21 & bin >= 1, freq w(0.2) xline(11) xlabel(1 (2) 21)

egen mean_school=mean(Enrolled_School), by(bin)
scatter mean_school bin, msymbol(oh) mlcolor(gs1)|| lowess mean_school bin if bin<=11, bw(.6) lcolor(gs6) clwidth(medthick)|| lowess mean_school bin if bin>11 & bin<=21, bw(.6) lcolor(gs6) clwidth(medthick)||, xline(11) xlabel(0(1)21)

egen mean_work=mean(Child_Working), by(bin)
scatter mean_work bin, msymbol(oh) mlcolor(gs1)|| lowess mean_work bin if bin<=11, bw(.6) lcolor(gs6) clwidth(medthick)|| lowess mean_work bin if bin>11 & bin<=21, bw(.6) lcolor(gs6) clwidth(medthick)||, xline(11) xlabel(0(1)21)

egen mean_acute=mean(Acute_Diarrhea), by(bin)
scatter mean_acute bin, msymbol(oh) mlcolor(gs1)|| lowess mean_acute bin if bin<=11, bw(.6) lcolor(gs6) clwidth(medthick)|| lowess mean_acute bin if bin>11 & bin<=21, bw(.6) lcolor(gs6) clwidth(medthick)||, xline(11) xlabel(0(1)21)

gen d=score-11
gen d_Elig=Eligible*d

ivreg Enrolled_School (Receives_CCT = Eligible) d d_Elig if d >= -3 & d <= 3, r
ivreg Child_Working (Receives_CCT = Eligible) d d_Elig if d >= -3 & d <= 3, r
ivreg Acute_Diarrhea (Receives_CCT = Eligible) d d_Elig if d >= -3 & d <= 3, r

ivreg Enrolled_School (Receives_CCT = Eligible) d d_Elig if d >= -5 & d <= 5, r
ivreg Child_Working (Receives_CCT = Eligible) d d_Elig if d >= -5 & d <= 5, r
ivreg Acute_Diarrhea (Receives_CCT = Eligible) d d_Elig if d >= -5 & d <= 5, r

ivreg Enrolled_School (Receives_CCT = Eligible) d d_Elig if d >= -8 & d <= 8, r
ivreg Child_Working (Receives_CCT = Eligible) d d_Elig if d >= -8 & d <= 8, r
ivreg Acute_Diarrhea (Receives_CCT = Eligible) d d_Elig if d >= -8 & d <= 8, r
capture log close
