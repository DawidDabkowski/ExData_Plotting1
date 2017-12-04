df <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
df$Date <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df <- df[,-2]
start <- strftime("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S")
end <- strftime("2007-02-03 00:00:00", format="%Y-%m-%d %H:%M:%S")
df <- df[df$Date>=start & df$Date<end,]

Sys.setlocale("LC_ALL", "English")

##### MAIN PLOT CODE ######

par(mfcol=c(1,1))
with(df, plot(Date, Global_active_power, type="l", xlab="", 
              ylab="Global active power (kilowatts)"))

###########################

dev.copy(png, "plot2.png")
dev.off()