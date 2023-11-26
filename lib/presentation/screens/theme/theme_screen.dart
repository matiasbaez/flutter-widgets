import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgets_app/presentation/providers/providers.dart';

class ThemeScren extends ConsumerWidget {

  static const String name = 'theme_screen';

  const ThemeScren({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () => ref.read(isDarkModeProvider.notifier).update((state) => !state),
            icon: Icon( isDarkMode ?  Icons.light_mode_outlined : Icons.dark_mode_outlined )
          ),
        ],
      ),

      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {

  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colorList = ref.watch(colorListProvider);
    final selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (BuildContext context, int index) {
        final Color color = colorList[index];
        return ListTile(
          onTap: () {
            ref.read(selectedColorProvider.notifier).state = index;
          },
          leading: CircleAvatar(backgroundColor: colorList[index]),
          title: Text('#${color.value.toRadixString(16).toUpperCase()}'),
          subtitle: Text('${color.value}'),
          trailing: Switch(
            value: index == selectedColor,
            activeColor: color,
            onChanged: (value) {
              ref.read(selectedColorProvider.notifier).state = value ? index : 0;
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
