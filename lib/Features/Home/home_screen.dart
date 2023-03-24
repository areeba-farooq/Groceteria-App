import 'package:flutter/material.dart';
import 'package:groceteria_app/Providers/ThemeProviders/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: SwitchListTile(
          activeColor: Colors.yellow,
          title: const Text("Theme"),
          secondary: Icon(themeState.getDarkTheme
              ? Icons.dark_mode_rounded
              : Icons.light_mode),
          onChanged: (bool value) {
            setState(() {
              themeState.setDarkTheme = value;
            });
          },
          value: themeState.getDarkTheme,
        ),
      ),
    );
  }
}
