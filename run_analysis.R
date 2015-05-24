  library(dplyr)
  
  ## 1.1 -- train and test "subject" info
  trn_s <- read.table("UCI HAR Dataset/train/subject_train.txt")
  tst_s <- read.table("UCI HAR Dataset/test/subject_test.txt")
  all_s <- rbind(trn_s, tst_s)
  rm("trn_s","tst_s")
  colnames(all_s) <- paste("s", colnames(all_s), sep = "_")
  
  ## 1.2 -- train and test "measurements" info
  trn_m <- read.table("UCI HAR Dataset/train/X_train.txt")
  tst_m <- read.table("UCI HAR Dataset/test/X_test.txt")
  all_m <- tbl_df(rbind(trn_m, tst_m))
  rm("trn_m", "tst_m")
  colnames(all_m) <- paste("m", colnames(all_m), sep = "_")
  
  ## 1.3 -- train and test "activity" info
  trn_a <- read.table("UCI HAR Dataset/train/y_train.txt")
  tst_a <- read.table("UCI HAR Dataset/test/y_test.txt")
  all_a <- rbind(trn_a, tst_a)
  rm("trn_a", "tst_a")
  colnames(all_a) <- paste("a", colnames(all_a), sep = "_")
  
  ## 2.1 -- extract only mean() and std() variables
  m_l   <- read.table("UCI HAR Dataset/features.txt")
  req_cols <- c(grep("mean[(][)]", m_l[,2]), grep("std[(][)]", m_l[,2]))
  all_m <- select(all_m, req_cols)
  
  ## 3.1 -- name the activities in the dataset
  a_l   <- read.table("UCI HAR Dataset/activity_labels.txt")
  all_a <- mutate(all_a, desc = a_l[all_a[,1],2], stringsAsFactors = FALSE)
  rm("a_l")
  
  ## merge all the info
  all_data <- cbind(all_s, all_m, all_a[,2])
  rm("all_s", "all_m", "all_a")
  
  ## 4.1 -- descriptive names for the variables
  colnames(all_data) <- c("Subject", as.vector(m_l[req_cols,2]), "Activity")
  rm("m_l", "req_cols")
  
  ## 5.1 -- new tidy, summary dataset
  all_data_gr <- group_by(all_data, Subject, Activity)
  rm("all_data")
  write.table(summarise_each(all_data_gr, funs(mean)), "tidyOutput.txt", row.names = FALSE)
