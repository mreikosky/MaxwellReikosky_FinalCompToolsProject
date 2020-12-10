## This Code Makes ggplot and 3D Rayshader World Map Models of 
## 2019 Refugee Population by Country (w and w/out Turkey and Jordan)


## 1. Refugee Population by Country 2019 3D Model

```{r}
# plotting refugee population by country
refpop_gg <- ggplot(Refugee_map, aes(long, lat, group = group, fill = year_2019)) + 
  
  # allowing flexible plot shape to match country borders
  geom_polygon() + 
  
  # coloring countries on a chosen gradient for value range
  scale_fill_gradient(low = "seashell", high = "darkgreen") + 
  
  # labeling title and x & y axes
  labs(title = "Refugee Pop. 2019") + 
  xlab("Long.") + 
  ylab("Lat.") + 
  
  # removing legend title and setting background type
  theme(legend.title = element_blank(), 
        panel.background = element_rect())

# rendering ggplot as 3D in rayshader, setting parameters and scale
plot_gg(refpop_gg, width = 5, height = 5, raytrace = FALSE, preview = TRUE) + 
  plot_gg(refpop_gg , width = 5, height = 5, multicore = TRUE, scale = 250,
          
          # establishing tilt of model and angle of snapshot perspective
          zoom = 0.5, theta = 7, phi = 35, windowsize = c(1200, 800)) + 
  
  # allowing process launched from R to read input files before execution resumes
  Sys.sleep(0.2) + 
  
  # constructing snapshot of final 3D model
  render_snapshot(clear = TRUE) 
```


## 2. Refugee Population by Country 2019 3D Model (sans Turkey & Jordan)

```{r}
# filtering Turkey and Jordan to highlight other standout countries
refpop_sans <- Refugee_map %>%
  filter(region != "Turkey",
         region != "Jordan")

# plotting refugee population by country without Turkey and Jordan
refpop_sansgg <- ggplot(refpop_sans, aes(long, lat, group = group, fill = year_2019)) + 
  
  # allowing flexible plot shape to match country borders
  geom_polygon() + 
  
  # coloring countries on a chosen gradient for value range
  scale_fill_gradient(low = "seashell", high = "darkgreen") + 
  
  # labeling title and x & y axes
  labs(title = "Refugee Pop. 2019 (sans Turkey & Jordan") + 
  xlab("Long.") + 
  ylab("Lat.") + 
  
  # removing legend title and setting background type
  theme(legend.title = element_blank(),
        panel.background = element_rect())


# rendering ggplot as 3D in rayshader, setting parameters and scale
plot_gg(refpop_sansgg, width = 5, height = 5, raytrace = FALSE, preview = TRUE) + 
  plot_gg(refpop_sansgg, width = 5, height = 5, multicore = TRUE, scale = 250,
          
          # establishing angle of snapshot perspective
          zoom = 0.5, theta = 7, phi = 35, windowsize = c(1200, 800)) + 
  
  # allowing process launched from R to read input files before execution resumes
  Sys.sleep(0.2) + 
  
  # constructing snapshot of final 3D model
  render_snapshot(clear = TRUE) 
```