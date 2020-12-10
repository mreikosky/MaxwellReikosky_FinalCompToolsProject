
## This Code Imports, Cleans, and Joins the Refugee Pop and Map World Datasets


#1. Importing and Cleaning Refugee Pop. Dataset

```{r message=FALSE, warning=FALSE}
# must set working directory to MaxwellReikosky_CompToolsFinal folder
# loading refugee population by country of asylum dataset
Refugee_totals <- read_excel("Data/WORLD BANKAPI_SM.POP.REFG_DS2_en_excel_v2_1743495.xls")

# renaming relevant column as a workable string
Refugee_totals <- Refugee_totals %>%
  rename("year_2019" = "2019")

# subsetting refugee dataset to most recent measurement 
Refugee_totals <- Refugee_totals %>%
  select(Country_name, year_2019) %>%
  
  # trimming white space
  mutate(Country_name = str_trim(Country_name), 
         year_2019 = str_trim(year_2019)) %>%
  
  # omitting all countries that were not measured
  na.omit()

# recoding country names to match map.world df
# needed escape symbol for recoding Cote d'Ivoire 
Refugee_totals$Country_name <- recode(Refugee_totals$Country_name, 
                                      'United States' = 'USA',
                                      'United Kingdom' = 'UK', 
                                      'Russian Federation' = 'Russia', 
                                      'Congo, Dem. Rep.' = 'Democratic Republic of the Congo',
                                      'Congo, Rep.' = 'Republic of Congo', 
                                      'Korea, Rep.' = 'North Korea', 
                                      'Cote d\'Ivoire' = 'Ivory Coast', 
                                      'Egypt, Arab Rep.' = 'Egypt', 
                                      'Venezuela, RB' = 'Venezuela', 
                                      'Yemen, Rep.' = 'Yemen', 
                                      'Syrian Arab Republic' = 'Syria', 
                                      'Slovak Republic' = 'Slovakia', 
                                      'Kyrgyz Republic' = 'Kyrgyzstan', 
                                      'North Macedonia' = 'Macedonia', 
                                      'Bahamas, The' = 'Bahamas', 
                                      'Gambia, The' = 'Gambia', 
                                      'Iran, Islamic Rep.' = 'Iran', 
                                      'West Bank and Gaza' = 'Gaza Strip')

```

## 2. Importing World Map Dataset

```{r message=FALSE}
# grabbing world map df
map.world <- map_data("world")

# checking how many countries are listed on world map dataset
map.world %>%
  select(region) %>%
  unique()
```

## 3. Joining World Map and Refugee Pop. Datasets

```{r}
# merging map and recoded refugee pop datasets
Refugee_map <- left_join(map.world, Refugee_totals, by = c('region' = 'Country_name'))

# converting year_2019 to numeric because some were in character type
Refugee_map$year_2019 <- as.numeric(Refugee_map$year_2019)
```


