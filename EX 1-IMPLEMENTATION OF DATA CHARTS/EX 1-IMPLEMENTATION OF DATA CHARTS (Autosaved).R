# ================================
# LOAD REQUIRED LIBRARIES
# ================================
library(ggplot2)
library(dplyr)

# ================================
# READ DATASET (Mac path)
# ================================
student_data <- read.csv("/Users/sugitha/Downloads/1.student_performance.csv")

# ================================
# VIEW DATA
# ================================
head(student_data)
str(student_data)

# ================================
# DATA PREPROCESSING
# ================================
# Calculate average marks per student
student_data$Average_Marks <- rowMeans(
  student_data[, c("Internal_Test1", "Internal_Test2", "Assignment_Marks")],
  na.rm = TRUE
)

# ================================
# BAR CHART: SUBJECT-WISE AVERAGE MARKS
# ================================
subject_avg <- aggregate(
  Average_Marks ~ Subject,
  data = student_data,
  mean
)

ggplot(subject_avg, aes(x = Subject, y = Average_Marks, fill = Subject)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Subject-wise Average Marks",
    x = "Subject",
    y = "Average Marks"
  ) +
  theme_minimal()

# ================================
# LINE CHART: PERFORMANCE TREND ACROSS ASSESSMENTS
# ================================
test_avg <- data.frame(
  Assessment = c("Internal Test 1", "Internal Test 2", "Assignment"),
  Average_Marks = c(
    mean(student_data$Internal_Test1, na.rm = TRUE),
    mean(student_data$Internal_Test2, na.rm = TRUE),
    mean(student_data$Assignment_Marks, na.rm = TRUE)
  )
)

ggplot(test_avg, aes(x = Assessment, y = Average_Marks, group = 1)) +
  geom_line(color = "blue", linewidth = 1) +
  geom_point(size = 3) +
  labs(
    title = "Performance Trend Across Assessments",
    x = "Assessment Type",
    y = "Average Marks"
  ) +
  theme_minimal()

# ================================
# PIE CHART: FINAL GRADE DISTRIBUTION
# ================================
grade_dist <- table(student_data$Final_Grade)

pie(
  grade_dist,
  col = rainbow(length(grade_dist)),
  main = "Final Grade Distribution of Students"
)
