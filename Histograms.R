#Checking the version 

getRversion()

#Packages and libraries

#Install packages
if(!'ggplot2'%in%installed.packages()){
  install.packages('ggplot2')}
if(!'ggthemes'%in%installed.packages()){
  install.packages('ggthemes')}
if(!'nlme'%in%installed.packages()){
  install.packages('nlme')}
if(!'gapminder'%in%installed.packages()){
  install.packages('gapminder')}
if(!'gganimate'%in%installed.packages()){
  install.packages('gganimate')}
if(!'ggExtra'%in%installed.packages()){
  install.packages('ggExtra')}
if(!'psych'%in%installed.packages()){
  install.packages('psych')}
if(!'reshape2'%in%installed.packages()){
  install.packages('reshape2')}
if(!'dplyr'%in%installed.packages()){
  install.packages('dplyr')}
if(!'nycflights13'%in%installed.packages()){
  install.packages('nycflights13')}
if(!'ggcorrplot'%in%installed.packages()){
  install.packages('ggcorrplot')}
if(!'waffle'%in%installed.packages()){
  install.packages('waffle')}
if(!'tidyr'%in%installed.packages()){
  install.packages('tidyr')}
if(!'scales'%in%installed.packages()){
  install.packages('scales')}
if(!'ggalt'%in%installed.packages()){
  install.packages('ggalt')}
if(!'data.table'%in%installed.packages()){
  install.packages('data.table')}
if(!'extrafont'%in%installed.packages()){
  install.packages('extrafont')}
if(!'lubridate'%in%installed.packages()){
  install.packages('lubridate')}
if(!'DT'%in%installed.packages()){
  install.packages('DT')}
if(!'grid'%in%installed.packages()){
  install.packages('grid')}
if(!'gridExtra'%in%installed.packages()){
  install.packages('gridExtra')}
if(!"prettydoc" %in% installed.packages()) {
  install.packages("prettydoc")}
if(!"devtools" %in% installed.packages()) {
  install.packages("devtools")}
if(!"tidyverse" %in% installed.packages()) {
  install.packages("tidyverse")}
if(!"ggdark" %in% installed.packages()) {
  install.packages("ggdark")}
if(!"here" %in% installed.packages()) {
  install.packages("here")}
if(!"gifski" %in% installed.packages()) {
  install.packages("gifski")}
if(!"forcats" %in% installed.packages()) {
  install.packages("forcats")}
if(!"tufte" %in% installed.packages()) {
  install.packages("tufte")}
if(!"colorspace" %in% installed.packages()) {
  install.packages("colorspace")}
if(!"viridisLite" %in% installed.packages()) {
  install.packages("viridisLite")}
if(!"formatR" %in% installed.packages()) {
  install.packages("formatR")}
if(!"DiagrammeR" %in% installed.packages()) {
  install.packages("DiagrammeR")}
if(!"xaringan" %in% installed.packages()) {
  install.packages("xaringan")}
if(!"ggridges" %in% installed.packages()) {
  install.packages("ggridges")}
if(!"GGally" %in% installed.packages()) {
  install.packages("GGally")}
if(!"corrplot" %in% installed.packages()) {
  install.packages("corrplot")}
if(!"ggplot2movies" %in% installed.packages()) {
  install.packages("ggplot2movies")}
if(!"ggpointdensity" %in% installed.packages()) {
  install.packages("ggpointdensity")}
if(!"rstat" %in% installed.packages()) {
  install.packages("rstat")}
if(!"ggstatsplot" %in% installed.packages()) {
  install.packages("ggstatsplot")}
if(!"ggbeeswarm" %in% installed.packages()) {
  install.packages("ggbeeswarm")}
if (!require(devtools)) {
  install.packages('devtools')
}
devtools::install_github('Ather-Energy/ggTimeSeries')
devtools::install_github('erocoar/gghalves')
install.packages("gghighlight")
#Connect with the libraries
library(ggplot2)
library(ggthemes)
library(nlme)
library(gganimate)
library(gapminder)
library(ggExtra)
library(psych)
library(reshape2)
library(dplyr)
library(nycflights13)
library(ggcorrplot)
library(waffle)
library(tidyr)
library(scales)
library(ggalt)
library(data.table)
library(extrafont)
library(lubridate)
library(DT)
library(grid)
library(gridExtra)
library(prettydoc)
library(devtools)
library(tidyverse)
library(ggdark)
library(here)
library(gifski)
library(forcats)
library(tufte)
library(colorspace)
library(viridisLite)
library(formatR)
library(DiagrammeR)
library(xaringan)
library(ggridges)
library(GGally)
library(ggplot2movies)
library(corrplot)
library(ggpointdensity)
library(ggstatsplot)
library(ggTimeSeries)
library(ggbeeswarm)
library(gghalves)
library(gghighlight)

#Themes 

#Checking the theme options
?theme

#We can set a theme as the default, for example 
theme_set(theme_bw())

#Simple chart
ggplot(diamonds, aes(carat)) + 
  geom_freqpoly() 

#Defining the general colors to avoid hard coding  
fill_color = '#111111'
decoration_color = '#cccccc'
main1_color = '#f20675'
main2_color = '#1ce3cd'

#Create a personalized theme
pers_theme<-theme_bw() + theme(
  panel.grid.major = element_blank(), 
  panel.grid.minor = element_blank(),
  plot.title = element_text(size = 14, hjust = 0.2, color = decoration_color),
  axis.title = element_text(size = 10, hjust = 0.5, color = decoration_color),
  axis.text = element_text(colour = decoration_color, size = 8),
  axis.ticks = element_blank(),
  axis.line = element_line(colour = decoration_color, size=0.3, linetype = "dashed"), 
  panel.border = element_blank(),
  panel.grid = element_blank(),
  strip.text = element_text(size = 12, color = decoration_color),
  panel.background = element_blank(),
  strip.background =element_blank(),
  plot.background = element_blank(),
  legend.text	= element_text(size = 10, hjust = 0.5, color = decoration_color), 
  legend.position = c(0.815, 0.27),
  legend.key = element_blank(),
  legend.title = element_blank() 
)

#Now we set the new defined theme to the default option 
theme_set(pers_theme)

#Simple chart
ggplot(diamonds, aes(carat)) + 
  geom_freqpoly(colour = main1_color) 

#There is also a dark theme option with black background
theme_set(dark_theme_gray()+ theme(
  panel.grid.major = element_blank(), 
  panel.grid.minor = element_blank(),
  plot.title = element_text(size = 14, hjust = 0, color = decoration_color),
  axis.ticks = element_blank(),
  axis.title = element_blank(),
  legend.title = element_blank(),
  panel.background =element_rect(fill = fill_color),
  strip.background =element_rect(fill = fill_color), 
  plot.background = element_rect(fill = fill_color),
  legend.background = element_rect(fill = fill_color)
))

#Simple chart
ggplot(diamonds, aes(carat)) + 
  geom_freqpoly(colour = main2_color) 

#No axis title
theme_set(dark_theme_gray()+ theme(
  panel.grid.major = element_blank(), 
  panel.grid.minor = element_blank(),
  axis.title = element_blank(),
  axis.text = element_text(colour = decoration_color, size = 9),
  axis.ticks = element_blank(),
  legend.title = element_blank(),
  panel.background =element_rect(fill = fill_color),
  strip.background =element_rect(fill = fill_color), 
  plot.background = element_rect(fill = fill_color),
  legend.background = element_rect(fill = fill_color)
))

#Simple chart
ggplot(diamonds, aes(carat)) + 
  geom_freqpoly(colour = main2_color) 

#Setting the theme 
Tufte_theme <- theme_tufte(ticks = FALSE, base_size = 16)
theme_set(Tufte_theme) 

#Simple chart
ggplot(diamonds, aes(carat)) + 
  geom_freqpoly(colour = fill_color) 

#Distributions 

# Check the dataset
names(gapminder)
head(gapminder, n=10)
str(gapminder)
summary(gapminder)

#Histogram

#Checking the options
?geom_histogram

#Simple chart
ggplot(gapminder, aes(lifeExp)) + 
  geom_histogram(colour = "black", fill = main2_color) 

#Changing bin width - more detail
ggplot(gapminder, aes(lifeExp)) + 
  geom_histogram(colour = "black", fill = main2_color, binwidth = 0.2) 

#Changing bin width - more aggregation
ggplot(gapminder, aes(lifeExp)) + 
  geom_histogram(colour = "black", fill = main2_color, binwidth = 8) 

#How to zoom by defining the limits for the x axis 
ggplot(gapminder, aes(lifeExp)) + 
  geom_histogram(colour = "black", fill = main2_color) + 
  xlim(60, 80)

#Histogram for different cut options 
ggplot(gapminder, aes(lifeExp, fill = continent)) +
  geom_histogram() + 
  scale_fill_manual(values=c("#478adb", "#f20675", "#1ce3cd", "#bcc048", "#cccccc"))

#Histogram for different cut options (next to each other)
ggplot(gapminder, aes(lifeExp, fill = continent)) +
  geom_histogram(position = "dodge") + 
  scale_fill_manual(values=c("#478adb", "#f20675", "#1ce3cd", "#bcc048", "#cccccc"))

#Multiple: histogram for the different continents to facilitate comparison: first the simple version
ggplot(gapminder, aes(lifeExp)) + 
  geom_histogram(binwidth = 3, fill = main2_color, colour = "black") + 
  facet_wrap(. ~ continent)

#Multiple: histogram for the different continents to facilitate comparison: first the simple version
ggplot(gapminder, aes(lifeExp)) + 
  geom_histogram(binwidth = 0.5, fill = main2_color, colour = NA) + 
  facet_wrap(. ~ continent)

#Multiple: histogram for the different continents to facilitate comparison: first the simple version
ggplot(gapminder, aes(lifeExp)) + 
  geom_histogram(binwidth = 2, fill = main2_color, colour = "black") + 
  facet_wrap(. ~ continent)

#Changing the colors
ggplot(gapminder, aes(lifeExp, fill = continent)) + 
  geom_histogram(binwidth = 2, colour = "black") + 
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd")) +
  facet_wrap(. ~ continent)
