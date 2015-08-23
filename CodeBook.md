### Code Book

Here is the explanation of all the tasks performed to clean the data and details about the output files.

The data was obtained from UCI Machine Learning Repository. The dataset was of mobile accelerometer readings and the activity levels of different subjects. Here are the steps performed for cleaning the data.

* The data was downloaded from the reposiory
* The training and testing datasets were obtained as data frames
* The feature and activity labels were obtained to name the variables in the dataset meaningful
* The test and training datasets were merged together 
* The mean and std measurements were filtered from the feature labels by regular expressions.
* The dataset was filtered for mean readings (X columns)
* Assigned activity labels for better readability in place of activity IDs
* The data frame was saved as CSV file "filtered_data_merged.csv"
* The average values of measurements were calculated per subject and activity using data table.
* The output file was saved in "average_data.txt"
