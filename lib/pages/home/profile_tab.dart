import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/auth/auth_cubit.dart';
import 'package:flutter_nusacodes_2/blocs/auth/auth_state.dart';
import 'package:flutter_nusacodes_2/consts/routes.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Profile Tab"),
      ),
      body: RefreshIndicator(
        onRefresh: () => context.read<AuthCubit>().refreshProfile(),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage("https://akcdn.detik.net.id/community/media/visual/2022/12/25/lionel-messi_169.jpeg?w=600&q=90"),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.user?.name ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      state.user?.email ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: () async {
                        await context.read<AuthCubit>().logout();
                        if(context.mounted) {
                          Navigator.pushReplacementNamed(context, AppRoutes.login);
                        }
                      }, 
                      child: const Text("Logout")
                    )
                  ],
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}