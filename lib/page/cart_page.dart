import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_flutter/models/food.dart';

import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void deleteFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();

    shop.removeCart(food);
    print(shop);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 125, 19, 9),
        appBar: AppBar(
          title: const Text(
            "My Cart",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 125, 19, 9),
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 255, 252, 252),
          ),
        ),
        body: Column(
          children: [
            //  customer cart
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  // get food from cart
                  final Food food = value.cart[index];
                  //get food name
                  final String foodName = food.name;
                  // get food price
                  final String foodPrice = food.price;
                  //return list tile
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 20,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          deleteFromCart(food, context);
                          print(food);
                          print(context);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            // pay button
            Padding(
              padding: const EdgeInsets.all(25),
              child: SizedBox(
                height: 70,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Pay now",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
