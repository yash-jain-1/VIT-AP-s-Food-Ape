
import 'package:flutter/material.dart';

class FoodItem {
  final String name;
  final double price;

  FoodItem({required this.name, required this.price});
}

class FoodItemListPage extends StatelessWidget {
  final List<FoodItem> foodItems;
  final Cart cart;

  FoodItemListPage({required this.foodItems, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Items'),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (BuildContext context, int index) {
          FoodItem item = foodItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Price: \$${item.price}'),
            trailing: ElevatedButton(
              child: Text('Add to Cart'),
              onPressed: () {
                cart.addItem(CartItem(name: item.name, price: item.price));
              },
            ),
          );
        },
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});
}

class Cart {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    for (CartItem i in _items) {
      if (i.name == item.name) {
        i.quantity += item.quantity;
        return;
      }
    }
    _items.add(item);
  }

  void removeItem(CartItem item) {
    _items.remove(item);
  }

  double getTotalPrice() {
    double total = 0;
    for (CartItem item in _items) {
      total += item.price * item.quantity;
    }
    return total;
  }
}

class CartPage extends StatefulWidget {
  final Cart cart;

  CartPage({required this.cart});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cart.items.length,
        itemBuilder: (BuildContext context, int index) {
          CartItem item = widget.cart.items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Price: \$${item.price}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (item.quantity > 1) {
                        item.quantity--;
                      } else {
                        widget.cart.removeItem(item);
                      }
                    });
                  },
                ),
                Text(item.quantity.toString()),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      item.quantity++;
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: \$${widget.cart.getTotalPrice().toStringAsFixed(2)}'),
              ElevatedButton(
                child: Text('Checkout'),
                onPressed: () {
                  // TODO: Implement checkout functionality.
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
