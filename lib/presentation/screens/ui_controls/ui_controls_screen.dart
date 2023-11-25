
import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {

  static const String name = 'ui_screen';

  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls Screen')),
    );
  }
}
