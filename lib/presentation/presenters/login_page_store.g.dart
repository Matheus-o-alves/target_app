// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginPageStore on _LoginPageStore, Store {
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin =>
      (_$canLoginComputed ??= Computed<bool>(() => super.canLogin,
              name: '_LoginPageStore.canLogin'))
          .value;

  late final _$errorAtom =
      Atom(name: '_LoginPageStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$emailErrorAtom =
      Atom(name: '_LoginPageStore.emailError', context: context);

  @override
  String? get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String? value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: '_LoginPageStore.passwordError', context: context);

  @override
  String? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$loginWithEmailAndPasswordAsyncAction = AsyncAction(
      '_LoginPageStore.loginWithEmailAndPassword',
      context: context);

  @override
  Future<void> loginWithEmailAndPassword(String email, String password) {
    return _$loginWithEmailAndPasswordAsyncAction
        .run(() => super.loginWithEmailAndPassword(email, password));
  }

  late final _$registerWithEmailAndPasswordAsyncAction = AsyncAction(
      '_LoginPageStore.registerWithEmailAndPassword',
      context: context);

  @override
  Future<void> registerWithEmailAndPassword(String email, String password) {
    return _$registerWithEmailAndPasswordAsyncAction
        .run(() => super.registerWithEmailAndPassword(email, password));
  }

  late final _$_LoginPageStoreActionController =
      ActionController(name: '_LoginPageStore', context: context);

  @override
  void navigationHomePage() {
    final _$actionInfo = _$_LoginPageStoreActionController.startAction(
        name: '_LoginPageStore.navigationHomePage');
    try {
      return super.navigationHomePage();
    } finally {
      _$_LoginPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_LoginPageStoreActionController.startAction(
        name: '_LoginPageStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_LoginPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_LoginPageStoreActionController.startAction(
        name: '_LoginPageStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_LoginPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
emailError: ${emailError},
passwordError: ${passwordError},
canLogin: ${canLogin}
    ''';
  }
}
