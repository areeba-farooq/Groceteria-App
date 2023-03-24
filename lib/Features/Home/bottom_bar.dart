import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:groceteria_app/Features/Cart/cartscreen.dart';
import 'package:groceteria_app/Features/Category/categories_screen.dart';
import 'package:groceteria_app/Features/Home/home_screen.dart';
import 'package:groceteria_app/Features/Users/users_screen.dart';
import 'package:groceteria_app/Themes/theme.dart';
import 'package:provider/provider.dart';

import '../../Providers/ThemeProviders/dark_theme_provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': 'Feed'},
    {'page': const CategoryScreen(), "title": 'Explore'},
    {'page': const CartScreen(), 'title': 'Cart'},
    {'page': const UserScreen(), 'title': 'Account'},
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor:
              themeState.getDarkTheme ? bgLightBlack : Colors.white,
          title: Text(
            _pages[_selectedIndex]['title'],
            style: TextStyle(
                color:
                    themeState.getDarkTheme ? Colors.amber[400] : bgColorDark),
          )),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,
          color: themeState.getDarkTheme ? bgLightBlack : Colors.amber.shade400,
          backgroundColor: themeState.getDarkTheme ? bgColorDark : bgWhite,
          buttonBackgroundColor: Colors.amber[400],
          items: const <Widget>[
            Icon(IconlyLight.home, size: 30),
            Icon(IconlyLight.category, size: 30),
            Icon(IconlyLight.buy, size: 30),
            Icon(IconlyLight.user2, size: 30),
          ],
          onTap: _selectedPage),
    );
  }
}
