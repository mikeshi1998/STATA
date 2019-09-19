clear
cls

use "/Users/mikeshi/Downloads/grain.dta"

gen luquant=log(quantity)
gen luprice=log(price)

reg luquant luprice seas*, r

reg luprice cartel seas*, r
testparm seas*

reg luquant luprice seas*, r
testparm seas*

ivreg luquant seas* (luprice = cartel), r
testparm seas*

reg luprice cartel seas*, r
testparm cartel

ivreg luquant seas* (luprice = ice), r
testparm seas*

reg luprice ice seas*, r
testparm ice

ivreg luquant seas* (luprice = ice cartel), r
testparm seas*
predict el, residuals
reg el ice cartel seas*, r
gen r2 = e(r2)
dis 1-chi2(1, 328*r2)

reg luprice ice cartel seas*, r
testparm ice cartel

