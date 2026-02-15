# Load required libraries
library(ggplot2)
library(dplyr)
# Load your CSV (correct filename)
transactions_df <- read.csv("/Users/sugitha/Downloads/2.ecommerce_transactions.csv")

head(transactions_df)

# 1️⃣ Histogram of Transaction Amounts
ggplot(transactions_df, aes(x = Transaction_Amount)) +
  geom_histogram(binwidth = 50, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Transaction Amounts",
       x = "Transaction Amount",
       y = "Frequency") +
  theme_minimal()

# 2️⃣ Boxplot to detect outliers
ggplot(transactions_df, aes(y = Transaction_Amount)) +
  geom_boxplot(fill = "lightgreen", color = "darkgreen") +
  labs(title = "Boxplot of Transaction Amounts",
       y = "Transaction Amount") +
  theme_minimal()

# Extract and print outliers
outliers <- boxplot.stats(transactions_df$Transaction_Amount)$out
cat("Outliers in Transaction Amounts:\n")
print(outliers)

# 3️⃣ Monthly Sales Heatmap
# Convert Transaction_Date to Date type
transactions_df$Transaction_Date <- as.Date(transactions_df$Transaction_Date, format="%Y-%m-%d")

# Extract month-year
transactions_df$Month <- format(transactions_df$Transaction_Date, "%Y-%m")

# Aggregate total sales by month
monthly_sales <- transactions_df %>%
  group_by(Month) %>%
  summarise(Total_Sales = sum(Transaction_Amount), .groups = "drop")

# Heatmap
ggplot(monthly_sales, aes(x = Month, y = 1, fill = Total_Sales)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "yellow", high = "red") +
  labs(title = "Monthly Sales Heatmap",
       x = "Month",
       y = "",
       fill = "Total Sales") +
  theme_minimal() +
  theme(axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  coord_fixed(ratio = 0.1)
