resource "aws_dynamodb_table" "alunos_pertences" {
  name         = "cdr002_alunos_pertences"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id_aluno"

  # Atributos obrigatórios por serem chaves (PK ou GSI)
  attribute {
    name = "id_aluno"
    type = "S" # String (ID de 5 dígitos, ex: "00017")
  }

  attribute {
    name = "nome_aluno"
    type = "S"
  }

  # GSI 1: Permite listar ou buscar pertences diretamente pelo nome do aluno
  global_secondary_index {
    name            = "gsi_nome_aluno"
    hash_key        = "nome_aluno"
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