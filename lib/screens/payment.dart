import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final double totalPrice;

  PaymentScreen({required this.totalPrice});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentOption = 'Credit Card';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Total Amount: \$${widget.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 50),
            Text(
              'Payment Options',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: <Widget>[
                // Use RadioListTile for each payment option
                RadioListTile(
                  fillColor: MaterialStateProperty.all(Colors.orange),
                  title: Text('Credit Card'),
                  value: 'Credit Card',
                  groupValue: selectedPaymentOption,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentOption = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  fillColor: MaterialStateProperty.all(Colors.orange),
                  title: Row(
                    children: [
                      // Text('UPI'),SizedBox(width: 10),
                      Image.asset(
                        'assets/logo/UPI-Logo.png',
                        width: 90,
                        height: 50,
                      ),
                    ],
                  ),
                  value: 'UPI',
                  groupValue: selectedPaymentOption,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentOption = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  fillColor: MaterialStateProperty.all(Colors.orange),
                  title: Row(
                    children: [
                      // Text('Paytm'),SizedBox(width: 10),
                      Image.asset(
                        'assets/logo/paytm.svg',
                        width: 90,
                        height: 50,
                      ),
                    ],
                  ),
                  value: 'Paytm',
                  groupValue: selectedPaymentOption,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentOption = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  fillColor: MaterialStateProperty.all(Colors.orange),
                  title: Row(
                    children: [
                      // Text('PhonePe'),SizedBox(width: 10),
                      Image.asset(
                        'assets/logo/PhonePe_Logo.png',
                        width: 90,
                        height: 50,
                      ),
                    ],
                  ),
                  value: 'PhonePe',
                  groupValue: selectedPaymentOption,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentOption = value.toString();
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    // Simulate the payment process
                    _simulatePayment(context);
                  },
                  child: Text('Make Payment'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _simulatePayment(BuildContext context) {
    // In a real app, you would integrate a payment gateway here
    // For simulation purposes, just show a success message
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Text('Thank you for your order!'),
          actions: [
            TextButton(
              onPressed: () {
                // Navigate back to the home screen or any desired screen
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        );
      },
    );
  }
}
