// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class LocationPage extends StatelessWidget {
//   final LatLng initialLocation;
//   final LatLng dataLocation;

//   LocationPage({required this.initialLocation, required this.dataLocation});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Delivery Location'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Your Current Location',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Latitude: ${initialLocation.latitude}',
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(
//               'Longitude: ${initialLocation.longitude}',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Delivery Location',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Latitude: ${dataLocation.latitude}',
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(
//               'Longitude: ${dataLocation.longitude}',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Open a navigation app with the destination location
//                 _openNavigationApp(dataLocation);
//               },
//               child: Text('Navigate to Location'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: FlutterMap(
//                 options: MapOptions(
//                   center: LatLng(initialLocation.latitude, initialLocation.longitude),
//                   zoom: 15.0,
//                 ),
//                 layers: [
//                   TileLayerOptions(
//                     urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                     subdomains: ['a', 'b', 'c'],
//                   ),
//                   MarkerLayerOptions(
//                     markers: [
//                       Marker(
//                         width: 30.0,
//                         height: 30.0,
//                         point: LatLng(initialLocation.latitude, initialLocation.longitude),
//                         builder: (ctx) => Container(
//                           decoration: BoxDecoration(
//                             color: Colors.blue,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                       ),
//                       Marker(
//                         width: 30.0,
//                         height: 30.0,
//                         point: LatLng(dataLocation.latitude, dataLocation.longitude),
//                         builder: (ctx) => Container(
//                           decoration: BoxDecoration(
//                             color: Colors.red,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _openNavigationApp(LatLng destinationLocation) {
//     // Implement navigation to the destination location using a navigation package
//     // For demonstration purposes, you can print a message
//     print('Opening navigation app to ${destinationLocation.latitude}, ${destinationLocation.longitude}');
//   }
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: LocationPage(
//         initialLocation: LatLng(37.7749, -122.4194), // Replace with the actual initial location
//         dataLocation: LatLng(37.7749, -122.4194), // Replace with the actual data location
//       ),
//     ),
//   );
// }
