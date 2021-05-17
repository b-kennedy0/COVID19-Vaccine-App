ui = shiny::htmlTemplate(
  # Index Page
  "www/index.html",
  
  latest_date = textOutput(
    "latest_date",
    inline = T
  ),
  
  england = textOutput(
    "england",
    inline = T
  ),
  
  wales = textOutput(
    "wales",
    inline = T
  ),
  
  scotland = textOutput(
    "scotland",
    inline = T
  ),
  
  northernireland = textOutput(
    "northernireland",
    inline = T
  ),
  
  total_perc_vaccines_uk = textOutput(
    "total_uk_perc",
    inline = T
  ),
  
  total_no_vaccines_uk = textOutput(
    "total_uk_no",
    inline = T
  ),
  
  # England %
  eng_vaccines_pc = textOutput(
    "eng",
    inline = T
  ),
  
  # Wales %
  wal_vaccines_pc = textOutput(
    "wal",
    inline = T
  ),
  
  # Scotland %
  sco_vaccines_pc = textOutput(
    "sco",
    inline = T
  ),
  
  # NI %
  ni_vaccines_pc = textOutput(
    "ni",
    inline = T
  ),
  
  # Englnad No
  eng_vaccines_no = textOutput(
    "eng_no",
    inline = T
  ),
  
  # Wales No
  wal_vaccines_no = textOutput(
    "wal_no",
    inline = T
  ),
  
  # Scotland No
  sco_vaccines_no = textOutput(
    "sco_no",
    inline = T
  ),
  
  # NI No
  ni_vaccines_no = textOutput(
    "ni_no",
    inline = T
  ),
  
  # 2nd Dose 
  
  total_perc_vaccines_uk_2ndDose = textOutput(
    "total_uk_perc_2ndDose",
    inline = T
  ),
  
  total_no_vaccines_uk_2ndDose = textOutput(
    "total_uk_no_2ndDose",
    inline = T
  ),
  
  # England %
  eng_vaccines_pc_2ndDose = textOutput(
    "eng_2ndDose",
    inline = T
  ),
  
  # Wales %
  wal_vaccines_pc_2ndDose = textOutput(
    "wal_2ndDose",
    inline = T
  ),
  
  # Scotland %
  sco_vaccines_pc_2ndDose = textOutput(
    "sco_2ndDose",
    inline = T
  ),
  
  # NI %
  ni_vaccines_pc_2ndDose = textOutput(
    "ni_2ndDose",
    inline = T
  ),
  
  # Englnad No
  eng_vaccines_no_2ndDose = textOutput(
    "eng_no_2ndDose",
    inline = T
  ),
  
  # Wales No
  wal_vaccines_no_2ndDose = textOutput(
    "wal_no_2ndDose",
    inline = T
  ),
  
  # Scotland No
  sco_vaccines_no_2ndDose = textOutput(
    "sco_no_2ndDose",
    inline = T
  ),
  
  # NI No
  ni_vaccines_no_2ndDose = textOutput(
    "ni_no_2ndDose",
    inline = T
  ),
  
  # Plot
  plot = plotlyOutput({
    "plot"
  })
  
)
