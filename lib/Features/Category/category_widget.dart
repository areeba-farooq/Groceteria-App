import 'package:flutter/material.dart';
import 'package:groceteria_app/Services/utils.dart';

import '../../Themes/theme.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.categoryColor,
    required this.categoryImage,
    required this.categoryName,
  });
  String categoryImage, categoryName;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final utils = UtilsPack(context);

    return Container(
      height: screenWidth * 0.5,
      width: screenWidth * 0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: utils.getTheme
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
            color: utils.getTheme
                ? categoryColor.withOpacity(0.4)
                : categoryColor.withOpacity(0.5),
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
            decoration: BoxDecoration(
                // color: Colors.black,
                image: DecorationImage(
                    image: AssetImage(categoryImage), fit: BoxFit.cover)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            height: screenWidth * 0.1,
            width: screenWidth * 0.5,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: utils.getTheme ? bgLightBlack : categoryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Text(
              categoryName,
              style: const TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
