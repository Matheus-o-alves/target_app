import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              _launchURL();
            },
            child: const Text(
              'Privacy Policy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL() async {
    const String url = 'https://www.google.com';
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
