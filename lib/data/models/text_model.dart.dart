class TextModel {
  final String textContent;

  TextModel({
    required this.textContent,
  });

  factory TextModel.fromMap(Map<String, dynamic> map) {
    return TextModel(textContent: map['textContent'] ?? '');
  }

  Map<String, dynamic> toMap() {
    return {
      'textContent': textContent,
    };
  }
}
