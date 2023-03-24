import 'package:flutter/material.dart';
import 'package:groceteria_app/Providers/ThemeProviders/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'Features/Home/bottom_bar.dart';
import 'Features/Home/home_screen.dart';
import 'Themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//Object oof Dark Theme Provider
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  //Getting theme from class DrakThemeProvider.
  void getCurrentTheme() async {
    themeChangeProvider.setDarkTheme =
        (await themeChangeProvider.darkThemePrefs.getTheme());
  }

  @override
  void initState() {
    super.initState();
    getCurrentTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: const BottomBarScreen(),
        );
      }),
    );
  }
}
