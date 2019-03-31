Stata Codes for Product Recommendation
*****Principal Component Analysis Clusters
g product_recommend="Berries (Mood relief) and Heat Pack(Cramp relief)" if backache>0
*cramp (0.64) & mood(0.67%) in backache
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
