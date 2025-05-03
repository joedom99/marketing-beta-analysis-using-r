# ==========================================
# Marketing Beta Analysis – Peloton vs. Nike
# ==========================================
# Author: Joe Domaleski
# Website: https://blog.marketingdatascience.ai
# Created: May 2025
#
# Description:
# This script analyzes Marketing Beta—how sensitive a brand is to movements
# in its broader market category—using normalized Google Trends data.
#
# It compares:
# 1. Peloton vs. Home Fitness
# 2. Nike vs. Running Shoes
#
# Outputs include regression summaries, visual plots, and a comparison summary.

# ----------------------------
# Step 1: Load Required Packages
# ----------------------------
# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("readr")

library(ggplot2)  # For plotting
library(dplyr)    # For data manipulation
library(readr)    # For reading CSVs

# ----------------------------
# Step 2: Load Peloton Data
# ----------------------------
peloton_data <- read_csv("multiTimeline.csv", skip = 1)
colnames(peloton_data) <- c("date", "home_fitness", "peloton")
peloton_data$date <- as.Date(peloton_data$date)

# ----------------------------
# Step 3: Run Regression – Peloton
# ----------------------------
peloton_model <- lm(peloton ~ home_fitness, data = peloton_data)

# Print regression output for reference
cat("\n--- Peloton Regression Output ---\n")
print(summary(peloton_model))

# Extract beta and R²
peloton_beta <- coef(peloton_model)["home_fitness"]
peloton_r2 <- summary(peloton_model)$r.squared

# ----------------------------
# Step 4: Plot – Peloton
# ----------------------------
ggplot(peloton_data, aes(x = home_fitness, y = peloton)) +
  geom_point(color = "darkblue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(
    title = "Marketing Beta: Peloton vs. Home Fitness",
    x = "Home Fitness Search Interest",
    y = "Peloton Search Interest"
  ) +
  annotate("text",
           x = max(peloton_data$home_fitness) * 0.6,
           y = max(peloton_data$peloton) * 0.9,
           label = paste0("Marketing Beta = ", round(peloton_beta, 2)),
           size = 5,
           color = "black") +
  theme_minimal()

# ----------------------------
# Step 5: Load Nike Data
# ----------------------------
nike_data <- read_csv("multiTimeline-2.csv", skip = 1)
colnames(nike_data) <- c("date", "running_shoes", "nike")
nike_data$date <- as.Date(nike_data$date)

# ----------------------------
# Step 6: Run Regression – Nike
# ----------------------------
nike_model <- lm(nike ~ running_shoes, data = nike_data)

# Print regression output for reference
cat("\n--- Nike Regression Output ---\n")
print(summary(nike_model))

# Extract beta and R²
nike_beta <- coef(nike_model)["running_shoes"]
nike_r2 <- summary(nike_model)$r.squared

# ----------------------------
# Step 7: Plot – Nike
# ----------------------------
ggplot(nike_data, aes(x = running_shoes, y = nike)) +
  geom_point(color = "darkblue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(
    title = "Marketing Beta: Nike vs. Running Shoes",
    x = "Running Shoes Search Interest",
    y = "Nike Search Interest"
  ) +
  annotate("text",
           x = max(nike_data$running_shoes) * 0.6,
           y = max(nike_data$nike) * 0.9,
           label = paste0("Marketing Beta = ", round(nike_beta, 2)),
           size = 5,
           color = "black") +
  theme_minimal()

# ----------------------------
# Step 8: Print Comparison Summary
# ----------------------------
# Wrap Step 8 in a function to suppress echo when sourcing with echo = TRUE

print_summary <- function() {
  cat("\n============================================\n")
  cat("Comparison Summary:\n")
  cat("--------------------------------------------\n")
  cat("Peloton vs. Home Fitness\n")
  cat("  Marketing Beta:", round(peloton_beta, 3), "\n")
  cat("  R²:", round(peloton_r2, 3), "\n\n")
  
  cat("Nike vs. Running Shoes\n")
  cat("  Marketing Beta:", round(nike_beta, 3), "\n")
  cat("  R²:", round(nike_r2, 3), "\n")
  cat("============================================\n\n")
}

# Call the function — this won't echo the inner cat() lines
print_summary()

# ----------------------------
# Step 9: Time-Series Line Plot – Peloton vs. Home Fitness
# Added for historical context 2020-2025
# ----------------------------
ggplot(peloton_data, aes(x = date)) +
  geom_line(aes(y = home_fitness, color = "Home Fitness"), linewidth = 1) +
  geom_line(aes(y = peloton, color = "Peloton"), linewidth = 1) +
  labs(
    title = "Search Interest Over Time: Peloton vs. Home Fitness",
    x = "Date",
    y = "Search Interest (Normalized)",
    color = "Search Term"
  ) +
  scale_color_manual(values = c("Home Fitness" = "gray30", "Peloton" = "steelblue")) +
  theme_minimal()
