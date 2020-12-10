# ## This Code Makes ggplot and 3D Rayshader World Map Models of 
## 2030 Climate Mortality by Country (w and w/out India)


## 1. Climate Mortality 2030 by Country 3D Model

```{r}
# plotting climate mortality in 2030 by country 
climmort_gg <- ggplot(Refclim_mapdf, aes(long, lat, group = group, fill = Climate_mortality)) + 
  
  # allowing flexible shape to match country borders
  geom_polygon() + 
  
  # coloring countries on a chosen gradient for value range
  scale_fill_gradient(low = "seashell", high = "darkred") + 
  
  # labeling title and x & y axes
  labs(title = "Climate Mortality 2030") + 
  theme() + 
  xlab("Long.") + 
  ylab("Lat.") + 
  
  # removing legend title and setting background type
  theme(legend.title = element_blank(), 
        panel.background = element_rect())


# rendering ggplot as 3D in rayshader, setting parameters and scale
plot_gg(climmort_gg, width = 5, height = 5, raytrace = FALSE, preview = TRUE) + 
  plot_gg(climmort_gg, width = 5, height = 5, multicore = TRUE, scale = 250, 
          
          # establishing angle of snapshot perspective                                           
          zoom = 0.5, theta = 7, phi = 35, windowsize = c(1200, 800)) + 
  
  # allowing process launched from R to read input files before execution resumes
  Sys.sleep(0.2) + 
  
  # constructing snapshot of final 3D model
  render_snapshot(clear = TRUE) 
```

## 2. Climate Mortality 2030 by Country 3D Model (sans India)

```{r}
# filtering out India to calibrate for its disproportionate mortality
climmort_sans <- Refclim_mapdf %>%
  filter(region != "India")

# plotting climate mortality in 2030 by country, excluding India
climmort_sansgg <- ggplot(climmort_sans, aes(long, lat, group = group, fill = Climate_mortality)) + 
  
  # allowing flexible plot shape to match country borders
  geom_polygon() + 
  
  # coloring countries on a chosen gradient for value range
  scale_fill_gradient(low = "seashell", high = "darkred") + 
  
  # labeling title and x & y axes
  labs(title = "Climate Mortality 2030 (sans India)") + 
  xlab("Long.") + 
  ylab("Lat.") + 
  
  # removing legend title and setting background type
  theme(legend.title = element_blank(),
        panel.background = element_rect())

# rendering ggplot as 3D in rayshader, setting parameters and scale
plot_gg(climmort_sansgg, width = 5, height = 5, raytrace = FALSE, preview = TRUE) +
  plot_gg(climmort_sansgg, width = 5, height = 5, multicore = TRUE, scale = 250,
          
          # establishing angle of snapshot perspective 
          zoom = 0.5, theta = 7, phi = 35, windowsize = c(1200, 800)) + 
  
  # allowing process launched from R to read input files before execution resumes
  Sys.sleep(0.2) + 
  
  # constructing snapshot of final 3D model 
  render_snapshot(clear = TRUE)
```