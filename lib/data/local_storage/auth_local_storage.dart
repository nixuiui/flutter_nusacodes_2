import 'package:flutter_nusacodes_2/models/user_model.dart';
import 'package:hive/hive.dart';

class AuthLocalStorage {

  late final Box box;

  AuthLocalStorage(this.box);

  Future<void> setToken(String value) async {
    await box.put('token', value);
  }

  String? getToken() {
    return box.get('token');
  }

  Future<void> setUser(User value) async {
    await box.put('name', value.name);
    await box.put('email', value.email);
  }

  User? getUser() {
    final name = box.get('name');
    final email = box.get('email');
    if(name != null) {
      return User(name: name, email: email);
    }
    return null;
  }

  Future<void> clear() async {
    await box.delete('token');
    await box.delete('name');
    await box.delete('email');
  }

}