server <- function(input, output) {

  # Latest Date ----------------------------------------------------------
  latest <- format(as.Date(max(dataset$date)), format = "%d/%m/%Y")
  output$latest_date <- renderText({
    latest
  })
  
  # Populations (https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates)
  eng_pop <- 44263393
  wal_pop <- 2522940
  sco_pop <- 4434138
  ni_pop <- 1452962
  uk_pop <- sum(eng_pop,wal_pop,sco_pop,ni_pop)
  uk_total <- sum(dataset$cumPeopleVaccinatedFirstDoseByPublishDate
                  [dataset$date==max(dataset$date)])
  uk_total2 <- sum(dataset$cumPeopleVaccinatedSecondDoseByPublishDate
                  [dataset$date==max(dataset$date)])
  # Population data formatted for use in index -----------------------------
  output$england <- renderText({
    format(as.numeric(eng_pop), big.mark = ",")
  })
  output$wales <- renderText({
    format(as.numeric(wal_pop), big.mark = ",")
  })
  output$scotland <- renderText({
    format(as.numeric(sco_pop), big.mark = ",")
  })
  output$northernireland <- renderText({
    format(as.numeric(ni_pop), big.mark = ",")
  })
  
  # Formatting vaccine data (% and No) for use in index 1st DOSE ----------------------
  
  # Total % UK Vaccines
  output$total_uk_perc <- renderText({
    format(round(as.numeric((uk_total / uk_pop) * 100), digits = 2), nsmall = 2)
  })
  
  # Total no UK Vaccines
  output$total_uk_no <- renderText({
    format(as.numeric(uk_total), big.mark = ",")
  })
  
  # England %
  output$eng <- renderText({
    format(round(as.numeric((dataset$cumPeopleVaccinatedFirstDoseByPublishDate
                              [dataset$date==max(dataset$date) 
                                & dataset$areaName=="England"] / eng_pop) * 100), 
                 digits = 2), nsmall = 2)
  })
  
  # Wales %
  output$wal <- renderText({
    format(round(as.numeric((dataset$cumPeopleVaccinatedFirstDoseByPublishDate
                      [dataset$date==max(dataset$date) 
                        & dataset$areaName=="Wales"] / wal_pop)  * 100), 
           digits = 2), nsmall = 2)
  })
  
  # Scotland %
  output$sco <- renderText({
    format(round(as.numeric((dataset$cumPeopleVaccinatedFirstDoseByPublishDate
                    [dataset$date==max(dataset$date) 
                      & dataset$areaName=="Scotland"] / sco_pop) * 100), 
           digits = 2), nsmall = 2)
  })
  
  # NI %
  output$ni <- renderText({
    format(round(as.numeric((dataset$cumPeopleVaccinatedFirstDoseByPublishDate
                    [dataset$date==max(dataset$date) 
                      & dataset$areaName=="Northern Ireland"] / ni_pop) * 100), 
           digits = 2), nsmall = 2)
  })

  # England No
  output$eng_no <- renderText({
    format(as.numeric(dataset$cumPeopleVaccinatedFirstDoseByPublishDate
                      [dataset$date==max(dataset$date) 
                        & dataset$areaName=="England"]), big.mark = ",")
  })
  
  # Wales No
  output$wal_no <- renderText({
    format(as.numeric(dataset$cumPeopleVaccinatedFirstDoseByPublishDate
                      [dataset$date==max(dataset$date) 
                        & dataset$areaName=="Wales"]), big.mark = ",")
  })
  
  # Scotland No
  output$sco_no <- renderText({
    format(as.numeric(dataset$cumPeopleVaccinatedFirstDoseByPublishDate
                      [dataset$date==max(dataset$date) 
                        & dataset$areaName=="Scotland"]), big.mark = ",")
  })
  
  # NI No
  output$ni_no <- renderText({
    format(as.numeric(dataset$cumPeopleVaccinatedFirstDoseByPublishDate
                      [dataset$date==max(dataset$date) 
                        & dataset$areaName=="Northern Ireland"]), big.mark = ",")
  })
  
  # Formatting vaccine data (% and No) for use in index 2nd DOSE ----------------------
  
  # Total % UK Vaccines 2ndDose
  output$total_uk_perc_2ndDose <- renderText({
    format(round(as.numeric((uk_total2 / uk_pop) * 100), digits = 2), nsmall = 2)
  })
  
  # Total no UK Vaccines 2ndDose
  output$total_uk_no_2ndDose <- renderText({
    format(as.numeric(uk_total2), big.mark = ",")
  })
  
  # England % 2ndDose
  output$eng_2ndDose <- renderText({
    format(round(as.numeric((dataset$cumPeopleVaccinatedSecondDoseByPublishDate
                             [dataset$date==max(dataset$date) 
                               & dataset$areaName=="England"] / eng_pop) * 100), 
                 digits = 2), nsmall = 2)
  })
  
  # Wales % 2ndDose
  output$wal_2ndDose <- renderText({
    format(round(as.numeric((dataset$cumPeopleVaccinatedSecondDoseByPublishDate
                             [dataset$date==max(dataset$date) 
                               & dataset$areaName=="Wales"] / wal_pop)  * 100), 
                 digits = 2), nsmall = 2)
  })
  
  # Scotland % 2ndDose
  output$sco_2ndDose <- renderText({
    format(round(as.numeric((dataset$cumPeopleVaccinatedSecondDoseByPublishDate
                             [dataset$date==max(dataset$date) 
                               & dataset$areaName=="Scotland"] / sco_pop) * 100), 
                 digits = 2), nsmall = 2)
  })
  
  # NI % 2ndDose
  output$ni_2ndDose <- renderText({
    format(round(as.numeric((dataset$cumPeopleVaccinatedSecondDoseByPublishDate
                             [dataset$date==max(dataset$date) 
                               & dataset$areaName=="Northern Ireland"] / ni_pop) * 100), 
                 digits = 2), nsmall = 2)
  })
  
  # England No 2ndDose
  output$eng_no_2ndDose <- renderText({
    format(as.numeric(dataset$cumPeopleVaccinatedSecondDoseByPublishDate
                      [dataset$date==max(dataset$date) 
                        & dataset$areaName=="England"]), big.mark = ",")
  })
  
  # Wales No 2ndDose
  output$wal_no_2ndDose <- renderText({
    format(as.numeric(dataset$cumPeopleVaccinatedSecondDoseByPublishDate
                      [dataset$date==max(dataset$date) 
                        & dataset$areaName=="Wales"]), big.mark = ",")
  })
  
  # Scotland No 2ndDose
  output$sco_no_2ndDose <- renderText({
    format(as.numeric(dataset$cumPeopleVaccinatedSecondDoseByPublishDate
                      [dataset$date==max(dataset$date) 
                        & dataset$areaName=="Scotland"]), big.mark = ",")
  })
  
  # NI No 2ndDose
  output$ni_no_2ndDose <- renderText({
    format(as.numeric(dataset$cumPeopleVaccinatedSecondDoseByPublishDate
                      [dataset$date==max(dataset$date) 
                        & dataset$areaName=="Northern Ireland"]), big.mark = ",")
  })
  
  # Vaccinations per day plot --------------------------------------------
  
  output$plot <- renderPlotly({
    
    fig <- plot_ly(graph_dataset, 
                   x = graph_dataset$date[graph_dataset$areaName=="England"], 
                   y = graph_dataset$weeklyPeopleVaccinatedFirstDoseByVaccinationDate[graph_dataset$areaName=="England"],
                   name = 'England', type = 'scatter', mode = 'lines', 
                   line = list(color = 'rgb(205, 12, 24)', width = 4))
    
    fig <- fig %>% add_trace(x = graph_dataset$date[graph_dataset$areaName=="Wales"],
                             y = graph_dataset$weeklyPeopleVaccinatedFirstDoseByVaccinationDate[
                              graph_dataset$areaName=="Wales"], name = 'Wales', 
                             line = list(color = 'rgb(22, 96, 167)', width = 4)) 
    
    fig <- fig %>% add_trace(x = graph_dataset$date[graph_dataset$areaName=="Scotland"],
                             y = graph_dataset$weeklyPeopleVaccinatedFirstDoseByVaccinationDate[
                              graph_dataset$areaName=="Scotland"], name = 'Scotland', 
                             line = list(color = 'rgb(21, 230, 76)', width = 4))
    
    fig <- fig %>% add_trace(x = graph_dataset$date[graph_dataset$areaName=="Northern Ireland"],
                             y = graph_dataset$weeklyPeopleVaccinatedFirstDoseByVaccinationDate[
                               graph_dataset$areaName=="Northern Ireland"], name = 'Northern Ireland', 
                             line = list(color = 'rgb(235, 134, 19)', width = 4))
    
    fig
    })

  }
