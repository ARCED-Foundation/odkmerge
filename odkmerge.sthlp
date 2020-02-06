{smcl}
{* *! version 2.0.0  22jan2019}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help"}{...}
{viewerjumpto "Syntax" "odkmerge##syntax"}{...}
{viewerjumpto "Description" "odkmerge##description"}{...}
{viewerjumpto "Options" "odkmerge##options"}{...}
{viewerjumpto "Remarks" "odkmerge##remarks"}{...}
{viewerjumpto "Examples" "odkmerge##examples"}{...}
{title:Title}

{phang}
{bf:odkmerge} {hline 2} is a module to merge selected variables from the parent file to the children files generated from odk or SurveyCTO.

{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:odkmerge}
[{cmd:,} {it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt using}}The name of the parent file, where the variables exist{p_end}
{synopt:{opt files}}The name of the children data files, where the variables will be merged{p_end}
{synopt:{opt var:iables}}The list of variables which will be merged. {p_end}
{synopt:{opt from}}The directory where the files are saved{p_end}
{synopt:{opt to}}The directory where the new files will be saved{p_end}
{synoptline}
{p2colreset}{...}


{marker description}{...}
{title:Description}

{pstd}
If ODK or SurveyCTO is used for data collection, the long format data are downloading in multiple datasets, if there were repeat groups.
{cmd:odkmerge} can be used to merge necessary variables which are only in the parent dataset. 

{pstd}This module uses the key and parent_key variables to merge. 

{marker examples}{...}
{title:Examples}

{phang}{cmd:. odkmerge, using("Endline_2019.dta") files("Endline_2019.dta Endline_2019-roster.dta") variables(hhid enumid submissiondate) from("X:\Projects 2018\Fieldwork\raw") to("X:\Projects 2018\Fieldwork\raw")}{p_end}

{phang}{cmd:. odkmerge, using("Endline_2019.dta") files("Endline_2019.dta Endline_2019-roster.dta") variables(hhid enumid submissiondate) from("X:\Projects 2018\Fieldwork\raw") to("X:\Projects 2018\Fieldwork\clean")}{p_end}

{marker author}{...}
{title:Author}

{pstd}Mehrab Ali{p_end}
{pstd}For questions or suggestions e-mail at mehrabbabu@gmail.com.{p_end}
