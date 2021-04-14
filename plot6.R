#Load packages
library(ggplot2)
library(dplyr)

#Create PNG space to store plot.
png("plot6.png", width = 480, height = 480)

#Manipulate data
lookup <- data.frame(fips = c("06037", "24510"), county = c("Los Angeles", "Baltimore"))
vehicles_SCC <- SCC[grep("[Vv]ehicle", SCC$EI.Sector), "SCC"]
vehicle_emissions <- NEI %>%
  filter(SCC %in% vehicles_SCC & fips %in% lookup$fips) %>%
  group_by(fips, year) %>%
  summarize(Emissions = sum(Emissions))
vehicle_emissions <- merge(vehicle_emissions, lookup)

#Plot
bcv_plot <- ggplot(vehicle_emissions, aes(x = factor(year), y = round(Emissions/1000, 2), 
                                          label=round(Emissions/1000,2), fill = year)) +
  geom_bar(stat = "identity") + facet_grid(. ~ county) +
  ylab(expression('PM'[2.5]*' Emissions in Kilotons')) + xlab("Year") +
  geom_label(aes(fill = year),colour = "white", fontface = "bold") +
  ggtitle("Los Angeles vs Baltimore Vehicle Emissions.")
print(bcv_plot)

#Save plot in PNG
dev.off()