import 'package:flutter/material.dart';
import 'package:groceteria_app/Features/Category/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

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
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 160 / 179,
        crossAxisSpacing: 20, //vertical spacing
        mainAxisSpacing: 20, //horizontal spacing
        padding: const EdgeInsets.all(10),
        children: List.generate(6, (index) {
          return CategoryWidget(
            categoryName: catInfo[index]['catName'],
            categoryImage: catInfo[index]['imgPath'],
            categoryColor: gridColors[index],
          );
        }),
      ),
    );
  }
}
