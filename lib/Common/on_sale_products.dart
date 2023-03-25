import 'package:flutter/material.dart';
import 'package:groceteria_app/Common/price_tag.dart';

import 'package:groceteria_app/Services/utils.dart';

import '../Themes/theme.dart';

class OnSaleProducts extends StatefulWidget {
  OnSaleProducts({
    super.key,
    required this.categoryColor,
    required this.categoryImage,
    required this.categoryName,
  });
  String categoryImage, categoryName;
  final Color categoryColor;

  @override
  State<OnSaleProducts> createState() => _OnSaleProductsState();
}

class _OnSaleProductsState extends State<OnSaleProducts> {
  @override
  Widget build(BuildContext context) {
    final utils = UtilsPack(context);
    Size size = utils.screenSize;

    final themeState = utils.getTheme;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
          child: InkWell(
        child: Banner(
          message: 'SALE',
          location: BannerLocation.topStart,
          child: Container(
            alignment: Alignment.center,
            height: screenWidth / 1.8,
            width: screenWidth / 2.1,
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
                      ? widget.categoryColor.withOpacity(0.4)
                      : widget.categoryColor.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0, left: screenWidth / 2.8),
                  child: const Text(
                    '1KG',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Image.asset(
                    widget.categoryImage,
                    height: size.height * 0.15,
                    width: size.width * 0.3,
                  ),
                ),
                const PriceTag(),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: screenWidth * 0.1,
                  width: screenWidth * 0.5,
                  decoration: BoxDecoration(
                      color:
                          utils.getTheme ? bgLightBlack : widget.categoryColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.categoryName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.shopping_cart_outlined)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
