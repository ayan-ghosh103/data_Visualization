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


#Checking the options
?geom_freqpoly

#Simple chart
ggplot(gapminder, aes(lifeExp)) + 
  geom_freqpoly(colour = main2_color)

#Changing the bin width (more details)
ggplot(gapminder, aes(lifeExp)) + 
  geom_freqpoly(colour = main2_color, binwidth = 0.8)

#Changing the bin width (less details)
ggplot(gapminder, aes(lifeExp)) + 
  geom_freqpoly(colour = main2_color, binwidth = 10) 

#Adding color as a visual encoding
ggplot(gapminder, aes(lifeExp, colour = continent)) +
  geom_freqpoly() +
  scale_color_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd")) 

#The whole idea of the grammar of graphs 
ggplot(gapminder, aes(lifeExp, color = continent)) +
  geom_histogram(colour=decoration_color, fill = decoration_color, alpha = 0.2, size =0) +
  geom_freqpoly()+ 
  scale_color_manual(values=c("#478adb", "#f20675", "#1ce3cd", "#bcc048", "#cccccc"))



#Checking the options
?geom_density_ridges

#Another way of creating small multiples is using the ridgeline plot 
ggplot(gapminder, aes(x = lifeExp, y = continent)) +
  geom_density_ridges(fill=main2_color, color=fill_color) 

#Encoding color 
ggplot(gapminder, aes(x = lifeExp, y = continent, fill=continent)) +
  geom_density_ridges(color=NA) +
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd"))

#Introducing the scaling factor
ggplot(gapminder, aes(x = lifeExp, y = continent, fill=continent)) +
  geom_density_ridges(color=NA, scale =2) +
  scale_fill_manual(values=c("#478adb", "#cccccc", "#f20675", "#bcc048", "#1ce3cd"))

#Using color to represent x twice (viridis scale)
ggplot(gapminder, aes(x = lifeExp, y = continent, fill = stat(x))) +
  geom_density_ridges_gradient(color="black", scale = 2, size = 0.3) +
  scale_fill_viridis_c() 

#Using color (self defined) to represent x twice (own created scale)
ggplot(gapminder, aes(x = lifeExp, y = continent, fill = stat(x))) +
  geom_density_ridges_gradient(color="black", scale = 2, size = 0.3) +
  scale_fill_gradient(low=main2_color, high=main1_color)

#Adding lines for the quantile, only median  
ggplot(gapminder, aes(x = lifeExp, y = continent)) +
  stat_density_ridges(scale=1, color=main2_color, fill="lightgrey", alpha=0.2, quantile_lines=TRUE, quantiles=2)

#Filling a specific part of the distribution
ggplot(gapminder, aes(x = lifeExp, y = continent, fill = factor(stat(quantile)))) +
  stat_density_ridges(geom = "density_ridges_gradient", scale=1, quantile_lines=TRUE, calc_ecdf=TRUE, quantiles = c(0.025, 0.975))+
  scale_fill_manual(values = c(main2_color, "#282626", main1_color))

#Adding the actual points  
ggplot(gapminder, aes(x = lifeExp, y = continent)) +
  geom_density_ridges(scale=1, fill=NA, color=main2_color, jittered_points=TRUE , 
                      point_alpha=1, point_size=1, size=0.8) 

#Adding the actual points  
ggplot(gapminder, aes(x = lifeExp, y = continent)) +
  geom_density_ridges(scale=0.5, fill=NA, color=main2_color, jittered_points=TRUE , 
                      point_alpha=1, point_size=1, size=0.8, position="raincloud") 

#Encoding color 
ggplot(gapminder, aes(x = lifeExp, y = continent, fill=continent, color=continent)) +
  geom_density_ridges(scale=0.5, jittered_points=TRUE , 
                      point_alpha=1, point_size=1, size=0.8, position="raincloud") +
  scale_color_manual(values=c("#cccccc", "#478adb", "#f20675", "#1ce3cd", "#bcc048")) +
  scale_fill_manual(values=c("#cccccc", "#478adb", "#f20675", "#1ce3cd", "#bcc048"))
