import 'package:flutter/cupertino.dart';
import 'package:gitboy/common/values/values.dart';

class LoginReq {
  String grantType;
  String username;
  String password;
  String clientId;
  String clientSecret;
  String scope;

  LoginReq({
    this.grantType = Gitee.grantType,
    @required this.username,
    @required this.password,
    this.clientId = Gitee.clientId,
    this.clientSecret = Gitee.clientSecret,
    this.scope = Gitee.scope,
  });

  LoginReq.fromJson(Map<String, dynamic> json) {
    grantType = json['grant_type'];
    username = json['username'];
    password = json['password'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grant_type'] = this.grantType;
    data['username'] = this.username;
    data['password'] = this.password;
    data['client_id'] = this.clientId;
    data['client_secret'] = this.clientSecret;
    data['scope'] = this.scope;
    return data;
  }

  @override
  String toString() {
    return 'LoginReq{grantType: $grantType, username: $username, password: $password, clientId: $clientId, clientSecret: $clientSecret, scope: $scope}';
  }
}

class LoginResp {
  String accessToken;
  String tokenType;
  int expiresIn;
  String refreshToken;
  String scope;
  int createdAt;

  LoginResp({this.accessToken, this.tokenType, this.expiresIn, this.refreshToken, this.scope, this.createdAt});

  LoginResp.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    refreshToken = json['refresh_token'];
    scope = json['scope'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['refresh_token'] = this.refreshToken;
    data['scope'] = this.scope;
    data['created_at'] = this.createdAt;
    return data;
  }

  @override
  String toString() {
    return 'LoginResp{accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn, refreshToken: $refreshToken, scope: $scope, createdAt: $createdAt}';
  }
}
