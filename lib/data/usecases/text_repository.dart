import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_app/domain/usecases/text_usecases.dart';

class TextRepository implements TextRepositoryInterface {
  static const String _textKey = 'stored_text';

  @override
  Future<List<String>> fetchTexts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final storedTexts = prefs.getStringList(_textKey) ?? [];

    return storedTexts.toList(); // Retorna os textos armazenados
  }

  @override
  Future<void> addText(String newText) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> storedTexts = prefs.getStringList(_textKey) ?? [];

    storedTexts.add(newText); // Adiciona novo texto à lista

    await prefs.setStringList(_textKey, storedTexts);
  }

  @override
  Future<void> editText(int index, String newText) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> storedTexts = prefs.getStringList(_textKey) ?? [];

    if (index >= 0 && index < storedTexts.length) {
      storedTexts[index] = newText; // Edita o texto na posição especificada
      await prefs.setStringList(_textKey, storedTexts);
    }
  }

  @override
  Future<void> deleteText(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> storedTexts = prefs.getStringList(_textKey) ?? [];

    if (index >= 0 && index < storedTexts.length) {
      storedTexts.removeAt(index); // Remove o texto na posição especificada
      await prefs.setStringList(_textKey, storedTexts);
    }
  }
}
