library(ggplot2)
library(ggthemes)
library(GGally)
library(ggdark)
library(dplyr)

#Defining the general colors to avoid hard coding  
fill_color = '#111111'
decoration_color = '#cccccc'
main1_color = '#f20675'
main2_color = '#1ce3cd'

#Set dark theme for black background
theme_set(dark_theme_gray())

# colors for for values
color_1 = "#478adb"
color_2 = "#cccccc"
color_3 = "#f20675"
color_4 = "#bcc048"
color_5 = "#1ce3cd"
color_6 = "#878484"

#First of all, we want to get a general idea about the structure, columns and some basic statistics
str(diamonds)
summary(diamonds)

#From all the variables, we can see that the price stands out more between the minimum and the maximum value.
#The 3rd quantile is only 28% of the whole price range. Therefore, we consider to have deeper look into it with a histogram.
ggplot(diamonds, aes(price)) +  
        geom_histogram(colour = "black", fill = "#01B8AA", binwidth =5000)

#looking into the outliers
ggplot(diamonds, aes(y = price)) + 
        geom_boxplot(fill=color_1) +  coord_flip()

# When checking the histogram, we can observe left skewed prices from 0-5000. 
#This is confirmed with the boxplot that 75% of the data is within 2400-5300. 
#This creates our basis for our price binning where we apply a three bin approach. 
#Each bin should have the same sample size to make sure that we can find patterns and reduce biases.
#2401: median
#5324: 75% quantile
#18823: max
breaks <- c(0,2401,5324,18823)
# create labels
tags <-c("cheap","normal", "expensive")
data <- diamonds
price_groups <- cut(data$price,
                    breaks=breaks, 
                    include.lowest=TRUE, 
                    right=FALSE, labels=tags)
# order factors
price_groups <- factor(price_groups, 
                       levels=tags, 
                       ordered = TRUE)
# add to dataset
data$price_group <- price_groups
table(data$price_group)

# prepare cheap
data_cheap <- data %>% filter(price_group == "cheap")
data_cheap_sample <- data_cheap[sample(nrow(data_cheap),200),]
# prepare normal
data_normal <- data %>% filter(price_group == "normal")
data_normal_sample <- data_normal[sample(nrow(data_normal),200),]
# prepare expensive
data_expensive <- data %>% filter(price_group == "expensive")
data_expensive_sample <- data_expensive[sample(nrow(data_expensive),200),]
# combine the samples into one dataset
sample <- rbind(data_cheap_sample, data_normal_sample, data_expensive_sample)
table(sample$price_group)   

#Parallel Coordinates
?ggparcoord

# Inital graph
ggparcoord(sample, columns=c(1,2,3,4), alphaLines=0.3)

# NO scaling and added color as a visual encoding
ggparcoord(sample, 
           columns=c(1,2,3,4), 
           groupColumn=11, 
           alphaLines=0.3, 
           order="anyClass", scale="globalminmax") +   
  scale_color_manual(values=c(color_1, color_2, color_3, color_4))

# Scaling and added color as a visual encoding
ggparcoord(sample, 
           columns=c(1,2,3,4), 
           groupColumn=11, 
           alphaLines=0.3, order="anyClass") +  
  scale_color_manual(values=c(color_1, color_2, color_3))

#With spline factor 
ggparcoord(sample, 
           columns=c(1,2,3,4),            
           groupColumn=11, alphaLines=0.6,            
           order="anyClass", splineFactor = 5,             
           showPoints=TRUE, scale="std") +  
  scale_color_manual(values=c(color_1, color_2, color_3, color_4))

# cheap
ggparcoord(sample, 
           columns=c(1,2,3,4),            
           groupColumn=11, alphaLines=0.1,            
           order="anyClass",           
           showPoints=TRUE,  scale="std") +  
  scale_color_manual(values=c(color_1, color_6, color_6))

# normal
ggparcoord(sample, 
           columns=c(1,2,3,4),            
           groupColumn=11, alphaLines=0.1,            
           order="anyClass",            
           showPoints=TRUE, 
           scale="std") +   
  scale_color_manual(values=c(color_6, color_1, color_6)) # Changed color for better visualization

# expensive
ggparcoord(sample, 
           columns=c(1,2,3,4),            
           groupColumn=11, alphaLines=0.1,            
           order="anyClass",           
           showPoints=TRUE, 
           scale="std") +  
  scale_color_manual(values=c(color_6, color_6, color_3))

#Create a small multiple for easy pattern comparison
ggparcoord(sample, 
           columns=c(1,2,3,4), 
           groupColumn=11, order="anyClass",           
           showPoints=TRUE, alphaLines=0.2, scale="std") + 
  scale_color_manual(values=c(color_1,color_2,color_3)) +    
  facet_wrap(. ~ price_group, ncol=1)
