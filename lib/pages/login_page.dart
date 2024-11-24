import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/auth/auth_cubit.dart';
import 'package:flutter_nusacodes_2/blocs/auth/auth_state.dart';
import 'package:flutter_nusacodes_2/consts/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late final AuthCubit authCubit;

  @override
  void initState() {
    authCubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (p, c) => (
            (p.errorMessage == '' && c.errorMessage != '') ||
            (p.isLoggedIn == false && c.isLoggedIn == true)
          ),
          listener: (context, state) {
            print('state.isLoggedIn: ${state.isLoggedIn}');
            if(state.errorMessage != '') {
              showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                  title: const Text('Gagal Login'),
                  content: Text(state.errorMessage),
                  actions: [
                    FilledButton(
                      onPressed: () => Navigator.pop(context), 
                      child: const Text('OK')
                    )
                  ],
                )
              );
            } else if(state.isLoggedIn) {
              Navigator.pushReplacementNamed(context, AppRoutes.main);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return FilledButton(
                  onPressed: () => authCubit.login(
                    email: emailController.text,
                    password: passwordController.text
                  ), 
                  child: state.loading 
                      ? const CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ) 
                      : const Text("Login"),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}