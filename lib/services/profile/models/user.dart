class User {
  final int id;
  final String username;
  final String email;
  final String avatarUrl;
  final bool emailVerified;
  final DateTime? createdAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.avatarUrl,
    required this.emailVerified,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int,
    username: json['username'] as String? ?? '',
    email: json['email'] as String? ?? '',
    avatarUrl: json['avatar_url'] as String? ?? '',
    emailVerified: json['email_verified'] as bool? ?? false,
    createdAt: json['created_at'] != null
        ? DateTime.tryParse(json['created_at'] as String)
        : null,
  );
}
