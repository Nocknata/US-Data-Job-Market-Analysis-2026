collect_jobs <- function(role, n_jobs = 2000, per_page = 20) {
  
  n_pages <- ceiling(n_jobs / per_page)
  
  all_jobs <- list()
  
  for (page in 1:n_pages) {
    
    cat("Collecting", role, "- page", page, "of", n_pages, "\n")
    
    url <- paste0(
      "https://api.adzuna.com/v1/api/jobs/us/search/",
      page
    )
    
    response <- request(url) |>
      req_url_query(
        app_id = APP_ID,
        app_key = APP_KEY,
        results_per_page = per_page,
        what = role
      ) |>
      req_perform()
    
    page_data <- resp_body_json(response)
    
    if (length(page_data$results) == 0) {
      cat("No more jobs available.\n")
      break
    }
    
    all_jobs <- c(all_jobs, page_data$results)
    
    Sys.sleep(0.2)
  }
  
  all_jobs <- all_jobs[1:min(n_jobs, length(all_jobs))]
  
  return(all_jobs)
}
test_jobs <- collect_jobs(
  role = "Data Scientist",
  n_jobs = 40,
  per_page = 20
)
length(test_jobs)
test_df <- do.call(
  rbind,
  lapply(test_jobs, function(x) {
    
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
      stringsAsFactors = FALSE
    )
    
  })
)
head(test_df)
dim(test_df)
data_scientist <- collect_jobs("Data Scientist", 2000)
data_analyst <- collect_jobs("Data Analyst", 2000)
data_engineer <- collect_jobs("Data Engineer", 2000)

length(data_scientist)
