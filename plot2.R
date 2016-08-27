## If required, set your working directory

## Read and subset data
EPC <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
EPCFeb2007 <- EPC[EPC$Date == "1/2/2007" | EPC$Date == "2/2/2007",]

## Make the required line plot
EPCFeb2007$Global_active_power <- as.numeric(EPCFeb2007$Global_active_power)

## Make the plot, turn of axes and annotations
plot(EPCFeb2007$Global_active_power,
     type = "l",
     ann = FALSE,
     axes = FALSE)

box()

## y-axis
title(ylab = "Global Active Power (kilowatts)")
axis(2, at=c(0,2,4,6))

## x-axis
## data are from two days, Thursday starts with observation 1, Friday starts halfway, Sat at the end 
axis(1, at=c(1,1440,2880), labels = c("Thu","Fri","Sat"))


## Save as PNG
dev.copy(png,file = "plot2.png")
dev.off()

