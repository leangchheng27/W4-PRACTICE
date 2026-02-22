import 'package:flutter/material.dart';

enum ThemeColor {
  blue(materialColor: Colors.blue),
  green(materialColor: Colors.green),
  pink(materialColor: Colors.pink);

  const ThemeColor({required this.materialColor});
  final MaterialColor materialColor;
  Color get color => materialColor;
  Color get backgroundColor => materialColor.shade100;
}

ThemeColor currentThemeColor = ThemeColor.blue;

class ThemeService extends ChangeNotifier {
  MaterialColor _themeColor = Colors.blue;
  MaterialColor get themeColor => _themeColor;

  void setThemeColor(MaterialColor color) {
    _themeColor = color;
    notifyListeners();
  }
}

final themeService = ThemeService();
