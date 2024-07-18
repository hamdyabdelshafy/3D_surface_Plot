
### 3D Surface Plot with Plotly

This repository contains an R script to create a 3D surface plot using Plotly and data from an Excel file.

## Author: Hamdy Abdel-Shafy
## Date: July 2024
## Affiliation: Department of Animal Production, Cairo University, Faculty of Agriculture

## Description

This R script loads data from an Excel file, creates a 3D surface plot using Plotly, and displays it interactively. 
The script includes instructions for installing and loading the necessary packages.

## Requirements

- R (version 3.5.0 or later)
- The following R packages:
  - `plotly`
  - `readxl`

## Installation

If you haven't already installed R, you can download it from [CRAN](https://cran.r-project.org/).

To install the required R packages, open your R console or RStudio and run the following commands:

```R
install.packages("plotly")
install.packages("readxl")
```

## Usage

1. **Place your data file in the project directory:**

Ensure your Excel file is named `data.xlsx` and is placed in the project directory.

2. **Run the R script:**

Open your R console or RStudio, set the working directory to the project directory, and run the script:

```R
# Load necessary packages
library(plotly)
library(readxl)

# Load data from Excel
data <- read_xlsx("data.xlsx")

# Convert tibble to data frame
data <- as.data.frame(data)

# Define the custom colorscale
colorscale <- list(
  list(0, "blue"),
  list(0.25, "green"),
  list(0.5, "yellow"),
  list(0.75, "orange"),
  list(1, "red")
)

# Use xtabs to create a matrix suitable for plotting
z_matrix <- xtabs(Response ~ PAC + pH, data = data)

# Create the 3D surface plot with contour lines and gridlines
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
plot
```

## Notes

- Make sure your Excel file (`data.xlsx`) has the columns `PAC`, `pH`, and `Response` as expected by the script.
- The script defines a custom colorscale for the 3D plot.
- The `xtabs` function is used to create a matrix suitable for plotting.

## License

This project is licensed under the [MIT License](LICENSE).

