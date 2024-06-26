class Pesan {
  String message;
  String created_at;
  int id;

  Pesan({required this.message, required this.id, required this.created_at});

  factory Pesan.fromJson(Map<String, dynamic> map) {
    return Pesan(
      message: map['message'],
      id: map['id'],
      created_at: map['created_at'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'message': message, 'id': id, 'created_at': created_at};
}
