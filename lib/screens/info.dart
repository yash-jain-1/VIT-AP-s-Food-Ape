
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class DeveloperInfoPage extends StatelessWidget {
  final String developerName;
  final String developerBio;
  final String appDescription;

  DeveloperInfoPage({
    required this.developerName,
    required this.developerBio,
    required this.appDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Info'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/developer.jpg'),
          ),
          SizedBox(height: 10),
            Text(
              'Developer Name:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              developerName,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Developer Bio:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              developerBio,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'App Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              appDescription,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5)),
                ],
              ),
              alignment: Alignment.center,
              height: 500,
              width: 500,
              child: RiveAnimation.asset(
                'assets/rive/5051-10195-im-scared-of-mouse-hovers.riv',
                fit: BoxFit.cover,
              )),

          ],
        ),
      ),
    );
  }
}
