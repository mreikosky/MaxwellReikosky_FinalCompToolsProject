# This Code Provides Additional Knitting Instructions If Errors Occur

# ONLY KNIT TO HTML! Wont knit to pdf.

# Provided from post here: https://github.com/tylermorganwall/rayshader/issues/61
# "To embed the plot into an RMarkdown document, you need to call rgl::rglwidget() after bringing up 
# your plot. If you're embedding multiple plots, you will also have to close the previous 
# plot using rgl::rgl.close() before plotting the next one."

# It looks like you only need to rgl.open() before the plot code and rgl.close() before
# using rgl.open() before embedding the next plot.


# If errors in LaTex occur go to https://yihui.org/tinytex/r/#debugging

# Alternative rgl help: https://bookdown.org/yihui/rmarkdown-cookbook/rgl-3d.html