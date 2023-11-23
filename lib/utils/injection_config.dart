import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_app/data/usecases/auth_repository.dart';
import 'package:target_app/data/usecases/text_repository.dart';

import '../presentation/presenters/home_page_store.dart';

void configureInjection(SharedPreferences sharedPreferences) {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  Get.lazyPut(() => AuthRepository());

  getIt.registerLazySingleton<HomePageStore>(
    () => HomePageStore(TextRepository()),
  );
}
