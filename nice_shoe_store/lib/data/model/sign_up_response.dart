class SignUpResponse {
  SignUpResponse({
    String? message,
  }) {
    _message = message;
  }

  SignUpResponse.fromJson(dynamic json) {
    _message = json['message'];
  }

  String? _message;

  SignUpResponse copyWith({
    String? message,
  }) =>
      SignUpResponse(
        message: message ?? _message,
      );

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }
}
