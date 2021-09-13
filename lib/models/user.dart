import 'dart:convert';

class User {
  final String? name;
  final String email;
  final String userId;
  final String id;
  User({
    this.name,
    required this.email,
    required this.userId,
    required this.id,
  });

  User copyWith({
    String? name,
    String? email,
    String? userId,
    String? id,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      userId: userId ?? this.userId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'userId': userId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      email: map['email'],
      userId: map['userId'],
      id: map['\$id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, email: $email, userId: $userId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.userId == userId &&
      other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      userId.hashCode ^
      id.hashCode;
  }
}
