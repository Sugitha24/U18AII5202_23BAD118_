# -------------------------------------------------
# EXPERIMENT 6: MULTIVARIATE DISPLAYS
# -------------------------------------------------

# Load required libraries
library(ggplot2)
library(GGally)
library(lattice)

# -------------------------------------------------
# Load Dataset (Safer method using file chooser)
# -------------------------------------------------
retail_data <- read.csv(file.choose(), stringsAsFactors = FALSE)

# Display dataset details
head(retail_data)
str(retail_data)

# -------------------------------------------------
# PARALLEL COORDINATE PLOT
# -------------------------------------------------

# Select only numeric columns
numeric_data <- retail_data[, sapply(retail_data, is.numeric)]

ggparcoord(
  data = numeric_data,
  columns = 1:ncol(numeric_data),
  scale = "uniminmax",
  alphaLines = 0.4
) +
  ggtitle("Parallel Coordinate Plot of Retail Data")


# -------------------------------------------------
# BUBBLE CHART
# Sales vs Profit (Bubble size = Sales)
# -------------------------------------------------

ggplot(retail_data, aes(
  x = Sales,
  y = Profit,
  size = Sales,
  color = Region
)) +
  geom_point(alpha = 0.6) +
  scale_size_continuous(range = c(3, 12)) +
  ggtitle("Bubble Chart: Sales vs Profit") +
  theme_minimal()


# -------------------------------------------------
# TRELLIS DISPLAY BY REGION
# -------------------------------------------------

xyplot(
  Profit ~ Sales | Region,
  data = retail_data,
  layout = c(2, 2),
  type = c("p", "r"),
  xlab = "Sales",
  ylab = "Profit"
)