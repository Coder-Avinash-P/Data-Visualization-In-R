#Data Visualization Project
#Load Packages
library(ggplot2)
library(data.table)
library(ggthemes)

df <- read.csv('C:\\Users\\admin\\Desktop\\Online courses\\Udemy\\6. Data Science & ML with R\\Projects\\Economist_Assignment.csv')

#Scatter Plot of CPI and HDI
dv <- ggplot(df,aes(x=CPI, y=HDI,color=Region)) + geom_point()
print(dv)

#Change points on the chart
dv1 <- ggplot(df,aes(x=CPI, y=HDI,color=Region)) + geom_point(size=3, shape=1)
dv1

#Add one trendline for all the regions
dv2 <- dv1 + geom_smooth(aes(group=1))
dv2

#Smoothing the trendline
dv2 <- dv1 + geom_smooth(aes(group=1),method= 'lm',formula = y~log(x),se=F,color='blue')
dv2

#Add Levels
dv3 <- dv2 + geom_text(aes(label=Country))
dv3

#Select signicant levels(countries)
newlabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan", "Afghanistan", "Congo", "Greece", "Argentina", "Brazil","India", "Italy", "China", "South Africa", "Spane","Botswana", "Cape Verde", "Bhutan", "Rwanda", "France","United States", "Germany", "Britain", "Barbados", "Norway", "Japan", "New Zealand", "Singapore", "Cuba")

#Add new level to plot
dv3 <- dv2 + geom_text(aes(label=Country), color='blue',data=subset(df, Country %in% newlabel),
                       check_overlap = TRUE)
dv3

#Add themes
dv3 + theme_economist_white()

#Add limits of the axis(plot)
dv4 <- dv3 + theme_economist_white() + scale_x_continuous(limits= c(0.9, 10.5), breaks=1:10) + scale_y_continuous(limits = c(.2,1.0))

dv4

#Add title of the the axis
dv5 <- dv4 + labs(x="Corruption Perceptions Index,(10=Least)",
           y="Human Development Index,(1=Best)",
           title='Corruption and Human Development')

dv5

