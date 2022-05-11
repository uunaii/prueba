################################# CARGA Y PREPROCESADO ##################################
#Carga y preposado
conexion<-dbConnect(odbc(),"reto4_ikea")
#Mostrar tablas BD
dbListTables(conexion)
#consultas
#Forma 1
df2<-dbGetQuery(conexion,"Select * from furniture" )
class(df)
#Forma 2
consulta2<-dbSendQuery(conexion,"Select count(*) from furniture")
primeros10<-dbFetch(consulta2,n=10)
demas<-dbFetch(consulta2)

# CARGA DE LOS ARCHIVOS desde csv
df1 <- read_excel("./DatosOriginales/furniture - 1de2.xlsx")
sum(is.na(df1$membership_id))
df2 <- read_excel("./DatosOriginales/furniture - 2de2.xlsx")
df <- rbind.data.frame(df1,df2)
rm(df1)
rm(df2)

#                             DATA DISCOVERING
str(df)
dim(df)
nrow(df)
sum(is.na(df))
df$store <- as.factor(df$store)
df$transaction_timestamp <- ymd_hms(df$transaction_timestamp)
str(df)

# Limpieza de caracteres y tildes
# 1.categoria
df$product_category_1_name <- stri_trans_general(df$product_category_1_name, "Latin-ASCII")
df$product_category_1_name <- str_replace_all(df$product_category_1_name, "´", "") 
df$product_category_1_name <- str_replace_all(df$product_category_1_name, "Â", "") 
df$product_category_1_name <- str_replace_all(df$product_category_1_name, "A", "") 
df$product_category_1_name <- str_replace_all(df$product_category_1_name, "[:punct:]", "") 
df$product_category_1_name <- str_replace_all(df$product_category_1_name, "�", "") 
# data frame para graficos sin espacios
dfgraph<- df
#
df$product_category_1_name <- str_replace_all(df$product_category_1_name, "[:blank:]", "")
table(df$product_category_1_name)
unique(df$product_category_1_name)

# 2.categoria
df$product_category_2_name <- stri_trans_general(df$product_category_2_name, "Latin-ASCII")
df$product_category_2_name <- str_replace_all(df$product_category_2_name, "[:punct:]", "") 
# data frame para graficos sin espacios
dfgraph$product_category_2_name <- stri_trans_general(dfgraph$product_category_2_name, "Latin-ASCII")
dfgraph$product_category_2_name <- str_replace_all(dfgraph$product_category_2_name, "[:punct:]", "") 
#
df$product_category_2_name <- str_replace_all(df$product_category_2_name, "[:blank:]", "") 
table(df$product_category_2_name)
unique(df$product_category_2_name)

#3 categoria
df$product_category_3_name <- stri_trans_general(df$product_category_3_name, "Latin-ASCII")
df$product_category_3_name <- str_replace_all(df$product_category_3_name, "[:punct:]", "") 
# data frame para graficos sin espacios
dfgraph$product_category_3_name <- stri_trans_general(dfgraph$product_category_3_name, "Latin-ASCII")
dfgraph$product_category_3_name <- str_replace_all(dfgraph$product_category_3_name, "[:punct:]", "")
#
df$product_category_3_name <- str_replace_all(df$product_category_3_name, "[:blank:]", "") 
table(df$product_category_3_name)
unique(df$product_category_3_name)


#                                  DUPLICADOS

#duplicados en la clave primaria 


nrow(df[duplicated(df[, c(2,3)]), ])

#duplicados en el df 
df_sinduplicados <- distinct(df)
all(dim(df_sinduplicados) == dim(df)) # no hay valores que esten duplicados en todas sus columnas
rm(df_sinduplicados)


#                                  MISSING VALUES
# El data frame es muy grande
# Se coge por tanto una muestra para estimar como son y donde estan los valores vacios
df %>%
  sample_n(1000) %>%
  vis_miss()
df %>%
  slice(1:1000) %>%
  vis_miss()
# Se puede hacer a lo bruto pero tarda mucho
var_20 <- miss_var_summary(df)
case_20 <- miss_case_summary(df)
#vis_20 <- vis_miss(df, warn_large_data = FALSE, cluster = TRUE) nose porque no me va

# Los missings se encuentran solo en la columna del ID de membresia, y por tanto se entiende
# que hay compradores que son socios (tienen dato en esa columna) y otros que no lo son (tienen NA)
n_miss(df$membership_id)

# Cambiamos los missings y ponemos no socio
df <- mutate_at(df,c("membership_id"), ~replace(., is.na(.), "no_socio"))
dfgraph <- mutate_at(dfgraph,c("membership_id"), ~replace(., is.na(.), "no_socio"))

table(str_length(df$membership_id)>8)
# Casi la mitad de clientes no son socios

sum(is.na(df)) # 0 datos ausentes: tenemos el dataframe totalmente limpio
colnames(df)

# Se crea una columna para analizar quien suele gastar mas dinero en las compras (P*Q)
df <- df %>% mutate(precio_unidad=Sales/Qty)
dfgraph <- dfgraph %>% mutate(precio_unidad=Sales/Qty)
str(df)
write.csv(df, "./DatosTransformados/df.csv")
write.csv(dfgraph, "./DatosTransformados/dfgraph.csv")

rm(df,dfgraph, var_20, case_20)


