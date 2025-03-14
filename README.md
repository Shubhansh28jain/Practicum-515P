NFL Predictions Data Cleaning - ReadMe File

Project Overview
The 2020 NFL Predictions dataset must be cleaned and prepared for examination as part of this project. Elo ratings and predictions for each game of the most recent NFL season are included in the dataset. To make sure the data was prepared for additional analytical use, the main goal was to obtain, clean, and display it.

Files in This Repository
1. nfl_elo_latest.xlsx – The original dataset containing two sheets.
2. cleaned_nfl_elo_new.csv – The cleaned and processed dataset after data wrangling.
3. nfl_data_cleaning.R – The R script used for cleaning, transforming, and visualizing the data.
4. README.md – This file, providing an overview of the project.

Data Cleaning Process
The following steps were taken to clean and preprocess the dataset:
1. Data Loading: Imported both sheets from the Excel file into R.
2. Handling Missing Values: Identified and removed NA values from critical columns such as score1 and score2.
3. Data Type Conversion: Ensured numeric fields (e.g., elo1_pre, elo2_post, score1, score2) were correctly formatted.
4. Merging Data: Combined both datasets using bind_rows() after resolving inconsistencies.
5. Feature Engineering: Created new variables such as winner based on game scores.
6. Exploratory Data Analysis: Generated histograms and boxplots to detect outliers and trends.
7. Saving Clean Data: Exported the final dataset as cleaned_nfl_elo_new.csv for further use.

Key Visualizations
1. Histogram of Team Elo Ratings Before the Game – To assess the distribution of pre-game Elo ratings.
2. Boxplot of Score Differences – To analyze game result variations.

