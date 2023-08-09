class UserModel {
  final int id;
  final String email;

  const UserModel({required this.id, required this.email});

  @override
  String toString() => 'UserModel [id: $id, email: $email]';
}
