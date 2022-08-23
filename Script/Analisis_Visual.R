#TRABAJO PRÁCTICO NRO 2
#LARA FORLINO
#INCISO 5

#Cargo librerias
library(ggthemes)
library(geoAr)
library(esquisse)

esquisser(base)

#Desactivo notación científica
options(scipen = 999)


#Armo un histograma para observar la distribución de la edad de los beneficiarios
  ggplot(base) + aes(x = edad) +  
    geom_histogram(fill = "cadetblue",
                   color = "grey") +   
    labs(title = "Beneficiarios del programa Potenciar Trabajo",  subtitle = "Datos al 01/12/2021", 
         y = "Edad",  x = "Cantidad", 
         caption = "Fuente: Ministerio de Desarrollo Social de la Nación") +
    theme_clean() 

#Para complementar el histograma, calculo estadísticas descriptivas de la edad de beneficiarios
  base %>%  summarise(
  media=mean(edad,na.rm=TRUE),
  mediana=median(edad,na.rm=TRUE),
  max=max(edad,na.rm=TRUE),
  min=min(edad,na.rm=TRUE))
  

#Creo box plot separando la base entre hombre y mujer
ggplot(base) +
 geom_boxplot(aes(x = edad, fill = sexo),varwidth = TRUE)  +
 scale_fill_manual(values = c(F = "#5CDAA0", 
 M = "#E59340")) +
 labs(x = "Edad", y = "Cantidad", title = "Distribución de beneficiarios por edad y sexo", 
 subtitle = "Programa Potenciar Trabajo") +
 facet_wrap(vars(sexo)) +
  coord_flip() +
  ggthemes::theme_clean()

#Para complementar el histograma, calculo estadísticas descriptivas de la edad
#desagreagado por sexo de beneficiarios
 base %>% group_by(sexo) %>%  summarise(
  media=mean(edad,na.rm=TRUE),
  mediana=median(edad,na.rm=TRUE),
  max=max(edad,na.rm=TRUE),
  min=min(edad,na.rm=TRUE),
  n_sexo=n())




