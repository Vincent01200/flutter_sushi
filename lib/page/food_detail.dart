import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_flutter/models/food.dart';
import 'package:sushi_flutter/models/shop.dart';

class FoodDetails extends StatefulWidget {
  final Food food;

  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantity = 0;

  void decrementQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void addToCart() {
    if (quantity > 0) {
      // get access shop
      final shop = context.read<Shop>();
      // add to list
      shop.addCart(widget.food, quantity);
      // dialog alert
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: const Text("Succes"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[800],
      ),
      body: Column(
        children: [
          // listview of food detail

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.food.rating,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Japanese dish that features medium-grained rice cooked in vinegar, served with raw or cooked seafood and a variety of toppings or fillings.",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // price + quantity + button add
          Container(
            color: const Color.fromARGB(255, 166, 70, 63),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$" + widget.food.price,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        // -
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 186, 190, 190),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),

                        // =
                        SizedBox(
                          width: 50,
                          child: Center(
                            child: Text(
                              quantity.toString(),
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        // +
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 186, 190, 190),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuantity,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: addToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 89, 71, 70),
                  ),
                  child: const SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Center(
                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
