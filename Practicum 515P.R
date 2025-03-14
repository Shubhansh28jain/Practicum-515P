# Load required libraries
library(readxl)
library(dplyr)
library(ggplot2)
library(tidyr)

# Load both sheets from the Excel file
df1 <- read_excel("C:/Users/KIIT/Downloads/nfl_elo_latest.xlsx", sheet = 1)
df2 <- read_excel("C:/Users/KIIT/Downloads/nfl_elo_latest.xlsx", sheet = 2)

# Check structure of datasets
str(df1)
str(df2)

# Identify columns that should be numeric
numeric_columns <- c("elo1_pre", "elo2_pre", "elo1_post", "elo2_post", "score1", "score2",
                     "qb1_value_pre", "qb2_value_pre", "qb1_adj", "qb2_adj", 
                     "qb1_value_post", "qb2_value_post")

# Convert to numeric (if character) in both datasets
df1[numeric_columns] <- lapply(df1[numeric_columns], as.numeric)
df2[numeric_columns] <- lapply(df2[numeric_columns], as.numeric)

# Convert 'playoff' column to logical (TRUE/FALSE) to maintain consistency
df1$playoff <- as.logical(df1$playoff)
df2$playoff <- as.logical(df2$playoff)

# Now merge the datasets
df <- bind_rows(df1, df2)


# Combine the two datasets into one
df <- bind_rows(df1, df2)

# Identify missing values
sum(is.na(df))

df <- df %>% drop_na() # Remove rows with missing values

# Convert necessary columns to appropriate data types
df$date <- as.Date(df$date)
df$season <- as.numeric(df$season)

df <- df %>% mutate(winner = ifelse(score1 > score2, team1, team2)) # Create winner column

# Generate histogram for team Elo ratings
ggplot(df, aes(x = elo1_pre)) +
  geom_histogram(binwidth = 50, fill = "blue", color = "black") +
  ggtitle("Distribution of Team Elo Ratings Before Game") +
  xlab("Elo Rating") +
  ylab("Frequency")

# Generate boxplot for score differences
str(df1$score1)
str(df2$score1)
df1$score1 <- as.numeric(df1$score1)
df2$score1 <- as.numeric(df2$score1)

df1$score2 <- as.numeric(df1$score2)
df2$score2 <- as.numeric(df2$score2)
df <- bind_rows(df1, df2) %>% drop_na(score1, score2)
sum(!is.na(df$score1))
sum(!is.na(df$score2))
ggplot(df, aes(x = "", y = abs(score1 - score2))) +
  geom_boxplot(fill = "red") +
  ggtitle("Boxplot of Score Differences") +
  ylab("Score Difference")

# Save cleaned dataset
write.csv(df, "C:/Users/KIIT/Downloads/cleaned_nfl_elo_new.csv", row.names = FALSE)

