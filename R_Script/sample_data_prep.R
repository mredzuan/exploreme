#Load library--------

library(xlsx)


## CSV sample----------------

df_iris <- iris

### save to csv format------
write.csv(df_iris, "dataset_example/iris.csv", row.names = FALSE)



## Excel sample----------------

df_excel <- mtcars

#convert row name to columns abd remove row name-
df_excel$car_name <- rownames(df_excel)

#Remove row name
rownames(df_excel) <- NULL

#write to excel format
write.xlsx(df_excel, "dataset_example/mtcars.xlsx", row.names = FALSE)


