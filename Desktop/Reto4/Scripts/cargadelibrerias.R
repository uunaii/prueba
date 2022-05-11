################################## CARGA DE LIBRERIAS ###################################

#packages <- c("shiny", "shinydashboard")
#install.packages(setdiff(packages, rownames(installed.packages()))) ; rm(packages)

library(dplyr) # necesaria para muchas de las modificaciones del df y su analisis
library(readxl) # para la carga de los datos en R
library(readr) # lectura de ficheros
library(stringr) # correccion de la variable string
library(stringi)

library(tidyverse) # distintas librerias basicas
library(naniar) # para los missings
library(visdat) # para la visualizacion de los missings
library(VIM) # para imputar con kNN
library(simputation) # para imputar missings
library(Metrics) # para coeficientes de validacion de modelos
library(nortest) # para el test de lillefors

library(lubridate) # para fechas

library(janitor)
library(plotly)
library(reshape2)
library(gganimate)
library(gifski)
library(odbc)
library(shiny)

