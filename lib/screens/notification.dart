
import 'package:flutter/material.dart';
import 'package:food_ape_3/utils/constants.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationItem> _notifications = [
    NotificationItem(
      title: 'New order',
      message: 'You have a new order from John Doe',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Order delivered',
      message: 'Your order from Pizza Hut has been delivered',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'New restaurant added',
      message: 'A new restaurant "Burger King" has been added',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'New order',
      message: 'You have a new order from John Doe',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Order delivered',
      message: 'Your order from Pizza Hut has been delivered',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'New order',
      message: 'You have a new order from John Doe',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Order delivered',
      message: 'Your order from Pizza Hut has been delivered',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'New restaurant added',
      message: 'A new restaurant "Burger King" has been added',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'New order',
      message: 'You have a new order from John Doe',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Order delivered',
      message: 'Your order from Pizza Hut has been delivered',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'New order',
      message: 'You have a new order from John Doe',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Order delivered',
      message: 'Your order from Pizza Hut has been delivered',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'New restaurant added',
      message: 'A new restaurant "Burger King" has been added',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'New order',
      message: 'You have a new order from John Doe',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Order delivered',
      message: 'Your order from Pizza Hut has been delivered',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'New order',
      message: 'You have a new order from John Doe',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Order delivered',
      message: 'Your order from Pizza Hut has been delivered',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'New restaurant added',
      message: 'A new restaurant "Burger King" has been added',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'New order',
      message: 'You have a new order from John Doe',
      time: DateTime.now(),
    ),
    NotificationItem(
      title: 'Order delivered',
      message: 'Your order from Pizza Hut has been delivered',
      time: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.orange,
        shadowColor: Colors.transparent,
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_notifications[index].title),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_notifications[index].message),
            ),
            trailing: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_notifications[index].time.toString()),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationDetailsPage(
                    notification: _notifications[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final DateTime time;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
  });
}

class NotificationDetailsPage extends StatelessWidget {
  final NotificationItem notification;

  NotificationDetailsPage({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notification.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.message,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Time: ${notification.time.toString()}',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
