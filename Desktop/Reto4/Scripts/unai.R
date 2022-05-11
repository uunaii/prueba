library(lubridate)
library(ggplot2)
# comportamiento socios ---------------------------------------------------
str(socios)
socios$transaction_timestamp <- as.Date(socios$transaction_timestamp, format = '%d-%m-%Y')
ggplot(data = socios,
       aes(x = transaction_timestamp, y = Sales)) +
  geom_line(color = "#FC4E07")


# comportamiento no socios ------------------------------------------------
no_socio$transaction_timestamp <- as.Date(no_socio$transaction_timestamp, format = '%d-%m-%Y')
ggplot(data = no_socios,
       aes(x = transaction_timestamp, y = Sales)) +
  geom_line(color = "#FC4E07")

names(no_socios)

# comportamiento todos ----------------------------------------------------



str(df)
library(ggplot2)
df <- read_csv("G:/Unidades compartidas/RETO 4/Proyecto de R/DatosTransformados/df.csv")
library(lubridate)
df$transaction_timestamp <- as.Date(df$transaction_timestamp, format = '%d-%m-%Y')
str(df)
ggplot(data = df,
       aes(x = transaction_timestamp, y = Sales)) +
  geom_line(color = "#FC4E07")

names(df)

#

# comportamiento sur ------------------------------------------------------


# comportamiento norte ----------------------------------------------------
