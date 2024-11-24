import 'package:equatable/equatable.dart';
import 'package:flutter_nusacodes_2/models/user_model.dart';

class AuthState extends Equatable {

  final User? user;
  final bool isLoggedIn;
  final bool loading;
  final String errorMessage;

  const AuthState({
    this.user,
    this.isLoggedIn = false,
    this.loading = false,
    this.errorMessage = '',
  });

  AuthState copyWith({
    User? user,
    bool? isLoggedIn,
    bool? loading,
    String? errorMessage,
  }) => AuthState(
    user: user ?? this.user,
    isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    loading: loading ?? this.loading,
    errorMessage: errorMessage ?? this.errorMessage
  );

  @override
  List<Object?> get props => [
    user,
    isLoggedIn,
    loading,
    errorMessage,
  ];

}