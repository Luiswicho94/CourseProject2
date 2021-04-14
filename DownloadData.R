#Set Working Directory inside my PC
setwd("C:\Users\Cecy\Documents\R Projects\CourseProject2")

#Check if file exists, if not download it. Then read data and store into usable variables
exdata_filename <- "exdata-data-NEI_data.zip"

if (!file.exists(exdata_filename)) {
  download_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(download_url, destfile = exdata_filename)
  unzip (zipfile = exdata_filename)
}

if (!exists("NEI")) {
  NEI <- readRDS("summarySCC_PM25.rds") 
}

if (!exists("SCC")) {
  SCC <- readRDS("Source_Classification_Code.rds")
}