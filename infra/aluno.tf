resource "aws_dynamodb_table" "alunos_cadastro" {
  name         = "cdr001_alunos_cadastro"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id_aluno"

  # Atributos que servem como chaves (PK ou chaves de GSI)
  attribute {
    name = "id_aluno"
    type = "S" 
  }

  attribute {
    name = "nome_aluno"
    type = "S" 
  }

  attribute {
    name = "cpf"
    type = "S"
  }

  # GSI 1: Busca alfabética por Nome do Aluno
  global_secondary_index {
    name            = "gsi_nome_aluno"
    hash_key        = "nome_aluno"
    projection_type = "ALL" # Projeta todos os atributos para evitar lookups caros na tabela principal
  }

  # GSI 2: Busca por CPF (Histórico / Readmissão)
  global_secondary_index {
    name            = "gsi_cpf"
    hash_key        = "cpf"
    projection_type = "ALL"
  }


  server_side_encryption {
    enabled = true
  }

  point_in_time_recovery {
    enabled = true
  }

  tags = {
    Project     = "cidade-refugio-backend"
    ManagedBy   = "Terraform"
  }

}