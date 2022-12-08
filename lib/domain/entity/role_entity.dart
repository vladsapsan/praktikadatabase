class RoleEntity {
  late int id;
  final String role;

  RoleEntity({required this.role});
}

enum RoleEnum {
  admin(id: 1, name: 'Администратор'),
  user(id: 2, name: 'Пользователь');

  const RoleEnum({
    required this.id,
    required this.name,
  });

  final String name;
  final int id;
}
