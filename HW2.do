clear
cls
capture log close
log using "Econ419_Assignment2_Yuchen_Shi",replace
use "/Users/mikeshi/Downloads/NLS.dta"
summarize
gen expsquare = exper^2
reg luwe educ exper expsquare, robust
estat vce
gen x1=educ+exper
gen x2=expsquare+educ*(2*13.61176-1)
reg luwe educ x1 x2, robust
bootstrap _b, reps(1000) saving(bsb, replace): reg luwe educ x1 x2, robust
clear
use "/Users/mikeshi/Downloads/bsb.dta"
sum

clear
use "/Users/mikeshi/Downloads/smoking.dta"

sum smoker
sum smoker if smkban == 1
sum smoker if smkban == 0
ttest smoker, by (smkban) unequal
ttest smoker, by (smkban)
reg smoker smkban, robust
reg smoker smkban
gen age_sq = age^2
reg smoker smkban female age age_sq hsdrop hsgrad colsome colgrad black hispanic, robust
qui probit smoker smkban female age age_sq hsdrop hsgrad colsome colgrad black hispanic
est store unrestricted
qui probit smoker smkban female hsdrop hsgrad colsome colgrad black hispanic
est store restricted
lrtest unrestricted restricted
dprobit smoker smkban female age age_sq hsdrop hsgrad colsome colgrad black hispanic

reg smoker smkban female age age_sq hsdrop hsgrad colsome colgrad black hispanic, robust
disp _b[_cons]+1*_b[smkban]+0*_b[female]+20*_b[age]+400*_b[age_sq]+1*_b[hsdrop]+0*_b[hsgrad]+0*_b[colsome]+0*_b[colgrad]+0*_b[black]+0*_b[hispanic]
disp _b[_cons]+0*_b[smkban]+0*_b[female]+20*_b[age]+400*_b[age_sq]+1*_b[hsdrop]+0*_b[hsgrad]+0*_b[colsome]+0*_b[colgrad]+0*_b[black]+0*_b[hispanic]
disp _b[_cons]+1*_b[smkban]+1*_b[female]+20*_b[age]+400*_b[age_sq]+1*_b[hsdrop]+0*_b[hsgrad]+0*_b[colsome]+0*_b[colgrad]+0*_b[black]+0*_b[hispanic]
disp _b[_cons]+0*_b[smkban]+1*_b[female]+20*_b[age]+400*_b[age_sq]+1*_b[hsdrop]+0*_b[hsgrad]+0*_b[colsome]+0*_b[colgrad]+0*_b[black]+0*_b[hispanic]

probit smoker smkban female age age_sq hsdrop hsgrad colsome colgrad black hispanic
disp normprob(_b[_cons]+1*_b[smkban]+0*_b[female]+20*_b[age]+400*_b[age_sq]+1*_b[hsdrop]+0*_b[hsgrad]+0*_b[colsome]+0*_b[colgrad]+0*_b[black]+0*_b[hispanic])
disp normprob(_b[_cons]+0*_b[smkban]+0*_b[female]+20*_b[age]+400*_b[age_sq]+1*_b[hsdrop]+0*_b[hsgrad]+0*_b[colsome]+0*_b[colgrad]+0*_b[black]+0*_b[hispanic])
disp normprob(_b[_cons]+1*_b[smkban]+1*_b[female]+20*_b[age]+400*_b[age_sq]+1*_b[hsdrop]+0*_b[hsgrad]+0*_b[colsome]+0*_b[colgrad]+0*_b[black]+0*_b[hispanic])
disp normprob(_b[_cons]+0*_b[smkban]+1*_b[female]+20*_b[age]+400*_b[age_sq]+1*_b[hsdrop]+0*_b[hsgrad]+0*_b[colsome]+0*_b[colgrad]+0*_b[black]+0*_b[hispanic])
capture log close
