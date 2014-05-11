data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date<- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset(data, data$Date >= '2007-02-01' & data$Date <= '2007-02-02')

x <- paste(subdata$Date, subdata$Time)
subdata$x <- strptime(x, "%Y-%m-%d %H:%M:%S")

windows()
par(bg="white")
with(subdata, plot(x, Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.copy(png, "plot2.png", width = 480, height = 480, units = "px")
