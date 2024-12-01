import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nusacodes_2/blocs/auth/auth_cubit.dart';
import 'package:flutter_nusacodes_2/blocs/order/order_cubit.dart';
import 'package:flutter_nusacodes_2/consts/colors.dart';
import 'package:flutter_nusacodes_2/consts/routes.dart';
import 'package:flutter_nusacodes_2/data/local_storage/auth_local_storage.dart';
import 'package:flutter_nusacodes_2/data/remote_data/auth_remote_data.dart';
import 'package:flutter_nusacodes_2/helpers/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await setupInjector();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(
          getIt.get<AuthLocalStorage>(),
          getIt.get<AuthRemoteData>(),
        )),
        BlocProvider(create: (context) => OrderCubit(
          getIt.get()
        )),
      ],
      child: MaterialApp(
        title: 'Nusacodes Batch 2',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            primary: ColorCustom.primary,
          ),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.splash,
        routes: routes,
      ),
    );
  }
}
