---
  title: 'Data Structures in R: Guided Project'
  author: "Michael Opiekun"
  date: "3/31/2021"
  output: html_document
---

library(tidyverse)
library(readr)
covid_df <- read.csv("~/Downloads/covid19.csv")
dim(covid_df)
vector_cols <- colnames(covid_df)
vector_cols
head(covid_df)
glimpse(covid_df)
covid_df_all_states <- covid_df %>% filter(Province_State == "All States")
covid_df_all_states[-5];
covid_df_all_states_daily <-  select(covid_df_all_states, Date, Country_Region, active, hospitalizedCurr, daily_tested, daily_positive)
glimpse(covid_df_all_states_daily)
covid_df_all_states_daily_sum <-covid_df_all_states_daily %>% group_by(Country_Region) %>% summarize(tested = sum(daily_tested),
                                                                        positve = sum(daily_positive),
                                                                        active =  sum(active),
                                                                        hospitalized = sum(hospitalizedCurr)) %>%
arrange(-tested)
head(covid_df_all_states_daily_sum)
covid_top_10 <- head(covid_df_all_states_daily_sum, 10)
covid_top_10
countries <- covid_top_10$Country_Region
tested_cases <- covid_top_10$tested
positive_cases <- covid_top_10$positve
active_cases <- covid_top_10$active
hospitalized_cases <- covid_top_10$hospitalized
names(tested_cases) <- countries
names(positive_cases) <- countries
names(active_cases) <- countries
names(hospitalized_cases) <- countries
positive_tested_top_3 <- head(positive_cases/tested_cases,3)
positive_tested_top_3



united_kingdom <- c(0.11, 1473672, 166909, 0, 0)
united_states <- c(0.10, 17282363, 1877179, 0, 0)
turkey <- c(0.08, 2031192, 163941, 2980960, 0)
covid_mat <- rbind(united_kingdom, united_states, turkey)
colnames(covid_mat) <- c("Ratio", "tested", "positive", "active", "hospitalized")
covid_mat
question <- "Which countries have had the highest number of positive cases against the number of tests?"
answer <- c("Positive tested cases" = positive_tested_top_3)
dataframes <- list(covid_df, covid_df_all_states, covid_df_all_states_daily, covid_top_10)
Matrixs <- list(covid_mat)
Vectors <- list(vector_cols, countries, active_cases, hospitalized_cases, positive_cases,positive_tested_top_3,tested_cases,turkey,united_kingdom,united_states)
data_structure_list <- list("dataframes" = dataframes, "Matrixs" = Matrixs, "Vectors" = Vectors)
covid_analyst_list <- list("question" = question, "answer" = answer, "data_structure_list" = data_structure_list)
covid_analyst_list[[2]]
