detect_missing_values <- function(data){
  missing_counts <- numeric(ncol(data))
  names(missing_counts) <- colnames(data)
  
  for(i in 1:ncol(data)){
    missing_counts[i] <- sum(is.na(data[[i]]))
  }
  missing_counts <- missing_counts[missing_counts > 0]
  return (missing_counts)
}

data <- data.frame(
  A = c(11,22,NA,44,55),
  B = c(NA,22,33,44,55),
  C = c(11,22,33,44,55)
)

print("Dataset before imputation:")
print(data)

impute_median <- function(x) {
  ifelse(is.na(x), median(x, na.rm = TRUE), x)
}

data_imputed <- data %>%
  mutate(across(everything(), impute_median))

print("Imputed Data:")
print(data_imputed)








