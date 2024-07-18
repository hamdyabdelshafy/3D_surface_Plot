## R Code for Creating a 3D Surface Plot with Plotly

### Author: Hamdy Abdel-Shafy
### Date: July 2024
### Affiliation: Department of Animal Production, Cairo University, Faculty of Agriculture

# This script loads data from an Excel file, creates a 3D surface plot using plotly,
# and displays it interactively. Make sure to install and load the necessary packages
# (plotly and readxl) before running this script.

# Install packages if not already installed
# install.packages("plotly")
# install.packages("readxl")

# Load necessary packages
library(plotly)  # For interactive plots
library(readxl)  # For reading Excel files

# Load data from Excel
data <- read_xlsx("data.xlsx") # Reads an Excel file named "data.xlsx" into R and stores it in the variable `data`.

# Convert tibble to data frame
data <- as.data.frame(data) # Converts the data read from Excel (which is typically in tibble format) into a traditional data frame structure.

# Define the custom colorscale # Defines a custom colorscale for the plot, specifying colors at different intervals of the data range.

colorscale <- list(
  list(0, "blue"),
  list(0.25, "green"),
  list(0.5, "yellow"),
  list(0.75, "orange"),
  list(1, "red")
)

# Use xtabs to create a matrix suitable for plotting
# Creates a matrix (`z_matrix`) where rows correspond to unique `PAC` values, columns correspond to unique `pH` values, 
# and the values in the matrix are aggregated `Response` values (e.g., sums or means depending on your data).

z_matrix <- xtabs(Response ~ PAC + pH, data = data) 


# Create the 3D surface plot with contour lines and gridlines
# Creates a 3D surface plot using `plotly`. Defines settings for axes, colorscale, contours, and overall layout.

plot <- plot_ly(data, x = ~PAC, y = ~pH, z = ~z_matrix, type = "surface", colorscale = colorscale,
                contours = list(
                  x = list(show = TRUE, color = 'grey'),
                  y = list(show = TRUE, color = 'grey'),
                  z = list(show = TRUE, usecolormap = TRUE, highlightcolor = "#ff0000", project = list(z = TRUE))
                )) %>%
  layout(scene = list(
    xaxis = list(title = "PAC Dosage (mg/L)", showgrid = TRUE, gridcolor = 'grey'),
    yaxis = list(title = "pH", showgrid = TRUE, gridcolor = 'grey'),
    zaxis = list(title = "Response", showgrid = TRUE, gridcolor = 'grey'),
    title = "3D Surface Plot"
  ))

# Display the plot interactively
plot  # Displays the created plot in the R console or an integrated plot viewer.

