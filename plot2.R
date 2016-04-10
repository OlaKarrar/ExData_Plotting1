#read the entire data file after setting the working directory

data<-read.table(file = "household_power_consumption.txt",header = T,sep = ';',
                 colClasses = c("character","character","numeric","numeric",
                                "numeric","numeric","numeric","numeric","numeric"),na.strings = "?")

#subset the data to select only the data collected on 2007-02-01 or 2007-02-02

data2days<-data[data$Date=="1/2/2007"| data$Date=="2/2/2007",]
data2days$datetime<-strptime(paste(data2days$Date,data2days$Time),"%d/%m/%Y %H:%M:%S")

#code for  plot 2

  png(filename ="plot2.png", width = 480,height = 480, units = "px")
    with(data2days,plot(datetime,Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = ""))
  dev.off()
