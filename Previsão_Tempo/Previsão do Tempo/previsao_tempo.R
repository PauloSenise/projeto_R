# Implementação da API para previsão do tempo
# Ferramenta auxiliar para a cultura agrícola
library(httr)
library(jsonlite)

# Definir a chave da API e a cidade 
api_key <- "9b90edf9b722e841505a711976022ea2" 
cidade <- URLencode("São Paulo")

url <- paste0("http://api.openweathermap.org/data/2.5/weather?q=", {cidade}, 
              "&appid=", {api_key}, "&units=metric&lang=pt")

# Fazer a requisição GET
resposta <- GET(url)

# Verificar se a resposta foi bem-sucedida
if (status_code(resposta) == 200) {
  dados <- content(resposta, as = "text", encoding = "UTF-8")
  dados_json <- fromJSON(dados, simplifyVector = FALSE)  # Garante que retorna listas
  
# Verificar estrutura da resposta
  #str(dados_json)
  
# Extrair os dados corretamente
  temperatura <- dados_json$main$temp
  descricao <- dados_json$weather[[1]]$description  # Acessando corretamente o primeiro item da lista
  velocidade <- dados_json$wind$speed
  temp_max <- dados_json$main$temp_max
  temp_min <- dados_json$main$temp_min
  
# Imprimir na Tela os Dados Climáticos
  cat("Temperatura em", "(",dados_json$name,"):", temperatura, "°C\n")
  cat("Temperatura máx:", temp_max, "C°\n")
  cat("Temperatura mín:", temp_min, "C°\n")
  cat("Condição do Clima:", descricao, "\n")
  cat("Velicidade do Vento:", velocidade, "m/s\n")
} else {
  cat("Erro ao buscar os dados. Código de status:", status_code(resposta), "\n")
}
