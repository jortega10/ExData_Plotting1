library(readxl)
energyconsumtion <- read_excel("C:/Users/jortega/Downloads/energyconsumtion.xlsx")
View(energyconsumtion)

png(filename = "plot2.png")

energyconsumtion$Date <- as.Date(energyconsumtion$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(energyconsumtion$Date), energyconsumtion$Time)
energyconsumtion$datetime <- as.POSIXct(datetime)

plot(energyconsumtion$Global_active_power,type="l", main = "Global Active Power Over Days", ylab="Global Active Power (kilowatts)", xlab="", xaxt = "n")
axis(1, labels = energyconsumtion$datetime, at = 1:2880)
dev.off()
