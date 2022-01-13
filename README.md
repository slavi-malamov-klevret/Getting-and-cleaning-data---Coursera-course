Steps taken:

1.  We load the data for `x_train, y_train, x_test, y_test`.

2.  We merge the training data, rename its columns and select only those
    variables that correspond to the mean() and std() literals.

3.  We extract the activities described in the activities.txt
    file(actually they are hardcoded). Afterwards we merge the test
    dataset and rename its column from V1 to activites.

4.  We merge the train and test datasets.

5.  When we load the dataset into a dataframe we transform its columns
    so they can contain only 1 variable - we make columns for the
    signal, measurment and the measured value by the signal.

6.  We group by the dataframe and find for every activity(totally 6),
    for evey signal and every measure the average measurement.

7.  Finally we save our date frame by the name `tidy_data.txt`
