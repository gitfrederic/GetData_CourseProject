# README

This repository contains R code and the related documentation required for the Coursera Data Science / Getting and Cleaning Data course project.

The raw data can be obtained from:

* <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip><sup>1</sup>


The data used for this project was downloaded from the link above on Tuesday May 20th, 2014.

The following files were used within the 'getdata-projectfiles-UCI HAR Dataset.zip' archive (all other files were ignored):
* UCI HAR Dataset/test/X_test.txt
* UCI HAR Dataset/test/y_test.txt
* UCI HAR Dataset/train/X_train.txt
* UCI HAR Dataset/train/y_train.txt


The codebook for this project can be found in a file named **CodeBook.md** in this repository.

The R file named **run_analysis.R** (also in this repository) was used to generate the output data submitted for the course project.

In the R file (run_analysis.R) is assumed that the 'getdata-projectfiles-UCI HAR Dataset.zip' file has been extracted into the current working directory.


## Instruction List

Using the raw data above, the tidy dataset can be created as follows:

**Step 1**: Clone this Git repository.

**Step 2**: Copy the 'getdata-projectfiles-UCI HAR Dataset.zip' archive into the cloned Git repository on your computer.

**Step 3**: Start R (or R Studio) and set the current working directory to the location of the cloned Git repository on your computer.

**Step 4**: Open and run the 'run_analysis.R' script in R (or RStudio).  This will produce a file named 'tidy_dataset.txt' in the working directory.


Refer to the **CodeBook.md** in this repository for information on how to interpret the 'tidy_dataset.txt' file.


The script was developed and tested in the following environment:

* **Computer Architecture**: 2.7 GHz Intel Core i7 / 8GB 1600 Mhz DDR3
* **Operating System**: Apple OSX v10.9.2
* **Software**: RStudio Version 0.98.507 with R Spring Dance (3.1.0)
* **R Packages** (in addition to base packages): reshape2_1.4



### Reference

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
