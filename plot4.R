df <- read.table("../household_power_consumption.txt", header = TRUE, sep=";", na.strings = '?',
                 colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))

df$Date <- as.Date(df$Date, '%d/%m/%Y')

library("dplyr")

df <- df %>% filter(df$Date >= as.Date("2007-2-1") & df$Date <= as.Date("2007-2-2"))

dateTime <- paste(df$Date,df$Time)

dateTime <- setNames(dateTime, "DateTime")
df <- cbind(dateTime, df)
head(df)
df$Date <- NULL
df$Time <- NULL
df$dateTime <- as.POSIXct(dateTime)

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
plot(df$Global_active_power ~ df$dateTime, ylab = "Global Active Power", xlab="", type="l")
plot(df$Voltage ~ df$dateTime, ylab = "Voltage", xlab ="dateTime", type="l")


plot(df$Sub_metering_1~ df$dateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(df$Sub_metering_2 ~ df$dateTime,col='Red')
  lines(df$Sub_metering_3 ~ df$dateTime,col='Blue')

legend("topright", col=c("black", "red", "blue"), lwd=c(1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(df$Global_reactive_power ~ df$dateTime, ylab = "Global Reactive Power", xlab = "", type="l")

dev.off()