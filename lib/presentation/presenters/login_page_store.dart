// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:target_app/domain/usecases/auth_usecase.dart';

part 'login_page_store.g.dart';

class LoginPageStore = _LoginPageStore with _$LoginPageStore;

abstract class _LoginPageStore with Store {
  final AuthUseCase
      _authUseCase; // Referência para o caso de uso de autenticação

  _LoginPageStore(this._authUseCase);

  final StreamController<String?> _navigateToStreamController =
      StreamController<String?>.broadcast();

  Stream<String?> get navigateToStream => _navigateToStreamController.stream;

  @observable
  String? error;

  @observable
  String? emailError;

  @observable
  String? passwordError;

  @action
  void navigationHomePage() {
    _navigateToStreamController.add('/product-list-page');
  }

  @action
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _authUseCase.signInWithEmailAndPassword(email, password);

      navigationHomePage();
    } catch (e) {
      error = e.toString();
    }
  }

  @action
  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      await _authUseCase.signUpWithEmailAndPassword(email, password);

      navigationHomePage();
    } catch (e) {
      error = e.toString();
    }
  }

  @action
  void validateEmail(String value) {
    final emailRegex = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'); // Expressão regular básica para e-mail

    if (value.isEmpty) {
      emailError = 'Campo de e-mail obrigatório';
    } else if (!emailRegex.hasMatch(value)) {
      emailError = 'E-mail inválido';
    } else if (value.trimRight() != value) {
      emailError = 'E-mail não pode terminar com espaço';
    } else {
      emailError = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError = 'Campo de senha obrigatório';
    } else if (value.length < 2) {
      passwordError = 'Senha deve ter pelo menos dois caracteres';
    } else if (value.trimRight() != value) {
      passwordError = 'Senha não pode terminar com espaço';
    } else {
      // Adicione sua lógica de validação de caracteres especiais aqui
      passwordError = null;
    }
  }

  @computed
  bool get canLogin => emailError == null && passwordError == null;

  void dispose() {
    _navigateToStreamController.close();
  }
}
