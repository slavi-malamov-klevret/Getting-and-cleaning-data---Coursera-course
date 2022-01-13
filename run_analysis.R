x_train <- read.table('UCI HAR Dataset/train/X_train.txt')
x_test <- read.table('UCI HAR Dataset/test/X_test.txt')
merged_dfs <- rbind(x_train, x_test)
features <- read.table('UCI HAR Dataset/features.txt')
colnames(merged_dfs) <- features$V2
mean_columns <- grep('[m][e][a][n]()', names(merged_dfs), value = T)
std_columns <- grep('[s][t][d]()', names(merged_dfs), value = T)
merged_x_dataset <- select(merged_dfs, mean_columns, std_columns)

y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
activities <- c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')
y_train <- mutate(y_train, activities = factor(V1, labels = activities ))
y_train <- y_train['activities']
y_test <- mutate(y_test, activities = factor(V1, labels = activities ))
y_test <- y_test['activities']
merged_y_dataset <- rbind(y_train, y_test)

whole_dataset <- cbind(merged_x_dataset, merged_y_dataset)

df_gathered <- gather(whole_dataset, 'signal_and_measurement', 'value_of_the_measure', - activities)
separated_df <- separate(df_gathered, signal_and_measurement, c('signal', 'measurement'), sep = '-')
grouped_by_df <- group_by(separated_df, activities, signal, measurement)
final_df <- mutate(grouped_by_df, averaged_measure_by_group = mean(value_of_the_measure))