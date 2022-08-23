#TRABAJO PRÁCTICO NRO 2
#LARA FORLINO
#INCISO 4

#Cargo librerías
library(tidyverse)
library(janitor)


#Importo base de datos de beneficiarios del programa Potenciar Trabajo
#Lo dejo en otra carpeta porque es un archivo demasiado grande
#Se descarga comprimido desde acá: https://datosabiertos.desarrollosocial.gob.ar/dataset/potenciar-trabajo/resource/6e9de963-cf95-4555-87af-84f1126e346b

base <- read_csv("C:/Users/laraf/Documentos/MAESTRIA/geo_utdt/potenciar-trabajo-listado-2021-12-01.csv")

#Limpio nombres de columnas
base <- clean_names(base)

#La base es muy grande y tiene datos de beneficiarios desde que empezó el programa
#Busco cual es el último periodo
base %>%  summarise(
  max=max(periodo),
  sup_min=min(periodo))

#Filtro datos para quedarme solo con las observaciones mas recientes
base <- base %>% filter(periodo=="2021-12-01")

#La cantidad de observaciones es 1,2 millones, aproximadamente el número
#De beneficiarios totales del programa




