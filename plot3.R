## If required, set your working directory

## Read and subset data
EPC <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
EPCFeb2007 <- EPC[EPC$Date == "1/2/2007" | EPC$Date == "2/2/2007",]

## Make the required line plot
EPCFeb2007$Sub_metering_1 <- as.numeric(EPCFeb2007$Sub_metering_1)
EPCFeb2007$Sub_metering_2 <- as.numeric(EPCFeb2007$Sub_metering_2)
EPCFeb2007$Sub_metering_3 <- as.numeric(EPCFeb2007$Sub_metering_3)

## Make the plot, turn of axes and annotations
plot(EPCFeb2007$Sub_metering_1,
     type = "l",
     ann = FALSE,
     axes = FALSE)

## Add Sub_metering_2 to the plot
lines(EPCFeb2007$Sub_metering_2,
      type = "l",
      col = "red")

## Add Sub_metering_3 to the plot
lines(EPCFeb2007$Sub_metering_3,
      type = "l",
      col = "blue")

box()

## y-axis
title(ylab = "Energy  sub metering")
axis(2, at=c(0,10,20,30))

## x-axis
## data are from two days, Thursday starts with observation 1, Friday starts halfway, Sat at the end 
axis(1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))

## Legend
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save as PNG
dev.copy(png,file = "plot3.png")
dev.off()

