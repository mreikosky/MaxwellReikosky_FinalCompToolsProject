## This Code Imports, Cleans, and Merges Climate Vulnerability Dataset 
## to the Previously Merged Dataset


## 1. Importing and Cleaning Climate Vulnerability Dataset

```{r}
# loading climate vulnerability excel data set
Climate_totals <- read_excel("Data/Climate_totals.xls")

# Renaming climate mortality column to workable string
Climate_totals <- Climate_totals %>%
  rename("Climate_mortality" = "Mortality_Climate_total_2030 (Number of People)")

# recoding country names to fit map.world dataset
Climate_totals$Country_name <- recode(Climate_totals$Country_name, 
                                      'United States' = 'USA', 
                                      'United Kingdom' = 'UK', 
                                      'Congo' = 'Republic of Congo', 
                                      'Cote d\'Ivoire' = 'Ivory Coast', 
                                      'DR Congo' = 'Democratic Republic of the Congo', 
                                      'Sudan/South Sudan1' = 'South Sudan', 
                                      'Sudan/South Sudan2' = 'Sudan')

# subsetting to select only 2030 climate mortality column
# clearing any potential white space
Climate_totals <- Climate_totals %>%
  select(Country_name, Climate_mortality) %>%
  mutate(Country_name = str_trim(Country_name), 
         Climate_mortality = str_trim(Climate_mortality))
```

## 2. Joining Climate Mortality With Previous Merged Dataset

```{r}
# merging trimmed climate mortality dataset with previously merged dataset
Refclim_mapdf <- left_join(Refugee_map, Climate_totals, by = c('region' = 'Country_name'))

# coercing climate mortality data to numerical because some were characters
Refclim_mapdf$Climate_mortality <- as.numeric(Refclim_mapdf$Climate_mortality)
```