## If required, set your working directory

## Read and subset data
EPC <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
EPCFeb2007 <- EPC[EPC$Date == "1/2/2007" | EPC$Date == "2/2/2007",]

## Make the required histogram
EPCFeb2007$Global_active_power <- as.numeric(EPCFeb2007$Global_active_power)

hist(EPCFeb2007$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     ylim = c(0,1200))

## Save as PNG
dev.copy(png,file = "plot1.png")
dev.off()

