jobs_to_dataframe <- function(jobs) {
  
  do.call(
    rbind,
    lapply(jobs, function(x) {
      
      data.frame(
        job_id = x$id,
        title = x$title,
        company = x$company$display_name,
        location = x$location$display_name,
        salary_min = x$salary_min,
        salary_max = x$salary_max,
        created = x$created,
        category = x$category$label,
        contract_time = ifelse(
          is.null(x$contract_time),
          NA,
          x$contract_time
        ),
        redirect_url = x$redirect_url,
        description = x$description,  # <-- NEW
        stringsAsFactors = FALSE
      )
      
    })
  )
}

df_scientist <- jobs_to_dataframe(data_scientist)

df_analyst <- jobs_to_dataframe(data_analyst)

df_engineer <- jobs_to_dataframe(data_engineer)

df_scientist$role <- "Data Scientist"
df_analyst$role <- "Data Analyst"
df_engineer$role <- "Data Engineer"

jobs_data <- rbind(
  df_scientist,
  df_analyst,
  df_engineer
)

dim(jobs_data)

"description" %in% names(jobs_data)

sum(duplicated(jobs_data$job_id))
table(jobs_data$title)

sort(table(jobs_data$title), decreasing = TRUE)[1:20]

table(jobs_data$role)

sum(is.na(jobs_data$description))
sum(jobs_data$description == "", na.rm = TRUE)

jobs_data$description[1:3]

nchar(jobs_data$description[1:10])

summary(nchar(jobs_data$description))

table(nchar(jobs_data$description) == 500)

jobs_data$description_clean <- tolower(jobs_data$description)
jobs_data$description_clean[1]
