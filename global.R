# Dependencies ------------------------------------------------------------
library(shiny, warn.conflicts = FALSE)
library(tidyverse, warn.conflicts = FALSE)
library(lubridate, warn.conflicts = FALSE)
library(shinycssloaders, warn.conflicts = FALSE)
library(sp, warn.conflicts = FALSE)
library(shinymaterial, warn.conflicts = FALSE)
library(httr, warn.conflicts = FALSE)
library(plotly, warn.conflicts = FALSE)
library(jsonlite, warn.conflicts = FALSE)
# Get Data ----------------------------------------------------------------
url <- ("https://coronavirus.data.gov.uk/api/v1/data?filters=areaType=nation&structure=%7B%22areaType%22:%22areaType%22,%22areaName%22:%22areaName%22,%22areaCode%22:%22areaCode%22,%22date%22:%22date%22,%22newPeopleVaccinatedFirstDoseByPublishDate%22:%22newPeopleVaccinatedFirstDoseByPublishDate%22,%22newPeopleVaccinatedSecondDoseByPublishDate%22:%22newPeopleVaccinatedSecondDoseByPublishDate%22,%22cumPeopleVaccinatedFirstDoseByPublishDate%22:%22cumPeopleVaccinatedFirstDoseByPublishDate%22,%22cumPeopleVaccinatedSecondDoseByPublishDate%22:%22cumPeopleVaccinatedSecondDoseByPublishDate%22%7D&format=csv")
GET(url, write_disk(tf <- tempfile(fileext = ".csv")))
dataset <- read_csv(tf, col_types = cols())
dataset <- subset(dataset, select = -c(areaType,areaCode))

url2 <- ("https://coronavirus.data.gov.uk/api/v1/data?filters=areaType=nation&structure=%7B%22areaType%22:%22areaType%22,%22areaName%22:%22areaName%22,%22areaCode%22:%22areaCode%22,%22date%22:%22date%22,%22weeklyPeopleVaccinatedFirstDoseByVaccinationDate%22:%22weeklyPeopleVaccinatedFirstDoseByVaccinationDate%22,%22cumPeopleVaccinatedFirstDoseByVaccinationDate%22:%22cumPeopleVaccinatedFirstDoseByVaccinationDate%22,%22weeklyPeopleVaccinatedSecondDoseByVaccinationDate%22:%22weeklyPeopleVaccinatedSecondDoseByVaccinationDate%22,%22cumPeopleVaccinatedSecondDoseByVaccinationDate%22:%22cumPeopleVaccinatedSecondDoseByVaccinationDate%22%7D&format=csv")
GET(url2, write_disk(tf2 <- tempfile(fileext = ".csv")))
graph_dataset <- read_csv(tf2, col_types = cols())
graph_dataset <- subset(graph_dataset, select = -c(areaType,areaCode))

# Get GitHub Release Version
github_data = fromJSON("https://api.github.com/repos/b-kennedy0/COVID19-Vaccine-App/releases/latest")
version <- github_data$tag_name  
