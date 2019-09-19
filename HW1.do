***************************************************
********** Assignment 1 for Econ 419 **************
**********       Yuchen Shi           *************
**********      Jan 18th, 2019       **************
***************************************************

**** clear memory ****
	clear	

**** clean the results window ****
	cls

**** load data ****
	* set the path of the data
	use "/Users/mikeshi/Downloads/growthdata.dta"
	
**** log on ****
	* close existing log file
	capture log close

	* name the log file as 'Econ419_Assignment1_Yuchen_Shi'
	log using "Econ419_Assignment1_Yuchen_Shi",replace
	
**** regression ****

	* regress growth on yrsschool
	reg growth yrsschool, robust
	
**** graph ****
 
	* twoway plot
	twoway scatter growth yrsschool 
 
	* twoway plot with fitted line, use robust option
	twoway (scatter growth yrsschool ) (lfit growth yrsschool, est(robust))	

**** creat variable ****

	gen slevel=1 if yrsschool<=1
	replace slevel=2 if yrsschool>1 & yrsschool<=2
	replace slevel=3 if yrsschool>2 & yrsschool<=3
	replace slevel=4 if yrsschool>3 & yrsschool<=4
	replace slevel=5 if yrsschool>4 & yrsschool<=5
	replace slevel=6 if yrsschool>5 & yrsschool<=6
	replace slevel=7 if yrsschool>6 & yrsschool<=7
	replace slevel=8 if yrsschool>7 & yrsschool<=8
	replace slevel=9 if yrsschool>8 & yrsschool<=9
	replace slevel=10 if yrsschool>9
	
**** compute conditional average ****

	sort slevel
	
	by slevel: egen gmean=mean(growth)
	
	* list the result
	preserve 
	collapse (mean) gmean, by(slevel)
	list slevel gmean
	restore 
	
**** graph average growth by slevel ****

	twoway scatter gmean slevel 
	
**** confirm the Law of Iterated Expectations ****
	
	summarize growth
	summarize growth if slevel==1
	summarize growth if slevel==2
	summarize growth if slevel==3
	summarize growth if slevel==4
	summarize growth if slevel==5
	summarize growth if slevel==6
	summarize growth if slevel==7
	summarize growth if slevel==8
	summarize growth if slevel==9
	summarize growth if slevel==10
	
	
**** log close ****
	capture log close

