
import 'package:flutter/material.dart';

const _colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }) : assert(selectedColor >= 0 && selectedColor < _colorList.length, 'Selected color must be between 0 and ${_colorList.length-1}') ;

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: _colorList[ selectedColor ],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );

}
