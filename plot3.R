library(readxl)
energyconsumtion <- read_excel("C:/Users/jortega/Downloads/energyconsumtion.xlsx")
View(energyconsumtion)

datetime <- paste(as.Date(energyconsumtion$Date), energyconsumtion$Time)
energyconsumtion$datetime <- as.POSIXct(datetime)

png(filename = "plot3.png")
plot(energyconsumtion$Sub_metering_1, type= "l", ylab="Energy sub metering", xaxt = 'n')
lines(energyconsumtion$Sub_metering_2,col = "red")
lines(energyconsumtion$Sub_metering_3,col = "blue")
legend("topright", c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), col = c("black","red","blue"),lty=c(1,1))
axis(1, labels = energyconsumtion$datetime, at = 1:2880)
dev.off()