clear
cls

use "/Users/mikeshi/Downloads/handguns.dta"
set matsize 300
gen luvio = log(vio)

reg luvio shall, r
reg luvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029, r 
reg luvio shall, cluster(stateid)
reg luvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029, cluster(stateid)
xtreg luvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029, fe i(stateid) cluster(stateid)
tabulate year, generate(yr)
xtreg luvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029 yr*, fe i(stateid) cluster(stateid)
testparm yr*
xtreg luvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029 yr*, re

qui xtreg luvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029 yr*, fe cluster(stateid)
est store fixed
qui xtreg luvio shall incarc_rate density avginc pop pb1064 pw1064 pm1029 yr*, re
est store random
hausman fixed random, force

gen lurob = log(rob)
reg lurob shall, cluster(stateid)
reg lurob shall incarc_rate density avginc pop pb1064 pw1064 pm1029, cluster(stateid)
xtreg lurob shall incarc_rate density avginc pop pb1064 pw1064 pm1029, fe i(stateid) cluster(stateid)
xtreg lurob shall incarc_rate density avginc pop pb1064 pw1064 pm1029 yr*, fe i(stateid) cluster(stateid)
testparm yr*
xtreg lurob shall incarc_rate density avginc pop pb1064 pw1064 pm1029 yr*, re

qui xtreg lurob shall incarc_rate density avginc pop pb1064 pw1064 pm1029 yr*, fe cluster(stateid)
est store fixed
qui xtreg lurob shall incarc_rate density avginc pop pb1064 pw1064 pm1029 yr*, re
est store random
hausman fixed random, force

gen lumur = log(mur)
reg lumur shall, cluster(stateid)
reg lumur shall incarc_rate density avginc pop pb1064 pw1064 pm1029, cluster(stateid)
xtreg lumur shall incarc_rate density avginc pop pb1064 pw1064 pm1029, fe i(stateid) cluster(stateid)
xtreg lumur shall incarc_rate density avginc pop pb1064 pw1064 pm1029 yr*, fe i(stateid) cluster(stateid)
testparm yr*
xtreg lumur shall incarc_rate density avginc pop pb1064 pw1064 pm1029 yr*, re

qui xtreg lumur shall incarc_rate density avginc pop pb1064 pw1064 pm1029 yr*, fe cluster(stateid)
est store fixed
qui xtreg lumur shall incarc_rate density avginc pop pb1064 pw1064 pm1029 yr*, re
est store random
hausman fixed random, force
