import 'package:flutter_nusacodes_2/data/database/app_database.dart';
import 'package:flutter_nusacodes_2/data/database/db/product_db.dart';
import 'package:flutter_nusacodes_2/data/local_storage/auth_local_storage.dart';
import 'package:flutter_nusacodes_2/data/local_storage/other_local_storage.dart';
import 'package:flutter_nusacodes_2/data/remote_data/auth_remote_data.dart';
import 'package:flutter_nusacodes_2/data/remote_data/network_service/network_service.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;

Future<void> setupInjector() async {
  await hiveInjector();  
  await databaseInjector();  
  localStorageInjector();
  dbInjector();
  networkInjector();
}

Future<void> hiveInjector() async {
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  var box = await Hive.openBox('app');
  getIt.registerSingleton<Box>(box);
}

Future<void> databaseInjector() async {
  final appDb = AppDatabase();
  getIt.registerSingleton(appDb);
}

void localStorageInjector() {
  getIt.registerSingleton(AuthLocalStorage(getIt.get<Box>()));
  getIt.registerSingleton(OtherLocalStorage(getIt.get<Box>()));
}

void dbInjector() {
  getIt.registerSingleton(ProductDb(getIt.get()));
}

void networkInjector() {
  getIt.registerSingleton(NetworkService(getIt.get()));
  getIt.registerSingleton(AuthRemoteData(getIt.get()));
}