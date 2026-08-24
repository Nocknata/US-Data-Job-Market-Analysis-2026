library(httr2)
library(jsonlite)

APP_ID <- Sys.getenv("ADZUNA_APP_ID")
APP_KEY <- Sys.getenv("ADZUNA_APP_KEY")

url <- "https://api.adzuna.com/v1/api/jobs/us/search/1"

response <- request(url) |>
  req_url_query(
    app_id = APP_ID,
    app_key = APP_KEY,
    results_per_page = 20,
    what = "Data Scientist"
  ) |>
  req_perform()
resp_status(response)

data <- resp_body_json(response)

data$count

length(data$results)

data_scientist_test <- data

head(data_scientist_test$results[[1]])

names(data_scientist_test$results[[1]])
