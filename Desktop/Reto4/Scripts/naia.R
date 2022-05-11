library(plotly)
library(dplyr)

dfgraph<-read.csv("./DatosTransformados/dfgraph.csv", sep=",", header = T)
no_socios <- dfgraph %>% filter(membership_id == "no_socio")
socios <- dfgraph %>% filter(membership_id != "no_socio")
sur <- dfgraph %>% filter(store == "Sur")
norte <- dfgraph %>% filter(store == "Norte")

# ANALISIS DE TOP CATEGORIAS EN CUANTO A CANTIDAD VENDIDA ------------------

# CATEGORIA 1
table(dfgraph$product_category_1_name)
dfgraph %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(Qty)) %>% arrange(desc(categoria_top))
s1<-socios %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(Qty)) %>% arrange(desc(categoria_top))
ns1<-no_socios %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(Qty)) %>% arrange(desc(categoria_top))
sur1<-sur %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(Qty)) %>% arrange(desc(categoria_top))
norte1<-norte %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(Qty)) %>% arrange(desc(categoria_top))


colors <-c('#ffcc00', '#003399')

fig1 <- plot_ly(s1[1:10,], labels = ~product_category_1_name, values = ~categoria_top, type = 'pie', hole=0.5, marker=list(colors=colors), textposition = 'inside',
                textinfo = 'label+percent',hoverinfo='text')
fig1 <- fig1 %>% layout(title = 'Top no socios por categorias',
                        xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                        yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

fig1


fig2 <- plot_ly(ns1[1:10,], labels = ~product_category_1_name, values = ~categoria_top, type = 'pie', hole=0.5, marker=list(colors=colors), textposition = 'inside',
               textinfo = 'label+percent',hoverinfo='text')
fig2 <- fig2 %>% layout(title = 'Top no socios por categorias',
                      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

fig2

#ffcc00
#003399


# ANALISIS DE TOP CATEGORIAS EN CUANTO A INGRESOS OBTENIDOS -----------------

# CATEGORIA 1
table(dfgraph$product_category_1_name)
dfgraph %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(Sales)) %>% arrange(desc(categoria_top))
s1<-socios %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(Sales)) %>% arrange(desc(categoria_top))
ns1<-no_socios %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(Sales)) %>% arrange(desc(categoria_top))
sur1<-sur %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(Sales)) %>% arrange(desc(categoria_top))
norte1<-norte %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(Sales)) %>% arrange(desc(categoria_top))














# CATEGORIA 2
table(estadistica$product_category_2_name) 
estadistica %>% group_by(product_category_2_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))
socios %>% group_by(product_category_2_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))
no_socio %>% group_by(product_category_2_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))
sur %>% group_by(product_category_2_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))
norte %>% group_by(product_category_2_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))

# CATEGORIA 3
table(estadistica$product_category_3_name) 
estadistica %>% group_by(product_category_3_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))
socios %>% group_by(product_category_3_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))
no_socio %>% group_by(product_category_3_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))
sur %>% group_by(product_category_3_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))
norte %>% group_by(product_category_3_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))
