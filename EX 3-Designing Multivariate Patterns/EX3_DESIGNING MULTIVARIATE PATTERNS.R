# -------------------------------------------------
# 1. Install packages (Run only once)
# -------------------------------------------------
install.packages(c("GGally", "dplyr"))

# -------------------------------------------------
# 2. Load libraries
# -------------------------------------------------
library(GGally)
library(dplyr)

# -------------------------------------------------
# 3. Load dataset (File browser will open)
# -------------------------------------------------
health <- read.csv(file.choose(), stringsAsFactors = FALSE)

# -------------------------------------------------
# 4. Check if data loaded correctly
# -------------------------------------------------
head(health)
str(health)
colnames(health)

# -------------------------------------------------
# 5. Create Age Group column
# -------------------------------------------------
health <- health %>%
  mutate(
    Age_Group = cut(
      Age,
      breaks = c(0, 30, 50, 100),
      labels = c("Young", "Middle", "Senior"),
      right = FALSE
    )
  )

# -------------------------------------------------
# 6. Scatter Plot Matrix
# -------------------------------------------------
ggpairs(
  health[, c("Age", "Blood_Pressure", "Cholesterol", "Glucose_Level")],
  aes(color = Age_Group),
  title = "Scatter Plot Matrix of Health Indicators"
)

# -------------------------------------------------
# 7. Correlation Matrix
# -------------------------------------------------
health_numeric <- health[, c("Age", "Blood_Pressure", "Cholesterol", "Glucose_Level")]

correlation_matrix <- cor(health_numeric)

print(correlation_matrix)