import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/ThemeProviders/dark_theme_provider.dart';
import '../../Themes/theme.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenWidth * 0.5,
      width: screenWidth * 0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: themeState.getDarkTheme
              ? [
                  bgColorDark,
                  bgLightBlack,
                ]
              : [
                  Colors.white,
                  Colors.amber.shade100,
                ],
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: themeState.getDarkTheme
                ? Colors.amber.withOpacity(0.1)
                : Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            height: screenWidth * 0.3,
            width: screenWidth * 0.3,
            decoration: const BoxDecoration(
                // color: Colors.black,
                image: DecorationImage(
                    image: AssetImage('assets/category/fruits.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            height: screenWidth * 0.1,
            width: screenWidth * 0.4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: themeState.getDarkTheme
                    ? bgLightBlack
                    : Colors.amber.shade400,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: const Text(
              'Fruits',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
