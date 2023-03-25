import 'package:flutter/material.dart';
import 'package:groceteria_app/Providers/ThemeProviders/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class UtilsPack {
  BuildContext context;
  UtilsPack(this.context);

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Size get screenSize => MediaQuery.of(context).size;
}
