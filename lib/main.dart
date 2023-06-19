import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reflection/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Магазин на диване",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Search(),
              Container(
                margin: EdgeInsets.only(top: 110.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Categories(),
              ),
            ],
          ),
          Promotions(),
          Products()
        ],
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 30.0, bottom: 50.0),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusColor: Colors.black,
            hintText: "Найдите вашу мебель",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            prefixIcon: Icon(
              Icons.search_sharp,
              color: Colors.black,
            ),
            suffixIcon: Icon(
              Icons.camera_alt,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;

  const Header({Key? key, required String this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          this.title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Посмотреть всё",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        )
      ],
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: "Категории"),
        Row(
          children: [
            CategoryView(
              icon: "assets/sofa.png",
              text: "Диваны",
            ),
            CategoryView(
              icon: "assets/bed.png",
              text: "Кровати",
            ),
            CategoryView(
              icon: "assets/table.png",
              text: "Столы",
            ),
          ],
        ),
        Row(
          children: [
            CategoryView(
              icon: "assets/chair.png",
              text: "Стулья",
            ),
            CategoryView(
              icon: "assets/closet.png",
              text: "Шкафы",
            ),
            CategoryView(
              text: "И другое...",
            ),
          ],
        ),
      ],
    );
  }
}

class CategoryView extends StatelessWidget {
  final String? icon;
  final String text;

  const CategoryView({Key? key, String? this.icon, required String this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        children: [
          Container(
            width: 110,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
          Container(
            width: 110,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                this.icon != null
                    ? Image.asset(
                        this.icon as String,
                        scale: 30,
                      )
                    : Text(""),
                Text(
                  this.text,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Promotions extends StatefulWidget {
  const Promotions({Key? key}) : super(key: key);

  @override
  State<Promotions> createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_handlePageChange);
    _controller.dispose();
    super.dispose();
  }

  void _handlePageChange() {
    setState(() {
      _currentPage = _controller.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Theme.of(context).primaryColor),
            height: MediaQuery.of(context).size.height * 0.2,
            child: PageView(
              controller: _controller,
              children: const <Widget>[
                PromotionView(),
                PromotionView(),
                PromotionView(),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              3,
              (int index) {
                return Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentPage == index ? Color(0xFFDE7006) : Colors.grey,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Dots extends StatelessWidget {
  final List<Color> colors;
  final int dots;

  const Dots(
      {Key? key, required List<Color> this.colors, required int this.dots})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        dots,
        (int index) {
          return Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[index],
            ),
          );
        },
      ),
    );
  }
}

class PromotionView extends StatelessWidget {
  const PromotionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Внимание на диван",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            "Скидка до 30% на выбранные диваны только в течение ограниченного времени",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextButton(
            onPressed: () => print(1),
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.zero)),
            child: Row(
              children: [
                Text(
                  "Узнать больше",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Icon(
                  Icons.arrow_forward_sharp,
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(title: "Новая мебель"),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductView(
                  image: "assets/chair_one.png",
                  price: 400,
                  dotsColors: [
                    Color(0xFFD4B6BB),
                    Color(0xFFE6E6E6),
                    Color(0xFF959595)
                  ],
                  dotsQuantity: 3,
                ),
                ProductView(
                  image: "assets/chair_second.png",
                  price: 300,
                  dotsColors: [
                    Color(0xFFEDA88E),
                    Color(0xFFE6E6E6),
                  ],
                  dotsQuantity: 2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  final List<Color> dotsColors;
  final int dotsQuantity;
  final String image;
  final int price;

  const ProductView(
      {Key? key,
      required this.image,
      required this.price,
      required this.dotsColors,
      required this.dotsQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 15,
                  child: Dots(
                    colors: dotsColors,
                    dots: dotsQuantity,
                  ),
                ),
                Image.asset(image),
                Positioned(
                  bottom: 10,
                  left: 10,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$$price",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              EvaIcons.heart,
                              color: Colors.grey,
                            ),
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.grey[800],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
