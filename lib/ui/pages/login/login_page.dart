// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:target_app/presentation/presenters/login_page_store.dart';
import 'package:target_app/ui/pages/widgets/privacy_policy_widget.dart';

class LoginPage extends StatefulWidget {
  final LoginPageStore presenter;

  const LoginPage({Key? key, required this.presenter}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF235E6E),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            Observer(
              builder: (_) => RoundedIconTextField(
                icon: Icons.person,
                labelText: 'E-mail',
                controller: emailController,
                isPassword: false,
                errorText: widget.presenter.emailError,
                onChanged: (value) {
                  widget.presenter.validateEmail(value);
                },
              ),
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) => RoundedIconTextField(
                icon: Icons.lock,
                labelText: 'Password'.tr,
                controller: passwordController,
                isPassword: true,
                errorText: widget.presenter.passwordError,
                onChanged: (value) {
                  widget.presenter.validatePassword(value);
                },
              ),
            ),
            const SizedBox(height: 22),
            Observer(
              builder: (_) => RoundedButton(
                onPressed: () {
                  final email = emailController.text;
                  final password = passwordController.text;
                  widget.presenter.loginWithEmailAndPassword(email, password);
                },
                label: 'login'.tr,
                color: Colors.green,
                isEnabled: widget.presenter.canLogin,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                _showRegisterDialog(context, widget.presenter);
              },
              child: Text(
                'register_new_account'.tr,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const PrivacyPolicyText(),
          ],
        ),
      ),
    );
  }
}

Future<void> _showRegisterDialog(
    BuildContext context, LoginPageStore presenter) async {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Registrar nova conta',
            style: TextStyle(color: Colors.white)),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'password'.tr),
                obscureText: true,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              final email = emailController.text;
              final password = passwordController.text;
              await presenter.registerWithEmailAndPassword(email, password);
              await Future.delayed(const Duration(milliseconds: 2000));
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            },
            child: Text('register'.tr),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('cancel'.tr),
          ),
        ],
      );
    },
  );
}

class RoundedIconTextField extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const RoundedIconTextField({
    Key? key,
    required this.icon,
    required this.labelText,
    required this.controller,
    required this.isPassword,
    this.errorText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          hintText:
              'enter_your_${labelText.toLowerCase().replaceAll(" ", "_")}'.tr,
          prefixIcon: Icon(
            icon,
            color: const Color(0xFF5F3473),
          ),
          border: InputBorder.none,
          errorText: errorText,
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color color;
  final bool isEnabled;

  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.color,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          color,
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
