class ErrorResponse {
  ErrorResponse({
    String? error,
    String? message,
  }) {
    _error = error;
    _message = message;
  }

  ErrorResponse.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
  }

  String? _error;
  String? _message;

  ErrorResponse copyWith({
    String? error,
    String? message,
  }) =>
      ErrorResponse(
        error: error ?? _error,
        message: message ?? _message,
      );

  String? get error => _error;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    return map;
  }
}
