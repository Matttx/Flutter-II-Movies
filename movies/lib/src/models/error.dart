class APIError {
  final String? message;

  APIError({required this.message});

  factory APIError.fromJson(Map<String, dynamic> json) {
    try {
      return APIError(message: json['message']);
    } catch (e) {
      return APIError(message: null);
    }
  }
}
