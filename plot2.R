# Download, extract and import data
if(!file.exists("./data")){dir.create("./data")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

full_data <- read.table("./data/household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

# Tidying data
data <- subset(full_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


# Plotting
png("plot2.png", width=480, height=480)

plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.off()