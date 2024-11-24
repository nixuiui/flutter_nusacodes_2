import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/auth/auth_state.dart';
import 'package:flutter_nusacodes_2/models/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(
      loading: true,
      errorMessage: ''
    ));
    

    // TODO: Check login from data resource
    await Future.delayed(const Duration(seconds: 2));
    if(
      email == "randy@gmail.com" &&
      password == "123456"
    ) {
      final user = User(
        name: "Randy",
        email: "randy@gmail.com"
      );
      emit(state.copyWith(
        loading: false,
        user: user,
        isLoggedIn: true
      ));
    } else {
      emit(state.copyWith(
        loading: false,
        errorMessage: "Username atau password salah"
      ));
    }

  }

}