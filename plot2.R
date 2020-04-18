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

png("plot2.png", height = 480, width = 480)
plot( df$dateTime, df$Global_active_power,  type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()