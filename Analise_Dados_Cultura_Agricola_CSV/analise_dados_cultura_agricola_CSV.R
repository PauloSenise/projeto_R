library(readr)

# Ler o Arquivo CSV no R
# Carregar os Dados
dados <- read.csv("dados_fazenda.csv", stringsAsFactors = FALSE)

# Exibir as primeiras linhas dos dados para verificar
head(dados)

# Calcular a média e o desvio padrão de uma coluna específica
# Substitua 'coluna_nome' pelo nome real da coluna
media <- mean(dados$Área, na.rm = TRUE)
desvio_padrao <- sd(dados$Área, na.rm = TRUE)

# Exibir os resultados
cat("Média da Área Plantada:", media, "\n")
cat("Desvio Padrão da Média:", desvio_padrao, "\n\n")
