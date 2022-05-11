################################### GRAFICOS #################################################
#df actual

df<- read.csv("./DatosTransformados/dfgraph.csv")
df<- df[,-1]

# ordenar de mayor a menor los que mas se han comprado en cuestion de volumen

df <- df %>%
  arrange(desc(Qty))

dim(df)

table(df$product_category_1_name)

#Mirar las categorias mas vendidas en cuanto a volumen de compra
#Mirar las categorias en las que el ingreso obtenido por IKEA haya sido mayor


#dividimos los datos en norte y sur

#NORTE
dfnorte <- df %>%
  filter(store == "Norte")

dfnorte %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(Sales)) %>% 
  arrange(desc(categoria_top))

dfnorte <-dfnorte %>% filter(product_category_1_name %in% c("Bedroom furniture","Kitchen","Store and organise furniture",
                                                  "Home organisation","Bed and bath textiles","Dining","Eating","IKE Food",
                                                  "Home textiles","Decoration"))

#SUR
dfsur  <- df %>%
  filter(store == "Sur")

dfsur %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(profit)) %>% 
  arrange(desc(categoria_top))

dfsur <-dfsur %>% filter(product_category_1_name %in% c("Bedroom furniture","Kitchen","Store and organise furniture",
                                                            "Home organisation","Bed and bath textiles","Dining","Eating","Living room seating",
                                                            "Home textiles","Decoration"))


rm(df)

#graficamos primero con norte
colnames(dfnorte)

dfnorte <- dfnorte[dfnorte$Qty < 517 & dfnorte$Qty> 0,]

norte<- plot_ly(
  data= dfnorte,
  x= ~product_category_1_name,  
  y=~Qty,
  color = ~store,
  colors = c("#00008B"),
  type= "box",
  jitter= 0
  )


norte <- norte %>% 
  layout(
    showlegend = FALSE,
    title = "Volumen de compra en el norte",  #titulo del grafico
    xaxis= list(
      title="" #nombre del eje x
    ),
    yaxis= list(
      title= "Cantidad"  #nombre del eje y
    )
    
  )

norte

#graficamos despues el sur


sur<- plot_ly(
  data= dfsur,
  x= ~product_category_1_name,  
  y=~Qty,
  color = ~store,
  colors = c("#FFFF00"),
  type= "box",
  jitter= 0
)


sur <- sur %>% 
  layout(
    showlegend = FALSE,
    title = "Volumen de compra en el sur",  #titulo del grafico
    xaxis= list(
      title="" #nombre del eje x
    ),
    yaxis= list(
      title= "Cantidad"  #nombre del eje y
    )
    
  )

sur
