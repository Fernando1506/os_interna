class User {
  String nome;
  UserRole role;

  User({
    required this.nome,
    required this.role,
  });
}

enum UserRole {
  suporte,
  fiscalFinanceiro,
}
