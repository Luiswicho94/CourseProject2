#Create PNG space to store plot.
png("plot1.png", width = 480, height = 480)

#Create Plot
total_annual_emissions <- aggregate(Emissions ~ year, NEI, FUN = sum)
color_range <- 2:(length(total_annual_emissions$year)+1)
with(total_annual_emissions, barplot(height=Emissions/1000, names.arg = year, col = color_range, 
                                     xlab = "Year", ylab = expression('PM'[2.5]*' in kilotons'), 
                                      main = expression('Annual Emissions PM'[2.5]*'from 1990 to 2008')))
#Store Plot in PNG
dev.off()