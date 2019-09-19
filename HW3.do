clear
cls

capture log close
log using "Econ419_Assignment3_Yuchen_Shi",replace

use "/Users/mikeshi/Downloads/NLS(1).dta"

sum luwe, detail

gen exper2 = exper^2

sqreg luwe educ exper exper2, q(.1 .2 .3 .4 .5 .6 .7 .8 .9) reps(500)

test [q10=q20=q30=q40=q50=q60=q70=q80=q90] : educ

reg luwe educ exper exper2, robust
reg luwe educ exper exper2 iq, robust

reg luwe educ exper exper2 iq (fed exper exper2 iq), robust

capture log close
