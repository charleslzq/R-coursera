complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  nobs <- numeric();
  for(i in id){
    if(i < 10){
      prefix <- "00";
    }
    else if(i < 100){
      prefix <- "0";
    }
    else{
      prefix <- "";
    }
    name <- paste(directory, "/", prefix, i, ".csv", sep="");
    table <- read.csv(name);
    nobs <- c(nobs, sum(complete.cases(table)));
  }
  data.frame(id,nobs);
}