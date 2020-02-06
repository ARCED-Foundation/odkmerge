*! version 1.0.0 Mehrab Ali 27jun2019


cap program drop odkmerge
program define odkmerge 

	version 15


*  ----------------------------------------------------------------------------
*  1. Define syntax                                                            
*  ----------------------------------------------------------------------------
	
	#d ;
	syntax,
	using(string) 
	files(string)
	VARiables(string)
	from(string)
	to(string)
	
	;
	#d cr

//local using = "`anything'"

preserve
foreach file of local files {
	u "`from'/`file'", clear
	rename key uid
	
	if regexm(parent_key, "/")==1 {
	split parent_key, p("/")
	rename parent_key1 key
	
	
	*Merge
	merge m:m key using "`from'/`using'", keepusing("`varlist'")
	 
	tab _merge if _merge==1
		if r(r)!=0 {
		dis as error "Problem in merging. Not merged files are being deleted. Enter 'q' to continue."
		drop if _merge==2
		}
		else {
		dis "Successfully merged"
		}		
		drop _merge	
	
	
	* Keys
	rename parent_key parentuid
	drop parent_key*
	drop key
	rename uid key
	rename parentuid parent_key
	drop if key==""
	save "`to'/`file'", replace
	}
	
	else {
	rename parent_key key
	* Children
	merge m:m key using "`from'/`using'", keepusing("`varlist'")
	
	tab _merge if _merge==1
		if r(r)!=0 {
		dis as error "Problem in merging. Not merged files are being deleted. Enter 'q' to continue."
		pause
		drop if _merge==2
		}
		else {
		dis "Successfully merged"
		}	
		drop _merge	
	
	
	rename key parent_key
	rename uid key
	drop if key==""
	save "`to'/`file'", replace
	}

}
restore

end 	
