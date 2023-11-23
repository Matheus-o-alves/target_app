// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:target_app/domain/usecases/text_usecases.dart';

part 'home_page_store.g.dart';

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  final TextRepositoryInterface _textRepository;

  _HomePageStore(this._textRepository) {
    loadSavedTexts();
  }

  @observable
  ObservableList<String> textList = ObservableList<String>();

  @action
  Future<void> addText(String text) async {
    textList.add(text);
    await _saveTextsToRepository();
  }

  @action
  Future<void> removeText(int index) async {
    textList.removeAt(index);
    await _saveTextsToRepository();
  }

  @action
  Future<void> loadSavedTexts() async {
    try {
      List<String> savedTexts = await _textRepository.fetchTexts();

      if (savedTexts.isNotEmpty) {
        textList.addAll(savedTexts);
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> _saveTextsToRepository() async {
    try {
      await _textRepository.addText(textList.last);
    } catch (e) {
      debugPrint('$e');
    }
  }
}
