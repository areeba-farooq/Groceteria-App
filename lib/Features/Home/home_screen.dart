import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:groceteria_app/Services/utils.dart';

import '../../Common/on_sale_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> coverImages = [
    'assets/covers/cover1.jpg',
    'assets/covers/cover2.jpg',
    'assets/covers/cover3.jpg',
    'assets/covers/cover4.jpg',
  ];
  List<Color> gridColors = [
    const Color(0xffF7A593), //fruits
    const Color(0xff53B175), //veges
    const Color(0xffF8A44C), //nuts
    const Color(0xffD3B0E0), //herbs
    const Color(0xffFDE598), //spices
    const Color(0xffB7DFF5), //grains
  ];
  List<Map<String, dynamic>> catInfo = [
    {
      //Fruits
      'imgPath': 'assets/category/fruits.png',
      'catName': 'Fruits'
    },
    {
      //Vagetables
      'imgPath': 'assets/category/vegetables.png',
      'catName': 'Vegetables'
    },
    {
      //Nuts
      'imgPath': 'assets/category/nuts.png',
      'catName': 'Nuts'
    },
    {
      //Herbs
      'imgPath': 'assets/category/herbs.png',
      'catName': 'Herbs'
    },
    {
      //Spices
      'imgPath': 'assets/category/spices.png',
      'catName': 'Spices'
    },
    {
      //Grains
      'imgPath': 'assets/category/grains.png',
      'catName': 'Grains'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeState = UtilsPack(context).getTheme;
    Size size = UtilsPack(context).screenSize;
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: size.height * 0.33,
          child: Swiper(
            itemBuilder: (context, index) {
              return Image.asset(
                coverImages[index],
                fit: BoxFit.cover,
              );
            },
            autoplay: true,
            itemCount: coverImages.length,
            pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.amber,
                )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'SALE PRODUCTS',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'more',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ))
          ],
        ),
        SizedBox(
          height: size.height * 0.31,
          child: ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return OnSaleProducts(
                  categoryName: catInfo[index]['catName'],
                  categoryImage: catInfo[index]['imgPath'],
                  categoryColor: gridColors[index],
                );
              }),
        ),
      ],
    ));
  }
}
