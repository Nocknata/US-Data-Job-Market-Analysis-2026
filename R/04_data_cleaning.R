View(jobs_data)

str(jobs_data)

colSums(is.na(jobs_data))

sum(duplicated(jobs_data$job_id))

table(jobs_data$title)

jobs_data[jobs_data$job_id %in% jobs_data$job_id[duplicated(jobs_data$job_id)], ]

jobs_data <- jobs_data[!duplicated(jobs_data$job_id), ]

dim(jobs_data)

sum(duplicated(jobs_data$job_id))

summary(jobs_data)

# table(jobs_data$title)

table(jobs_data$role)

jobs_data[jobs_data$salary_min < 10000, ]

hourly_jobs <- jobs_data$salary_min < 10000

jobs_data$salary_min[hourly_jobs] <- jobs_data$salary_min[hourly_jobs] * 2080
jobs_data$salary_max[hourly_jobs] <- jobs_data$salary_max[hourly_jobs] * 2080
jobs_data[jobs_data$job_id %in% c(
  "5825811352",
  "5814076351",
  "5814076861"
), c("job_id", "title", "salary_min", "salary_max")]
summary(jobs_data[, c("salary_min", "salary_max")])
