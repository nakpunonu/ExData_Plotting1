hpc <- hpc <- read.table("./household_power_consumption.txt",sep=";",
                         header=TRUE,colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                         na.strings="?") ##Read in data, assignls column classes and specifies "?" as NA.

sub.hpc <- subset(hpc,Date=="1/2/2007" | Date=="2/2/2007") ## subset required rows

sub.hpc$datetime <- strptime(paste(sub.hpc$Date,sub.hpc$Time),"%d/%m/%Y %H:%M:%S") ##Create new column
##that date & time in proper format

png("plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

with(sub.hpc, plot(datetime,Global_active_power,type="n",xlab="")) ##set up and plot top left graph
with(sub.hpc, lines(datetime,Global_active_power))

with(sub.hpc, plot(datetime,Voltage,type="n")) ##Set up and plot top right graph
with(sub.hpc, lines(datetime,Voltage))

## Set up and plot bottom left graph
with(sub.hpc, plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")) ##Set up plotting area
with(sub.hpc, lines(datetime,Sub_metering_1)) ## add lines for sub_metering_1
with(sub.hpc, lines(datetime,Sub_metering_2, col="red")) ## add lines for sub_metering_2
with(sub.hpc, lines(datetime,Sub_metering_3, col="blue")) ## add lines for sub_metering_3
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),cex = 0.9) ## add legend

with(sub.hpc, plot(datetime,Global_reactive_power,type="n")) ##Set up and plot bottom right graph
with(sub.hpc, lines(datetime,Global_reactive_power))

dev.off()