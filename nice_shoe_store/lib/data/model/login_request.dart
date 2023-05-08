import 'dart:convert';

LoginRequest loginRequestFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    String? username,
    String? password,
    String? grantType = "password",
    num? clientId = 2,
    String? clientSecret = "kyj1c9sVcksqGU4scMX7nLDalkjp2WoqQEf8PKAC",
  }) {
    _username = username;
    _password = password;
    _grantType = grantType;
    _clientId = clientId;
    _clientSecret = clientSecret;
  }

  LoginRequest.fromJson(dynamic json) {
    _username = json['username'];
    _password = json['password'];
    _grantType = json['grant_type'];
    _clientId = json['client_id'];
    _clientSecret = json['client_secret'];
  }

  String? _username;
  String? _password;
  String? _grantType;
  num? _clientId;
  String? _clientSecret;

  LoginRequest copyWith({
    String? username,
    String? password,
    String? grantType,
    num? clientId,
    String? clientSecret,
  }) =>
      LoginRequest(
        username: username ?? _username,
        password: password ?? _password,
        grantType: grantType ?? _grantType,
        clientId: clientId ?? _clientId,
        clientSecret: clientSecret ?? _clientSecret,
      );

  String? get username => _username;

  String? get password => _password;

  String? get grantType => _grantType;

  num? get clientId => _clientId;

  String? get clientSecret => _clientSecret;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['password'] = _password;
    map['grant_type'] = _grantType;
    map['client_id'] = _clientId;
    map['client_secret'] = _clientSecret;
    return map;
  }
}
