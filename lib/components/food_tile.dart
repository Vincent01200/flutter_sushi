import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_flutter/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        margin: const EdgeInsets.only(left: 10, bottom: 70),
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image asset

            Image.asset(
              food.imagePath,
              height: 140,
            ),

            // text
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            //rating + price
            SizedBox(
              width: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$" + food.price,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                      ),
                      Text(
                        food.rating,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
