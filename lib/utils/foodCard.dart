import 'package:flutter/material.dart';
import 'package:food_ape_3/main.dart';
import 'package:food_ape_3/screens/cart.dart';

class CartItem {
  final String name;
  final String price;
  final String image; 

  CartItem({required this.name, required this.price, required this.image});
}


class FoodCard extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String image;
  final String shop;
  final Cart cart;

  FoodCard({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.shop,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black.withOpacity(0.1),
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text(shop, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          Image.asset(image, fit: BoxFit.cover),
          ListTile(
            title: Text(name),
            subtitle: Text(description),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  // customize the button
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  onPressed: () {
                    final cartItem = CartItem(
                      name: name,
                      price: price,
                      image: image,
                    );
                    cart.addToCart(cartItem);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Item added to the cart'),
                        action: SnackBarAction(
                          label: 'View Cart',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(cart: cart),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
