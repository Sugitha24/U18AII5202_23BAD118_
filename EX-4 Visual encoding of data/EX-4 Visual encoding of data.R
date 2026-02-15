library(ggplot2)
library(dplyr)

# -------------------------------------------------
# 2. Load traffic accident dataset
# (Use file.choose() to avoid path errors)
# -------------------------------------------------
traffic <- read.csv(file.choose(), stringsAsFactors = FALSE)

# -------------------------------------------------
# 3. View dataset structure
# -------------------------------------------------
str(traffic)
head(traffic)

# -------------------------------------------------
# 4. Convert Severity to ordered factor
# -------------------------------------------------
traffic$Severity <- factor(
traffic$Severity,
levels = c("Minor", "Major", "Fatal"),
ordered = TRUE
)

# -------------------------------------------------
# 5. Visual Encoding Plot
# -------------------------------------------------
ggplot(traffic, aes(
x = Location,
y = Vehicles_Involved,
color = Severity,
size = Casualties,
shape = Accident_Type
)) +
geom_point(alpha = 0.8) +
scale_color_manual(values = c("green", "orange", "red")) +
labs(
title = "Visual Encoding of Traffic Accident Data",
x = "Accident Location",
y = "Vehicles Involved"
) +
theme_minimal()