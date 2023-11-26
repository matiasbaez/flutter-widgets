import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:colornames/colornames.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgets_app/presentation/providers/providers.dart';

class ThemeScren extends ConsumerWidget {

  static const String name = 'theme_screen';

  const ThemeScren({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appTheme = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () => ref.read(themeNotifierProvider.notifier).toggleDarkMode(),
            icon: Icon( appTheme.isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined )
          ),
        ],
      ),

      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {

  final defaultThemeColor = 0;

  const _ThemeChangerView();

  void copyToClipBoard(BuildContext context, String value) {
    Clipboard.setData(ClipboardData(text: value)).then((_) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Color copied to clipboard")));
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colorList = ref.watch(colorListProvider);
    final appTheme = ref.watch(themeNotifierProvider);

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (BuildContext context, int index) {

        final Color color = colorList[index];
        final String radixString = color.value.toRadixString(16).toUpperCase();

        return ListTile(
          onTap: () {
            final selectedColor = (appTheme.selectedColor == index) ? defaultThemeColor : index;
            ref.read(themeNotifierProvider.notifier).changeSelectedColor(selectedColor);
            copyToClipBoard(context, radixString);
          },
          leading: CircleAvatar(backgroundColor: colorList[index]),
          title: Text(color.colorName),
          subtitle: Text('#$radixString'),
          trailing: Switch(
            value: index == appTheme.selectedColor,
            activeColor: color,
            onChanged: (value) async {
              final selectedColor = value ? index : defaultThemeColor;
              ref.read(themeNotifierProvider.notifier).changeSelectedColor(selectedColor);
              copyToClipBoard(context, radixString);
            }
          ),
        );
        // return RadioListTile(
        //   value: index,
        //   groupValue: selectedColor,
        //   onChanged: (value) {
        //     ref.read(selectedColorProvider.notifier).state = index;
        //   },
        //   activeColor: color,
        //   title: Text('Material color', style: TextStyle(color: color)),
        //   subtitle: Text('#${color.value.toRadixString(16)}'),
        // );
      },
    );
  }
}
