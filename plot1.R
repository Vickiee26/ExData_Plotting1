
df <- read.table("../household_power_consumption.txt", header = TRUE, sep=";", na.strings = '?',
                 colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))

df$Date <- as.Date(df$Date, '%d/%m/%Y')

library("dplyr")

df <- df %>% filter(df$Date >= as.Date("2007-2-1") & df$Date <= as.Date("2007-2-2"))

png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", col = "red")
dev.off()

