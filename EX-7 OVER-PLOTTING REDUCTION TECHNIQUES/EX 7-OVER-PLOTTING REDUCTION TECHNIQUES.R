# -------------------------------------------------
# EXPERIMENT 7: Handling Over-Plotting
# ------------------------------------------------
# Load required libraries
library(ggplot2)

# (Optional for hexbin plot)
library(hexbin)
# -------------------------------------------------
# Load dataset (Safe method)
# -------------------------------------------------
data <- read.csv(file.choose(), stringsAsFactors = FALSE)
# View dataset
head(data)
str(data)
# -------------------------------------------------
# 1. NORMAL SCATTER PLOT (Over-plotting occurs)
# -------------------------------------------------
ggplot(data, aes(x = Likes, y = Shares)) +
  geom_point() +
  ggtitle("Normal Scatter Plot (Over-plotting)") +
  theme_minimal()
# -------------------------------------------------
# 2. ALPHA BLENDING
# -------------------------------------------------
ggplot(data, aes(x = Likes, y = Shares)) +
  geom_point(alpha = 0.3, color = "blue") +
  ggtitle("Alpha Blending to Reduce Over-plotting") +
  theme_minimal()
# -------------------------------------------------
# 3. JITTERING
# -------------------------------------------------
ggplot(data, aes(x = Likes, y = Shares)) +
  geom_jitter(width = 5, height = 5, alpha = 0.4, color = "darkgreen") +
  ggtitle("Jittering to Reduce Over-plotting") +
  theme_minimal()
# -------------------------------------------------
# 4. AGGREGATION USING BINNING
# -------------------------------------------------
ggplot(data, aes(x = Likes, y = Shares)) +
  geom_bin2d() +
  scale_fill_gradient(low = "lightblue", high = "red") +
  ggtitle("Aggregation Using Binning (geom_bin2d)") +
  theme_minimal()
# -------------------------------------------------
# 5. HEXBIN AGGREGATION
# -------------------------------------------------

ggplot(data, aes(x = Likes, y = Shares)) +
  geom_hex() +
  scale_fill_gradient(low = "yellow", high = "purple") +
  ggtitle("Hexagonal Binning for High Density Data") +
  theme_minimal()