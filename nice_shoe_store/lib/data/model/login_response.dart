class LoginResponse {
  LoginResponse({
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
  });

  LoginResponse.fromJson(dynamic json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  String? tokenType;
  int? expiresIn;
  String? accessToken;
  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    map['access_token'] = accessToken;
    map['refresh_token'] = refreshToken;
    return map;
  }
}
