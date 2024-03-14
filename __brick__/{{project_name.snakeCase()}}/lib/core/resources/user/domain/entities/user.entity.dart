class User {
  final int id;
  final String email;

  const User({required this.id, required this.email});

  @override
  String toString() => 'User [id: $id, email: $email]';
}
