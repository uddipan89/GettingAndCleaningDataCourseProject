# Code Book

### Data Source:
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
### Full Description at:
  
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Output Data:
  
  cleanData1.txt :
    
    cleanData1.txt is a 10299x68 data frame.

      * The first column contains subject IDs.
      * The second column contains activity names.
      * The last 66 columns are measurements.
      * Subject IDs are integers between 1 and 30.
      
  cleanData2.txt :
  
    cleanData2.txt is a 180x68 data frame.

      * The first column contains subject IDs.
      * The second column contains activity names.
      * The averages for each of the 66 attributes are in columns 3-68

### Transformations:

  The script run_analysis.R performs the following process to clean up the data and create tiny data sets:

    * Merge the training and test sets to create one data set.

    * Reads features.txt and use only the measurements on the mean and standard deviation for each measurement.

    * Reads activity_labels.txt and apply activity names to name the activities in the data set.

    * Labels the data set with descriptive names. (Names are converted to lower case; underscores and brackets are removed.)

    * Merges the features with activity labels and subject IDs. The result is saved as cleanData1.txt.

    * The average of each measurement for each activity and each subject is merged to a second data set.
      The result is saved as cleanData2.txt

### Variables

* X_test - data of test/X_test.txt
* X_train - data of train/X_train.txt
* X - Measurement data. Combined data set of the two above variables
* labels_test - table contents of test/y_test.txt
* labels_train - table contents of train/y_train.txt
* label - Data Labels. Combined data set of the two above variables.
* subject_test - data of test/subject_test.txt
* subject_train - data of train/subject_train.txt
* subject - Subjects. Combined data set of the two above variables
* features - table contents of /features.txt
* column_names - logical vector of which features to use in the clean data set
* activity - table contents of activity_labels.txt.
* cleanData1 - clean data at the end of step 4
* cleanData2 - clean data derived from cleanData1 after applying the business logic.
