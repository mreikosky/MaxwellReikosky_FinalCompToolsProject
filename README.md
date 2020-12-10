# MaxwellReikosky_FinalCompToolsProject
Refugee Pop. 2019 - Climate Mortality 2030 3D World Maps

# Replication Document

## Short Description

The documents, scripts, and project files contained in this folder will provide resources and instructions needed to
generate four total 3D world map models using the rayshader 3rd party package @ https://www.rayshader.com/ 
(two showing refugee populations by country in 2019, two showing predicted climate mortality in 2030). My code will: 
1) install required packages; 2) import, clean, and join three datasets (refugee population 2019, climate mortality 2030, world map); 
3) render ggplots and 3D models using the rayshader package. Optional debugging information is given to support knitting in case of error.

## Dependencies

*software
1. R version 4.0.2 (2020-06-22)
2. RStudio Version 1.3.1093

*packages
3. readxl
4. dplyr
5. ggplot2
6. rayshader
7. tidyverse
8. rlang
9. rgl
10. devtools
11. tinytex
12. ggmap


## Files

#### Narrative/

1. Narrative.Rmd: Provides a 4 page narrative of the project, main challenges, solutions, and results.
2. Narrative.pdf: A knitted pdf of Narrative.Rmd. 
3. LightningTalk.ppt: A short presentation in powerpoint format on this experience with rayshader.

#### Code/

1. 01_installpckgs: installs requisite developer tools and packages, warns to use administrator mode.
2. 02_importmerge_refpop: imports, cleans, and merges refugee population and world map datasets.
3. 03_importmerge_climmort: imports, cleans, and merges climate mortality and previously merged dataset.
4. 04_3Dmodels_refpop: renders two ggplot and 3D models of refugee population in 2019 by country (w and w/out Turkey and Jordan).
5. 05_3Dmodels_climmort: renders ggplot and 3D model of climate mortality in 2030 by country (w and w/out India)
6. 06_knittingerror_help: provides some potential solutions for debugging knitting error.

#### Data/

1. Climate_totals.xls: provides DARA data on global climate vulnerability, cost, mortality for 2010 and 2030 by country, 
available here: https://daraint.org/climate-vulnerability-monitor/climate-vulnerability-monitor-2012/data/

2. WORLD BANKAPI_SM.POP.REFG_DS2_en_excel_v2_1743495.xls: Contains World Bank data on global refugee population by country 
from 1960-2019, available here: https://data.worldbank.org/indicator/SM.POP.REFG

3. WorldMap.csv: Contains coordinate values that render world map ggplot, available in R ggmap package 

#### Results/

1. climmort.png: 3D world map model of projected climate mortality in 2030 by country
2. climmort_sansindia.png: 3D world map model of projected climate mortality in 2030 by country, without India 
3. refpop.png: 3D world map model of 2019 refugee population by country
4. refpop_sansturjor.png: 3D world map model of 2019 refugee population by country, without Turkey and Jordan

## More Information

1. This code does not knit for me and will require further debugging. Please see the 06_knittingerror_help script file for some 
possible approaches for this process. Credit to Pete for trying to help!

2. Developer tools and knitting may require RStudio to be run in administrator mode. Please see comments at beginning 
of 01_installpckgs script file.

3. Final project file includes additional code for inserting screenshot images of 3D models since knitting this models caused 
LaTex error. Scripts in the "Code" folder do not include code for inserting these screenshotted images.




