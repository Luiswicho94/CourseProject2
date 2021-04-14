#Create PNG space to store plot.
png("plot2.png", width = 480, height = 480)

#Maniuplate Data
b_total <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(Emissions = sum(Emissions))

#Create Plot
with(b_total,
     barplot(height=Emissions/1000, names.arg = year, col = color_range, xlab = "Year", ylab = expression('PM'[2.5]*' in Kilotons'),
             main = expression('Baltimore, Maryland Emissions from 1999 to 2008')))
#Store Plot in PNG
dev.off()