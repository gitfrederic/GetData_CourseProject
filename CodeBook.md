# Code Book

The 'run_analysis.R' code generates the following output ('tidy_dataset.txt') using the UCI HAR Dataset<sup>1</sup> found at:

* <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


The 'tidy_dataset.txt' file is a **tab-delimited** (also known as 'tab-separated') text file.

NOTE: The following is mostly based on the description provided by the 'features_info.txt' file of the UCI HAR Dataset.

The data in the 'tidy_dataset.txt' file comes from the accelerometer and gyroscope 3-axial raw signals named 'tAcc-XYZ' and 'tGyro-XYZ'. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The following is a descrption of each column (field) in the **tidy_dataset.txt** data set:

<table>
    <tr>
        <th>Field #</th>
        <th>Name</th>
        <th>Data Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>1</td>
        <td>subject</td>
        <td>categorical</td>
        <td>An identifier of the subject who carried out the experiment.</td>
    </tr>
    <tr>
        <td>2</td>
        <td>activity</td>
        <td>categorical</td>
        <td>An activity name (one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).</td>
    </tr>
    <tr>
        <td>3</td>
        <td>meanoftbodyaccelerationmeanx</td>
        <td>continuous</td>
        <td>Mean of the tBodyAcc Mean X values.</td>
    </tr>
    <tr>
        <td>4</td>
        <td>meanoftbodyaccelerationstdx</td>
        <td>continuous</td>
        <td>Mean of the tBodyAcc Standard Deviation X values.</td>
    </tr>

    <tr>
        <td>5</td>
        <td>meanoftbodyaccelerationmeany</td>
        <td>continuous</td>
        <td>Mean of the tBodyAcc Mean Y values.</td>
    </tr>
    <tr>
        <td>6</td>
        <td>meanoftbodyaccelerationstdy</td>
        <td>continuous</td>
        <td>Mean of the tBodyAcc Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>7</td>
        <td>meanoftbodyaccelerationmeanz</td>
        <td>continuous</td>
        <td>Mean of the tBodyAcc Mean Z values.</td>
    </tr>
    <tr>
        <td>8</td>
        <td>meanoftbodyaccelerationstdz</td>
        <td>continuous</td>
        <td>Mean of the tBodyAcc Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>9</td>
        <td>meanoftgravityaccelerationmeanx</td>
        <td>continuous</td>
        <td>Mean of the tGravityAcc Mean X values.</td>
    </tr>
    <tr>
        <td>10</td>
        <td>meanoftgravityaccelerationstdx</td>
        <td>continuous</td>
        <td>Mean of the tGravityAcc Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>11</td>
        <td>meanoftgravityaccelerationmeany</td>
        <td>continuous</td>
        <td>Mean of the tGravityAcc Mean Y values.</td>
    </tr>
    <tr>
        <td>12</td>
        <td>meanoftgravityaccelerationstdy</td>
        <td>continuous</td>
        <td>Mean of the tGravityAcc Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>13</td>
        <td>meanoftgravityaccelerationmeanz</td>
        <td>continuous</td>
        <td>Mean of the tGravityAcc Mean Z values.</td>
    </tr>
    <tr>
        <td>14</td>
        <td>meanoftgravityaccelerationstdz</td>
        <td>continuous</td>
        <td>Mean of the tGravityAcc Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>15</td>
        <td>meanoftbodyaccelerationjerkmeanx</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerk Mean X values.</td>
    </tr>
    <tr>
        <td>16</td>
        <td>meanoftbodyaccelerationjerkstdx</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerk Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>17</td>
        <td>meanoftbodyaccelerationjerkmeany</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerk Mean Y values.</td>
    </tr>
    <tr>
        <td>18</td>
        <td>meanoftbodyaccelerationjerkstdy</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerk Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>19</td>
        <td>meanoftbodyaccelerationjerkmeanz</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerk Mean Z values.</td>
    </tr>
    <tr>
        <td>20</td>
        <td>meanoftbodyaccelerationjerkstdz</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerk Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>21</td>
        <td>meanoftbodygyromeanx</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyro Mean X values.</td>
    </tr>
    <tr>
        <td>22</td>
        <td>meanoftbodygyrostdx</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyro Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>23</td>
        <td>meanoftbodygyromeany</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyro Mean Y values.</td>
    </tr>
    <tr>
        <td>24</td>
        <td>meanoftbodygyrostdy</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyro Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>25</td>
        <td>meanoftbodygyromeanz</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyro Mean Z values.</td>
    </tr>
    <tr>
        <td>26</td>
        <td>meanoftbodygyrostdz</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyro Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>27</td>
        <td>meanoftbodygyrojerkmeanx</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerk Mean X values.</td>
    </tr>
    <tr>
        <td>28</td>
        <td>meanoftbodygyrojerkstdx</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerk Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>29</td>
        <td>meanoftbodygyrojerkmeany</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerk Mean Y values.</td>
    </tr>
    <tr>
        <td>30</td>
        <td>meanoftbodygyrojerkstdy</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerk Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>31</td>
        <td>meanoftbodygyrojerkmeanz</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerk Mean Z values.</td>
    </tr>
    <tr>
        <td>32</td>
        <td>meanoftbodygyrojerkstdz</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerk Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>33</td>
        <td>meanoftbodyaccelerationmagmean</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccMag Mean values.</td>
    </tr>
    <tr>
        <td>34</td>
        <td>meanoftbodyaccelerationmagstd</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccMag Standard Deviation values.</td>
    </tr>

    <tr>
        <td>35</td>
        <td>meanoftgravityaccelerationmagmean</td>
        <td>continuous</td>
        <td>Mean of the tGravityAccMag Mean values.</td>
    </tr>
    <tr>
        <td>36</td>
        <td>meanoftgravityaccelerationmagstd</td>
        <td>continuous</td>
        <td>Mean of the tGravityAccMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>37</td>
        <td>meanoftbodyaccelerationjerkmagmean</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerkMag Mean values.</td>
    </tr>
    <tr>
        <td>38</td>
        <td>meanoftbodyaccelerationjerkmagstd</td>
        <td>continuous</td>
        <td>Mean of the tBodyAccJerkMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>39</td>
        <td>meanoftbodygyromagmean</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroMag Mean values.</td>
    </tr>
    <tr>
        <td>40</td>
        <td>meanoftbodygyromagstd</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>41</td>
        <td>meanoftbodygyrojerkmagmean</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerkMag Mean values.</td>
    </tr>
    <tr>
        <td>42</td>
        <td>meanoftbodygyrojerkmagstd</td>
        <td>continuous</td>
        <td>Mean of the tBodyGyroJerkMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>43</td>
        <td>meanoffbodyaccelerationmeanx</td>
        <td>continuous</td>
        <td>Mean of the fBodyAcc Mean X values.</td>
    </tr>
    <tr>
        <td>44</td>
        <td>meanoffbodyaccelerationstdx</td>
        <td>continuous</td>
        <td>Mean of the fBodyAcc Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>45</td>
        <td>meanoffbodyaccelerationmeany</td>
        <td>continuous</td>
        <td>Mean of the fBodyAcc Mean Y values.</td>
    </tr>
    <tr>
        <td>46</td>
        <td>meanoffbodyaccelerationstdy</td>
        <td>continuous</td>
        <td>Mean of the fBodyAcc Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>47</td>
        <td>meanoffbodyaccelerationmeanz</td>
        <td>continuous</td>
        <td>Mean of the fBodyAcc Mean Z values.</td>
    </tr>
    <tr>
        <td>48</td>
        <td>meanoffbodyaccelerationstdz</td>
        <td>continuous</td>
        <td>Mean of the fBodyAcc Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>49</td>
        <td>meanoffbodyaccelerationjerkmeanx</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccJerk Mean X values.</td>
    </tr>
    <tr>
        <td>50</td>
        <td>meanoffbodyaccelerationjerkstdx</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccJerk Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>51</td>
        <td>meanoffbodyaccelerationjerkmeany</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccJerk Mean Y values.</td>
    </tr>
    <tr>
        <td>52</td>
        <td>meanoffbodyaccelerationjerkstdy</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccJerk Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>53</td>
        <td>meanoffbodyaccelerationjerkmeanz</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccJerk Mean Z values.</td>
    </tr>
    <tr>
        <td>54</td>
        <td>meanoffbodyaccelerationjerkstdz</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccJerk Standard Deviation Z values.</td>
    </tr>
    
    <tr>
        <td>55</td>
        <td>meanoffbodygyromeanx</td>
        <td>continuous</td>
        <td>Mean of the fBodyGyro Mean X values.</td>
    </tr>
    <tr>
        <td>56</td>
        <td>meanoffbodygyrostdx</td>
        <td>continuous</td>
        <td>Mean of the fBodyGyro Standard Deviation X values.</td>
    </tr>
    
    <tr>
        <td>57</td>
        <td>meanoffbodygyromeany</td>
        <td>continuous</td>
        <td>Mean of the fBodyGyro Mean Y values.</td>
    </tr>
    <tr>
        <td>58</td>
        <td>meanoffbodygyrostdy</td>
        <td>continuous</td>
        <td>Mean of the fBodyGyro Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>59</td>
        <td>meanoffbodygyromeanz</td>
        <td>continuous</td>
        <td>Mean of the fBodyGyro Mean Y values.</td>
    </tr>
    <tr>
        <td>60</td>
        <td>meanoffbodygyrostdz</td>
        <td>continuous</td>
        <td>Mean of the fBodyGyro Standard Deviation Y values.</td>
    </tr>
    
    <tr>
        <td>61</td>
        <td>meanoffbodyaccelerationmagmean</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccMag Mean values.</td>
    </tr>
    <tr>
        <td>62</td>
        <td>meanoffbodyaccelerationmagstd</td>
        <td>continuous</td>
        <td>Mean of the fBodyAccMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>63</td>
        <td>meanoffbodybodyaccelerationjerkmagmean</td>
        <td>continuous</td>
        <td>Mean of the fBodyBodyAccJerkMag Mean values.</td>
    </tr>
    <tr>
        <td>64</td>
        <td>meanoffbodybodyaccelerationjerkmagstd</td>
        <td>continuous</td>
        <td>Mean of the fBodyBodyAccJerkMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>65</td>
        <td>meanoffbodybodygyromagmean</td>
        <td>continuous</td>
        <td>Mean of the fBodyBodyGyroMag Mean values.</td>
    </tr>
    <tr>
        <td>66</td>
        <td>meanoffbodybodygyromagstd</td>
        <td>continuous</td>
        <td>Mean of the fBodyBodyGyroMag Standard Deviation values.</td>
    </tr>
    
    <tr>
        <td>67</td>
        <td>meanoffbodybodygyrojerkmagmean</td>
        <td>continuous</td>
        <td>Mean of the fBodyBodyGyroMag Mean values.</td>
    </tr>
    <tr>
        <td>68</td>
        <td>meanoffbodybodygyrojerkmagstd</td>
        <td>continuous</td>
        <td>Mean of the fBodyBodyGyroMag Standard Deviation values.</td>
    </tr>
</table>


As such, there are 68 columns (fields).

There are 81 rows in the data set: one header row, followed by one row per subject (30) multiplied by the number of activities (6).


### Reference

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

