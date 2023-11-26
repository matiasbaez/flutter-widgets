
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/config.dart';

// Provider -> inmutable values
final colorListProvider = Provider((ref) => colorList);

// StateProvider -> mutable value
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// final selectedColorProvider = StateProvider<int>((ref) => 0);

// StateNotifierProvider -> Complex data type
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {

  // State = AppTheme instance
  ThemeNotifier() : super( AppTheme() );

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeSelectedColor(int selectedColor) {
    state = state.copyWith(selectedColor: selectedColor);
  }

}
