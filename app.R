#=========================== Copyright © 2022 Alec Nguyen. All rights reserved. ===========================
# load packages
library(tidyverse)
library(readxl)
library(leaflet)
library(rmapshaper)
library(tidycensus)
library(formattable)
library(sf)
library(scales)
library(DT)
library(reactable)
library(shinyWidgets)
library(plotly)
library(kableExtra)
library(tibble)
library(sodium)
options(tigris_use_cache = TRUE)
## turn off scientific notation
options(scipen = 999)

metadata <- readRDS("Main_Data/metadata.rds")
State_Data <- readRDS("Main_Data/app_system_data_007s.rds")
CoC_Data <- readRDS("Main_Data/app_system_data_005c.rds")

State_Data <- unserialize(data_decrypt(State_Data, metadata)) %>% sf::st_as_sf()
CoC_Data <- unserialize(data_decrypt(CoC_Data, metadata)) %>% sf::st_as_sf()

state_data_for_download <- State_Data %>% st_drop_geometry()
coc_data_for_download <- CoC_Data %>% st_drop_geometry()

State_Names <- sort(unique(state_data_for_download$State))
CoC_Names <- sort(unique(coc_data_for_download$`CoC Code`))

source("Shiny/UI.R", local = TRUE)
source("Shiny/Server.R", local = TRUE)

# Run the application 
shinyApp(ui = UI, server = Server)
#=========================== Copyright © 2022 Alec Nguyen. All rights reserved. ===========================