# Work Directory
setwd("C:\\PERSO\\COURSERA\\exploratory-data-analysis\\")


#Read data
Data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", dec = ".", quote ="", na.strings ="?")


# Explore data
head(Data)
summary(Data)
str(Data)


# Transform date
#Paste Date and Time to make a global variable
DateTime<-paste(Data$Date, Data$Time)
#Transform format
DateTime<-strptime(Date, "%d/%m/%Y %H:%M:%S")
# Update orignal data
Data$DateTime<-Date
# Verify
summary(Data$DateTime)

# Keep only data for 2007-02-01 and 2007-02-02
x<-as.Date(Data$DateTime)>=as.Date("2007-02-01") & as.Date(Data$DateTime)<=as.Date("2007-02-02")
Data_filter<-Data[x,]
head(Data_filter)    


# Second plot
par(mfrow=c(1,1))
plot(x=Data_filter$DateTime,y=Data_filter$Global_active_power,type='l',xlab='', ylab='Global Power Active (Kilowatts)')
dev.copy(png,file='plot2.png')    
dev.off()