class EmailAuthRequest {
    final String email;
    final String password;

    EmailAuthRequest({required this.email, required this.password});

    Map<String, dynamic> toJson() => {
      'email': email,
      'password': password,
    };
  }