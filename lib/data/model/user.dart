class User {
  final int? id;
  final String? token;

  const User({required this.id, required this.token});

  User.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        token = json['token'];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['token'] = token;
    return data;
  }
}
