hpc <- hpc <- read.table("./household_power_consumption.txt",sep=";",
        header=TRUE,colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
        na.strings="?") ##Read in data, assignls column classes and specifies "?" as NA.

sub.hpc <- subset(hpc,Date=="1/2/2007" | Date=="2/2/2007") ## subset required rows

sub.hpc$datetime <- strptime(paste(sub.hpc$Date,sub.hpc$Time),"%d/%m/%Y %H:%M:%S") ##Create new column
                                                        ##that date & time in proper format

hist(sub.hpc$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", main= "Global Active Power", col="red") ##plot histogram

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()
