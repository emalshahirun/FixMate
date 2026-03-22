// lib/widgets/settings_scaffold.dart
import 'package:flutter/material.dart';

class SettingsScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  const SettingsScaffold({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title),
        centerTitle: true,
      ),
      body: body,
    );
  }
}