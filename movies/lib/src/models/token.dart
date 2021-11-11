class Token {
  final jwt;

  Token({required this.jwt});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      jwt: json['result']
    );
  }
}