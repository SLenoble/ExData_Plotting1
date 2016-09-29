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

# plot 3
par(mfrow=c(1,1))
with(Data_filter,plot(x=DateTime,y=Sub_metering_1,type='l',xlab='', ylab='Global Power Active (Kilowatts)'))
with(Data_filter,points(x=DateTime,y=Sub_metering_2,col='red',type='l'))
with(Data_filter,points(x=DateTime,y=Sub_metering_3,col='blue',type='l'))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch="_", col=c("black","red","blue"))
dev.copy(png,file='plot3.png', width=480, height=480)     
dev.off()