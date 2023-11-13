// import 'package:flutter/material.dart';
// import 'package:food_ape_3/utils/foodCard.dart';

// class Cart {
//   List<CartItem> items = [];

//   void addToCart(CartItem item) {
//     items.add(item);
//   }

//   void removeFromCart(CartItem item) {
//     items.remove(item);
//   }

//   double getTotalPrice() {
//     return items.fold(0.0, (sum, item) => sum + double.parse(item.price));
//   }
// }

// class CartScreen extends StatelessWidget {
//   final Cart cart;

//   CartScreen({required this.cart});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: cart.items.length,
//         itemBuilder: (context, index) {
//           final item = cart.items[index];
//           return ListTile(
//             leading: Image.asset(item.image, width: 50, height: 50),
//             title: Text(item.name),
//             subtitle: Text('\$${item.price}'),
//             trailing: IconButton(
//               icon: Icon(Icons.remove_circle),
//               onPressed: () {
//                 cart.removeFromCart(item);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Item removed from the cart'),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             'Total: \$${cart.getTotalPrice()}',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }
