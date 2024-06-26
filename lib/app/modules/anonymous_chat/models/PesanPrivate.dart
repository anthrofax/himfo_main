class PesanPrivate {
  String message;
  String created_at;
  int admin;
  int id;

  PesanPrivate({
    required this.message,
    required this.id,
    required this.created_at,
    required this.admin,
  });

  factory PesanPrivate.fromJson(Map<String, dynamic> map) {
    return PesanPrivate(
      message: map['message'],
      id: map['id'],
      created_at: map['created_at'],
      admin: map['admin'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'message': message, 'id': id, 'created_at': created_at, 'admin': admin};
}
