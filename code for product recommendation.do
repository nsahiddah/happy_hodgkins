Stata Codes for Product Recommendation
*****After Principal Component Analysis Clusters (code done in the other file)
g product_recommend="Berries (Mood relief) and Heat Pack(Cramp relief)" if backache>0
*cramp (0.64) & mood(0.67) in backache
replace product_recommend="Heat Pack (Cramp and Sore relief)" if cramp>0
*sore (0.65) in cramps
replace product_recommend="Ginger tea fuse with mint" if diarrhea>0
*bloating (0.81) in diarrhea
replace product_recommend="Pistachio" if dizzy>0
*backache explains (0.79) variability in dizziness
replace product_recommend="Heat pack and Dark Chocolate" if mood<50
*sore (0.651) in mood
replace product_recommend="Ginger tea fuse with mint" if nausea>0
*nausea (0.8) in diarrhea
replace product_recommend="Heat Pack and Painkiller" if sore>0
*headache(0.8) in sore

******Others symptoms 
replace product_recommend="Aloe Vera gel" if acne>0
replace product_recommend="Ginger tea" if bloating>0
replace product_recommend="Pain-relieving" if headache>0


*****regression analysis to obtain coefficients*****
regress backache cramp mood 
predict backache_p
regress cramp sore
predict cramp_p
regress diarrhea bloating
predict diarrhea_p
regress dizzy backache
predict dizzy_p
regress mood sore
predict mood_p
regress diarrhea nausea
predict diarrhea_p
regress sore headache
predict sore_p

R
# load the libraries
library(caret)
library(klaR)
# define an 80%/20% train/test split of the dataset
split=0.80
trainIndex <- createDataPartition(symptomsonly$backache, p=split, list=FALSE)
data_train <- symptomsonly[ trainIndex,]
data_test <- symptonsonly[-trainIndex,]
# train a naive bayes model
model<- lm(backache~cramp+mood)
# make predictions
x_test <- data_test[,1:4]
y_test <- data_test[,5]
predictions <- predict(model, x_test)
# summarize results
confusionMatrix(predictions$class, y_test)
] 





