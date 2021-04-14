#Load packages
library(ggplot2)
library(dplyr)

#Create PNG space to store plot.
png("plot5.png", width = 480, height = 480)

#Manipulate data
scc_vehicles <- SCC[grep("[Vv]ehicle", SCC$EI.Sector), "SCC"]
vehicle_emissions <- NEI %>% 
  filter(SCC %in% scc_vehicles & fips == "24510") %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions))

#Plot
v_plot <- ggplot(coal_summary, aes(x=year, y=round(Emissions/1000,2), label=round(Emissions/1000,2), fill=year)) +
  geom_bar(stat="identity") + ylab(expression('PM'[2.5]*' Emissions in Kilotons')) + xlab("Year") +
  geom_label(aes(fill = year),colour = "white", fontface = "bold") +
  ggtitle("Baltimore Vehicle Emissions, 1999 to 2008.")
print(v_plot)

#save plot to PNG
dev.off()