df <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
df$Date <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df <- df[,-2]
start <- strftime("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S")
end <- strftime("2007-02-03 00:00:00", format="%Y-%m-%d %H:%M:%S")
df <- df[df$Date>=start & df$Date<end,]

Sys.setlocale("LC_ALL", "English")

##### MAIN PLOT CODE ######

par(mfcol=c(1,1))
with(df, plot(Date, Sub_metering_1, type="l", xlab="", col="black",
              ylab="Energy sub metering"))
with(df, lines(Date, Sub_metering_2, col="red"))
with(df, lines(Date, Sub_metering_3, col="blue"))
legend("topright", lty=1, lwd=1, y.intersp=0.5,
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

###########################

dev.copy(png, "plot3.png")
dev.off()