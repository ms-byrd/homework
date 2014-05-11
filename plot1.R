data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date<- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset(data, data$Date >= '2007-02-01' & data$Date <= '2007-02-02')

windows()
par(bg="white")
hist(subdata$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png, "plot1.png", width = 480, height = 480, units = "px")
