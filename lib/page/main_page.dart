import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_flutter/components/food_tile.dart';
import 'package:sushi_flutter/models/shop.dart';
import 'package:sushi_flutter/page/food_detail.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // navigate to fooddetail
  void navigateToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (content) => FoodDetails(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          "Sashimi",
          style: TextStyle(color: Colors.grey[900]),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/cart");
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner

          Container(
            height: 125,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 111, 24, 18),
                borderRadius: BorderRadius.all(Radius.circular(24))),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "45% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Text("Reedem"),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "asset/image/sushi.png",
                  width: 50,
                  height: 60,
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          // search bar
          const Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  )),
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          // menu list

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Menu List",
              style: TextStyle(
                color: Colors.grey[850],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),

          const SizedBox(
            height: 24,
          ),

          // popular food

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            margin: const EdgeInsets.only(left: 24, right: 24, bottom: 25),
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "asset/image/fish.png",
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fish n chips",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "\$ 19.90",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.grey[700],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
