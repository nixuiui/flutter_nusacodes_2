import 'user_model.dart';

class AuthResponseModel {
  final User? user;
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;

  AuthResponseModel({
    this.user,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
