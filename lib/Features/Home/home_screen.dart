import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:groceteria_app/Services/utils.dart';

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
  @override
  Widget build(BuildContext context) {
    final themeState = UtilsPack(context).getTheme;
    Size size = UtilsPack(context).screenSize;
    return Scaffold(
        body: SizedBox(
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
    ));
  }
}
