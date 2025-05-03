# Marketing Beta Analysis

![R](https://img.shields.io/badge/R-4.3.1-blue?logo=r)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

Analyze your brand's sensitivity to market trends using the concept of **Marketing Beta**—a marketing adaptation of the well-known financial metric.

This project accompanies the blog post:  
👉 [**What’s Your Marketing Beta? How to Measure Your Brand’s Sensitivity to the Market**](https://blog.marketingdatascience.ai)

---

## 📈 About

This repo contains an R script that calculates and visualizes **Marketing Beta** by analyzing the relationship between:

- **Peloton vs. Home Fitness** (high beta)
- **Nike vs. Running Shoes** (low beta)

Google Trends data is used as a proxy for brand and market interest.

---

## 🧠 What is Marketing Beta?

**Marketing Beta** measures how closely a brand’s popularity follows its broader market category.  
Higher values mean the brand is more volatile and market-sensitive.  
Lower values suggest the brand is more independent or stable.

---

## 📁 Files

- `marketing-beta.R` – Full R script with regression models, plots, and analysis.
- `multiTimeline.csv` – Google Trends export for *Peloton* and *Home Fitness*.
- `multiTimeline-2.csv` – Google Trends export for *Nike* and *Running Shoes*.

---

## ▶️ How to Run

1. Open R or RStudio.
2. Make sure the following packages are installed (you can uncomment those lines in the code):
   ```r
   install.packages(c("ggplot2", "dplyr", "readr"))
   ```
3. Source the script:
   ```r
   source("marketing-beta.R", echo = TRUE)
   ```
4. View the regression output and three plots:
   - Peloton Beta Plot
   - Nike Beta Plot
   - Time-series trends over 5 years

---

## 📜 License

MIT License.  
See the [LICENSE](LICENSE) file for details.

---

## ✍️ Author

**Joe Domaleski**  
Marketing Data Science  
🌐 [blog.marketingdatascience.ai](https://blog.marketingdatascience.ai)
