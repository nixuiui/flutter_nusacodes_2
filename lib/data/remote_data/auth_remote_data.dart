import 'package:flutter_nusacodes_2/data/remote_data/network_service/network_service.dart';
import 'package:flutter_nusacodes_2/models/auth_response_model.dart';
import 'package:flutter_nusacodes_2/models/user_model.dart';

class AuthRemoteData {

  late final NetworkService networkService;

  AuthRemoteData(this.networkService);

  Future<AuthResponseModel> login(String email, String password) async {
    final response = await networkService.post(
      url: "/api/auth/login",
      data: {
        "email": email,
        "password": password
      }
    );
    return AuthResponseModel.fromJson(response.data['data']);
  }

  Future<User> getProfile() async {
    final response = await networkService.get(
      url: "/api/profile/me"
    );
    return User.fromJson(response.data['data']);
  }

}