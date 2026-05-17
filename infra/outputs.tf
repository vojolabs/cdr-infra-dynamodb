output "dynamodb_table_name" {
  description = "O nome da tabela DynamoDB para o cadastro de alunos"
  value       = aws_dynamodb_table.alunos_cadastro.name
}

output "dynamodb_table_arn" {
  description = "O ARN principal da tabela DynamoDB (Útil para políticas de IAM)"
  value       = aws_dynamodb_table.alunos_cadastro.arn
}

output "dynamodb_table_stream_arn" {
  description = "O ARN do Stream da tabela (caso decida ativar triggers no futuro)"
  value       = aws_dynamodb_table.alunos_cadastro.stream_arn
}

# Output específico para o ARN dos GSIs (Muitas vezes as Lambdas precisam de permissão no index também)
output "dynamodb_table_gsi_arns" {
  description = "Mapa com os ARNs dos Índices Secundários Globais"
  value = {
    nome_aluno = "${aws_dynamodb_table.alunos_cadastro.arn}/index/gsi_nome_aluno"
    cpf        = "${aws_dynamodb_table.alunos_cadastro.arn}/index/gsi_cpf"
  }
}

output "pertences_table_name" {
  description = "O nome da tabela DynamoDB para o inventário de pertences"
  value       = aws_dynamodb_table.alunos_pertences.name
}

output "pertences_table_arn" {
  description = "O ARN principal da tabela de pertences"
  value       = aws_dynamodb_table.alunos_pertences.arn
}

output "pertences_table_gsi_nome_aluno_arn" {
  description = "O ARN do GSI de nome_aluno para a tabela de pertences"
  value       = "${aws_dynamodb_table.alunos_pertences.arn}/index/gsi_nome_aluno"
}