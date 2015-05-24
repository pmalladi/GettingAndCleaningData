The run_analysis.R assumes that the "UCI HAR Dataset/Train" and "UCI HAR Dataset/Test" sets are present in the Working Directory.
1. The "Subject" information is read into trn_s and tst_s from Train and Test datasets respectively
2. The information from trn_s and tst_s is merged into all_s
3. Since trn_s and tst_s variables are no longer needed, they are deleted
4. Column names of all_s are prefixed with s_

5. The "Measurements" information is read into trn_m and tst_m from Train and Test datasets respectively
6. The information from trn_m and tst_m is merged into all_m
7. Since trn_m and tst_m variables are no longer needed, they are deleted
8. Column names of all_m are prefixed with m_

9. The "Activity" information is read into trn_a and tst_a from Train and Test datasets respectively
10. The information from trn_a and tst_a is merged into all_a
11. Since trn_a and tst_a variables are no longer needed, they are deleted
12. Column names of all_a are prefixed with a_

13. Read the "features" file that describes the "measurements" into m_l
14. From m_l, extract only those that correspond to mean() and std() variables of measurements0 - save in req_cols
15. Now, filter all_m to extract only req_cols
16. Delete a_l variable

17. Merge all the information into all_data from all_s, all_m and all_a[,2]
18. Add descriptive names for the data
19. Delete the m_l, req_cols variables

20. Group all_data by Subject and Activity fields and save in all_data_gr
21. Delete all_data variable that is no longer needed
22. Summarise the all_data_gr on each variable
23. Write the summarized output to a txt file
