abstract class TextRepositoryInterface {
  Future<List<String>> fetchTexts();
  Future<void> addText(String newText);
  Future<void> editText(int index, String newText);
  Future<void> deleteText(int index);
}
