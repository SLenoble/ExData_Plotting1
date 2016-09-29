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
DateTime<-strptime(DateTime, "%d/%m/%Y %H:%M:%S")
# Update orignal data
Data$DateTime<-DateTime
# Verify
summary(Data$DateTime)

# Keep only data for 2007-02-01 and 2007-02-02
x<-as.Date(Data$DateTime)>=as.Date("2007-02-01") & as.Date(Data$DateTime)<=as.Date("2007-02-02")
Data_filter<-Data[x,]
head(Data_filter)    

# First Plot
par(mfrow=c(1,1))
hist(x=Data_filter$Global_active_power, xlab='Global Power Active (Kilowatts)',main ='Global Power Active', col='red')
dev.copy(png,file='plot1.png', width=480, height=480)    
dev.off()
