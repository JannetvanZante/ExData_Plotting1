## If required, set your working directory

## Read and subset data
EPC <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
EPCFeb2007 <- EPC[EPC$Date == "1/2/2007" | EPC$Date == "2/2/2007",]

## four plots, 2 x 2
par(mfrow = c(2,2), mar = c(4,4,2,1))


############################################################################
## First plot
############################################################################

EPCFeb2007$Global_active_power <- as.numeric(EPCFeb2007$Global_active_power)

plot(EPCFeb2007$Global_active_power,
     type = "l",
     ann = FALSE,
     axes = FALSE)

box()

title(ylab = "Global Active Power", cex = 0.8)
axis(2, at=c(0,2,4,6))

axis(1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))

############################################################################
## Second plot
############################################################################

EPCFeb2007$Voltage <- as.numeric(EPCFeb2007$Voltage)

plot(EPCFeb2007$Voltage,
     type = "l",
     ann = FALSE,
     axes = FALSE)

box()

title(ylab = "Voltage", xlab = "datetime") 
axis(2, at=seq(234,246,2))

axis(1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))


############################################################################
## Third plot
############################################################################

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

title(ylab = "Energy  sub metering")
axis(2, at=c(0,10,20,30))

axis(1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))

legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n", cex = 0.8)

############################################################################
## Fourth plot
############################################################################

EPCFeb2007$Global_reactive_power <- as.numeric(EPCFeb2007$Global_reactive_power)

plot(EPCFeb2007$Global_reactive_power,
     type = "l",
     ann = FALSE,
     axes = FALSE)

box()

title(ylab = "Global_reactive_power", xlab = "datetime") 
axis(2, at=seq(0.0,0.5,0.1))

axis(1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))

############################################################################
## Save as PNG
############################################################################

dev.copy(png,file = "plot4.png")
dev.off()

