import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/auth/auth_state.dart';
import 'package:flutter_nusacodes_2/data/local_storage/auth_local_storage.dart';
import 'package:flutter_nusacodes_2/data/remote_data/auth_remote_data.dart';

class AuthCubit extends Cubit<AuthState> {

  late final AuthLocalStorage authLocalStorage;
  late final AuthRemoteData authRemoteData;

  AuthCubit(
    this.authLocalStorage,
    this.authRemoteData,
  ) : super(const AuthState());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(
      loading: true,
      errorMessage: ''
    ));

    try {
      final response = await authRemoteData.postLogin(email, password);
      await authLocalStorage.setToken(response.accessToken ?? '');
      await authLocalStorage.setUser(response.user!);

      emit(state.copyWith(
        loading: false,
        user: response.user!,
        isLoggedIn: true
      ));
    } catch (e) {
      emit(state.copyWith(
        loading: false,
        errorMessage: "$e"
      ));
    }

  }

  bool isLoggedIn() {
    final token = authLocalStorage.getToken();
    if(token?.isEmpty ?? true) {
      return false;
    } else {
      final user = authLocalStorage.getUser();
      emit(state.copyWith(
        user: user,
        isLoggedIn: true
      ));
      return true;
    }
  }

  Future<void> refreshProfile() async {
    try {
      final user = await authRemoteData.getProfile();
      await authLocalStorage.setUser(user);
      emit(state.copyWith(
        user: user,
      ));
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> logout() async {
    await authLocalStorage.clear();
  }

}