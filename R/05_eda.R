library(ggplot2)
library(scales)
library(tidyr)
# 5.1 Load the final cleaned dataset
jobs_data <- read.csv(
  "jobs_data_cleaned_2026.csv",
  stringsAsFactors = FALSE
)

jobs_data$job_id <- as.character(jobs_data$job_id)

jobs_data$created <- as.POSIXct(
  jobs_data$created,
  tz = "UTC"
)


# Verify the dataset

dim(jobs_data)

str(jobs_data)

sum(duplicated(jobs_data$job_id))

summary(jobs_data$salary_midpoint)

# 5.2 Overall Salary Distribution
# Descriptive statistics

summary(jobs_data$salary_midpoint)

sd(jobs_data$salary_midpoint)

IQR(jobs_data$salary_midpoint)


# Salary distribution histogram

ggplot(
  jobs_data,
  aes(x = salary_midpoint)
) +
  geom_histogram(
    bins = 40,
    fill = "steelblue",
    color = "white"
  ) +
  stat_bin(
    bins = 40,
    aes(label = after_stat(count)),
    geom = "text",
    vjust = -0.3,
    size = 2.5
  ) +
  geom_vline(
    xintercept = median(jobs_data$salary_midpoint),
    linetype = "dashed",
    linewidth = 1,
    color = "red"
  ) +
  geom_vline(
    xintercept = mean(jobs_data$salary_midpoint),
    linetype = "dashed",
    linewidth = 1,
    color = "darkgreen"
  ) +
  scale_x_continuous(
    labels = scales::label_dollar()
  ) +
  labs(
    title = "Distribution of Salary Midpoints for Data Jobs",
    subtitle = "U.S. Data Analyst, Data Engineer, and Data Scientist job postings",
    x = "Annual Salary Midpoint",
    y = "Number of Job Postings",
    caption = "Source: Adzuna Jobs API, 2026"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(
      face = "bold",
      size = 16
    ),
    axis.title = element_text(
      face = "bold"
    )
  )



# 5.3 Salary Comparison by Role


# Salary summary by role

aggregate(
  salary_midpoint ~ role,
  data = jobs_data,
  FUN = summary
)


# Salary standard deviation by role

aggregate(
  salary_midpoint ~ role,
  data = jobs_data,
  FUN = sd
)


# Salary boxplot by role

ggplot(
  jobs_data,
  aes(
    x = role,
    y = salary_midpoint,
    fill = role
  )
) +
  geom_boxplot() +
  scale_y_continuous(
    labels = scales::label_dollar()
  ) +
  labs(
    title = "Salary Distribution by Data Role",
    subtitle = "Comparison of Data Analyst, Data Engineer, and Data Scientist job postings",
    x = "Data Role",
    y = "Annual Salary Midpoint",
    caption = "Source: Adzuna Jobs API, 2026"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(
      face = "bold",
      size = 16
    ),
    axis.title = element_text(
      face = "bold"
    )
  )



# 5.4 Technical Skills Overall


# Define technical skill columns
skill_columns <- c(
  "python", "sql", "r", "java", "javascript",
  "sas", "tableau", "power_bi", "excel",
  "aws", "azure", "gcp", "databricks",
  "snowflake", "spark", "hadoop",
  "tensorflow", "pytorch", "scikit_learn", "git"
)

skill_counts <- colSums(jobs_data[, skill_columns])

skill_counts <- sort(
  skill_counts,
  decreasing = TRUE
)

skill_summary <- data.frame(
  skill = names(skill_counts),
  count = as.numeric(skill_counts)
)

skill_summary$percentage <-
  skill_summary$count / nrow(jobs_data) * 100

top10_skills <- head(skill_summary, 10)

ggplot(
  top10_skills,
  aes(
    x = reorder(skill, count),
    y = count
  )
) +
  geom_col(
    fill = "steelblue"
  ) +
  geom_text(
    aes(label = count),
    hjust = -0.2,
    size = 4
  ) +
  coord_flip() +
  labs(
    title = "Top 10 Technical Skills in Data Job Postings",
    subtitle = "Skills mentioned in available job-description excerpts",
    x = "Technical Skill",
    y = "Number of Job Postings",
    caption = "Source: Adzuna Jobs API, 2026"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(
      face = "bold",
      size = 16
    ),
    axis.title = element_text(
      face = "bold"
    )
  ) +
  expand_limits(
    y = max(top10_skills$count) * 1.1
  )

skills_by_role <- aggregate(
  jobs_data[, skill_columns],
  by = list(role = jobs_data$role),
  FUN = sum
)

skills_by_role

skills_by_role_pct <- skills_by_role

role_counts <- table(jobs_data$role)

for (i in 2:ncol(skills_by_role_pct)) {
  
  skills_by_role_pct[, i] <-
    skills_by_role_pct[, i] /
    as.numeric(
      role_counts[skills_by_role_pct$role]
    ) * 100
}

skills_by_role_pct

skills_by_role

skills_by_role_pct

skills_role_long <- skills_by_role_pct |>
  pivot_longer(
    cols = -role,
    names_to = "skill",
    values_to = "percentage"
  )

skills_role_top10 <- skills_role_long[
  skills_role_long$skill %in% top10_skills$skill,
]

ggplot(
  skills_role_top10,
  aes(
    x = skill,
    y = percentage,
    fill = role
  )
) +
  geom_col(
    position = "dodge"
  ) +
  scale_fill_manual(
    values = c(
      "Data Analyst" = "#4E79A7",
      "Data Engineer" = "#59A14F",
      "Data Scientist" = "#E15759"
    )
  ) +
  scale_y_continuous(
    labels = scales::label_percent(scale = 1)
  ) +
  labs(
    title = "Technical Skills by Data Role",
    subtitle = "Percentage of job-description excerpts mentioning each skill",
    x = "Technical Skill",
    y = "Percentage of Job Postings",
    fill = "Data Role",
    caption = "Source: Adzuna Jobs API, 2026"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(
      face = "bold",
      size = 16
    ),
    axis.title = element_text(
      face = "bold"
    ),
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    )
  )
