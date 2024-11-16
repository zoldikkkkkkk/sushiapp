import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_projectonthismac/components/button.dart';
import 'package:my_first_projectonthismac/models/food.dart';
import 'package:my_first_projectonthismac/models/shop.dart';
import 'package:my_first_projectonthismac/theme/colors.dart';
import 'package:provider/provider.dart';

class FoodDetailspage extends StatefulWidget {
  final Food food;
  const FoodDetailspage({super.key, required this.food});

  @override
  State<FoodDetailspage> createState() => _FoodDetailspageState();
}

class _FoodDetailspageState extends State<FoodDetailspage> {
  int quantityCount = 0;

  void descrementQuantity() {
    // setState(() {
    if (quantityCount > 0) {
      quantityCount = quantityCount - 1;
    }
    // });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount = quantityCount + 1;
    });
  }

//add to cart
  void addToCart(String title) {
    //only add to cart if there is something in the cart
    if (quantityCount > 0) {
      // get access to shop
      final shop = context.read<Shop>();

      //add to cart
      shop.addToCart(widget.food, quantityCount);

      //let the user know it was succesfull
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Succesfully added to cart $title"),
          actions: [
            IconButton(
              onPressed: () {
                //pop once to remove dialog box
                Navigator.pop(context);

                //pop again to go previous screen
              },
              icon: const Icon(Icons.done),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                        color: Colors.yellow[800],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Delicately sliced, fresh Atlantic salmon drapes elegamtly over a pollow of perfectly seasoned sushi rice. Its vibrant hue and buttery texture promise an exquisite melt-in-your-mouth experience. Paired with a whisper of wasabi and a side of traditional pickled ginger, our salmon sushi is an ode to the purity and simplicity of authentic Japanese flavors. Indulge in the oceans bounty with each savory bite',
                    style: TextStyle(
                        color: Colors.grey[600], fontSize: 14, height: 2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.food.price}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: IconButton(
                              onPressed: descrementQuantity,
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantityCount.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: IconButton(
                              onPressed: incrementQuantity,
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    text: 'Add To Card',
                    onTap: () {
                      addToCart('salmon sushi');
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
