par(mfrow =c(2,2))

energyconsumtion$Date <- as.Date(energyconsumtion$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(energyconsumtion$Date), energyconsumtion$Time)
energyconsumtion$datetime <- as.POSIXct(datetime)


plot(energyconsumtion$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt = "n")
axis(1, labels = energyconsumtion$datetime, at = 1:2880)

plot(energyconsumtion$Voltage, ylab= "voltage", xlab = "datetime", xaxt = "n", type ="l")
axis(1, labels = energyconsumtion$datetime, at = 1:2880)

plot(energyconsumtion$Sub_metering_1, type= "l", ylab="Energy sub metering", xlab= "", xaxt = 'n')
lines(energyconsumtion$Sub_metering_2,col = "red")
lines(energyconsumtion$Sub_metering_3,col = "blue")
legend("topright", c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), col = c("black","red","blue"),lty=c(1,1),bty = "n")
axis(1, labels = energyconsumtion$datetime, at = 1:2880)

plot(energyconsumtion$Global_reactive_power, ylab= "Global_reactive_power", xlab = "datetime", xaxt = "n", type ="l")
axis(1, labels = energyconsumtion$datetime, at = 1:2880)

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()