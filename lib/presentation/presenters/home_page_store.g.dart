// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _HomePageStore, Store {
  late final _$textListAtom =
      Atom(name: '_HomePageStore.textList', context: context);

  @override
  ObservableList<String> get textList {
    _$textListAtom.reportRead();
    return super.textList;
  }

  @override
  set textList(ObservableList<String> value) {
    _$textListAtom.reportWrite(value, super.textList, () {
      super.textList = value;
    });
  }

  late final _$addTextAsyncAction =
      AsyncAction('_HomePageStore.addText', context: context);

  @override
  Future<void> addText(String text) {
    return _$addTextAsyncAction.run(() => super.addText(text));
  }

  late final _$removeTextAsyncAction =
      AsyncAction('_HomePageStore.removeText', context: context);

  @override
  Future<void> removeText(int index) {
    return _$removeTextAsyncAction.run(() => super.removeText(index));
  }

  late final _$loadSavedTextsAsyncAction =
      AsyncAction('_HomePageStore.loadSavedTexts', context: context);

  @override
  Future<void> loadSavedTexts() {
    return _$loadSavedTextsAsyncAction.run(() => super.loadSavedTexts());
  }

  @override
  String toString() {
    return '''
textList: ${textList}
    ''';
  }
}
