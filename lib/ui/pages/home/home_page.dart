import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_app/presentation/presenters/home_page_store.dart';
import 'package:target_app/ui/pages/widgets/privacy_policy_widget.dart';

class HomePage extends StatefulWidget {
  final HomePageStore homePageStore;

  const HomePage({Key? key, required this.homePageStore}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFocus = FocusNode();

  @override
  void dispose() {
    _textController.dispose();
    _textFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Target System')),
        backgroundColor: const Color(0xFF235E6E),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF235E6E),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: Colors.white,
                  child: Observer(
                    builder: (_) => ListView.builder(
                      itemCount: widget.homePageStore.textList.length,
                      itemBuilder: (context, index) {
                        final text = widget.homePageStore.textList[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          color: Colors.white,
                          child: ListTile(
                            title: Text(
                              text,
                              style: const TextStyle(color: Colors.black),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.black),
                                  onPressed: () {
                                    // Adicione a lógica de edição aqui
                                    // widget.homePageStore.editText(index);
                                  },
                                ),
                                InkWell(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 24, // Tamanho do ícone
                                    ),
                                  ),
                                  onTap: () {
                                    _showDeleteConfirmationDialog(index);
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: _textFocus,
                      controller: _textController,
                      decoration: const InputDecoration(
                        hintText: 'Digite Seu Texto',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.black),
                      onSubmitted: (text) {
                        _submitText();
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.save, color: Colors.green),
                    onPressed: _submitText,
                  ),
                ],
              ),
            ),
            const PrivacyPolicyText(),
          ],
        ),
      ),
    );
  }

  void _submitText() {
    final newText = _textController.text.trim();
    if (newText.isNotEmpty) {
      widget.homePageStore.addText(newText);
      _textController.clear();
    } else {
      FocusScope.of(context).requestFocus(_textFocus);
    }
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmação'),
          content: const Text('Tem certeza que deseja excluir este item?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Excluir'),
              onPressed: () {
                widget.homePageStore.removeText(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
