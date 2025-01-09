class User {
  final String id; // Unique identifier
  final String username;
  final String email;
  final String password;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  // Create User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}
