############################## ESTADISTICOS ######################################

##### ANALISIS DESCRIPTIVO #####
estadistica <- read.csv("./DatosTransformados/df.csv", sep=",", header = T)
a<-estadistica %>% filter(Sales>=2000)
table(a$product_category_1_name)
table(a$product_category_2_name)
table(a$product_category_3_name)
# Se quitan los codigos hash para aligerar, ya que no interesan en este caso
estadistica$product_category_1 <- NULL
estadistica$product_category_2 <- NULL
estadistica$product_category_3 <- NULL

# Rango temporal: junio de 2019
min(estadistica$transaction_timestamp)
max(estadistica$transaction_timestamp)

# GENERAL
nrow(estadistica) # 532277 compras de clientes en junio de 2019
table(estadistica$store) # 46.64% en el Norte y 53.36% en el Sur


# CLIENTES Y NO CLIENTES
no_socio <- estadistica %>% filter(membership_id == "no_socio")
socios <- estadistica %>% filter(membership_id != "no_socio")
nrow(no_socio) # 41% de compras no asignadas a un cliente y por tanto sin identificar
table(no_socio$store)
# De esas 217908 compras que no son clientes 98903 (el 45%) son del norte, por un 55% del sur.
# Estos numeros corresponden a la distribucion total de los datos, asi que no son sorprendntes.

# 1.CONCLUSION: Proporcionalmente, se identifican mas compras en el norte que en el sur
conc1 <- data.frame(donde = c("Norte","Sur"), comprados = c(46.64,53.36), sin_identificar = c(45,55))
conc1

# Igual nos combiene tener dos data frames diferentes: uno del norte y otro del sur
sur <- estadistica %>% filter(store == "Sur")
norte <- estadistica %>% filter(store == "Norte")


# CATEGORIAS CON MAYOR VOLUMEN DE NEGOCIO (OJO! HABLAMOS DE PRECIO*CANTIDAD,
# NO SOLO DE CANTIDAD DE UNIDADES, QUE SERIA OTRA MANERA DE PLANTEARLO)

# CATEGORIA 1
table(estadistica$product_category_1_name) # 23 categorias
estadistica %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))
socios %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))
no_socio %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))
sur %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))
norte %>% group_by(product_category_1_name) %>% summarise(categoria_top=sum(profit)) %>% arrange(desc(categoria_top))

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


# Hacer graficos y analisis de las diferencias entre los diferentes grupos
# Hacer boxplot con los diferentes productos que se venden
# Hacer histogramas para analizar el comportamiento de la empresa estandar del sur y la del norte

# Comparar si el top1 en volumen en no socios es tmb el de socios, si el del sur es el del norte, etc
write.csv(socios, "./DatosTransformados//socios.csv")
write.csv(no_socio, "./DatosTransformados//nosocios.csv")
