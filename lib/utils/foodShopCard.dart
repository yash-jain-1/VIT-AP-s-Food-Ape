import 'package:flutter/material.dart';
class FoodShopCard extends StatelessWidget {
  final String shopName;
  final String image;
  final String menu;

  FoodShopCard({required this.shopName, required this.image , required this.menu});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // show an image in a dialogbox to show menu items
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Image.asset(menu),
            );
          },
        );
      },
      child: Container(
        width: 160, // Adjust the width as needed
        height: 180, // Adjust the height as needed
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          
                    elevation: 5,
                    color: Color.fromARGB(104, 255, 153, 0), // Add this line to set the background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.asset(
                            image,
                            width: 160,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _truncateShopName(shopName),
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            String _truncateShopName(String name) {
              const maxCharacters = 15; // Adjust as needed
              return name.length <= maxCharacters
                  ? name
                  : '${name.substring(0, maxCharacters)}...';
            }
          }
