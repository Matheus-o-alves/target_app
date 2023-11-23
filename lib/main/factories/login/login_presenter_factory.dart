import 'package:target_app/domain/usecases/auth_usecase.dart';

import '../../../data/usecases/auth_repository.dart';
import '../../../presentation/presenters/login_page_store.dart';

import 'package:get/get.dart';

LoginPageStore makeGetXLoginPresenter() {
  final AuthUseCase authUseCase = Get.put(AuthRepository());
  return LoginPageStore(authUseCase);
}
