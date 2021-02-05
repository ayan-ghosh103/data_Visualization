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


#Defining the general colors to avoid hard coding  
fill_color = '#111111'
decoration_color = '#cccccc'
main1_color = '#f20675'
main2_color = '#1ce3cd'


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


#Check the options
?geom_line

#General trend in life expectancy
ggplot(gapminder) +
  geom_line(aes (year, lifeExp, group=country), lwd=0.1, show.legend=FALSE, color="white") +
  labs(title="Life expectancy worldwide") 

#Checking on continents 
ggplot(gapminder) +
  geom_line(aes (year, lifeExp, group=country, color=continent), lwd=0.2, show.legend=TRUE) +
  scale_color_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd")) + 
  labs(title="Life expectancy by continent") 

#Introducing a small multiple to better distinguish between continents 
ggplot() +
  geom_line(data=gapminder, aes (year, lifeExp, group=country, colour=continent), lwd=0.2, show.legend=FALSE) + 
  facet_wrap(~ continent, ncol=5, strip.position="bottom") +
  scale_color_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd")) +
  theme(axis.text.x = element_text(angle=45, hjust=1)) +
  labs(title="Life expectancy by continent")

#Adding a trend line - defining the method as loss 
ggplot() +
  geom_line(data=gapminder, aes (year, lifeExp, group=country), lwd=0.01, show.legend=FALSE, color="#A9A9A9") + 
  facet_wrap(~ continent, ncol=5, strip.position="bottom") +
  geom_smooth(data=gapminder, aes(year, lifeExp, group=1), lwd=1, se=FALSE, color="red") +
  theme(axis.text.x=element_text(angle=45, hjust=1)) +
  labs(title="Life expectancy by continent including trendline")

# Zooming in to see only Europe 
ggplot(subset(gapminder, continent=="Europe")) +
  geom_line(aes(year, lifeExp, group=country), lwd=0.2, color="#bcc048", show.legend=FALSE) +
  labs(title = "Life expectancy in Europe - detecting an outlier") 

# Select only Europe in order to understand which country is the outlier
europe <- dplyr::filter(gapminder, continent=="Europe")

ggplot(europe, aes(year, lifeExp)) +
  geom_line(color="#bcc048") +
  facet_wrap(~country) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Changes in Life Expectancy by country in europe") 

#Coming back to the general checking on patterns globally 

#We can even add all data in the background by setting the variable we do the facet with to zero 
ggplot() +
  geom_line(data=transform(gapminder, continent=NULL), aes (year, lifeExp, group=country), alpha=0.5, lwd=0.1, colour="white") +
  geom_line(data=gapminder, aes (year, lifeExp, group=country, colour=continent), lwd=0.4, show.legend=FALSE) + 
  facet_wrap(~ continent, ncol=5, strip.position="bottom") + 
  scale_color_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd")) +
  theme(strip.background=element_blank(), strip.placement="outside") +
  theme(axis.text.x = element_blank()) +
  labs(title = "Life expectancy by continent, showing all data in the back") 

#Now we could filter again on Europe and have far more context 
ggplot() +
  geom_line(data=transform(gapminder, continent=NULL), aes (year, lifeExp, group=country), alpha=0.6, lwd=0.1, colour="white") +
  geom_line(data=europe, aes (year, lifeExp, group=country), lwd=0.5, show.legend=FALSE, color="#bcc048") +
  geom_smooth(data=gapminder, aes(year, lifeExp, group=1), lwd=1, se=FALSE, color="red") +
  theme(strip.background=element_blank(), strip.placement="outside") +
  theme(axis.text.x=element_text(angle=45, hjust=1)) +
  labs(title = "Life expectancy highlighting europe and adding a global trend line") 
