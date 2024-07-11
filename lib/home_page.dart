 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Marker> markers = [];

  void _handleShopAction(BuildContext context, int index) {
    if (kDebugMode) {
      print('Shop button pressed for index $index');
    }
    Navigator.pushNamed(context, '/shop');
  }

  void _handleSendMessage(BuildContext context, int index) {
    if (kDebugMode) {
      print('Send message button pressed for index $index');
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Send Message'),
          content: const Text('Implement your message sending logic here.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _handleSearch() {
    if (kDebugMode) {
      print('Search button pressed');
    }
    Navigator.pushNamed(context, '/search');
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        if (kDebugMode) {
          print('Navigate to Favorites');
        }
        Navigator.pushNamed(context, '/favorites');
        break;
      case 2:
        if (kDebugMode) {
          print('Navigate to Profile');
        }
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _handleSearch,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/help');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(0, 0), // Provide an initial location
                zoom: 10, // Set the zoom level
              ),
              markers: Set<Marker>.of(markers),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: markers.length,
              itemBuilder: (BuildContext context, int index) {
                String assetPath = 'assets/agrochemical.jpg';
                Color vegetationColor = Colors.green.shade200;

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(assetPath),
                      backgroundColor: vegetationColor,
                      radius: 30,
                    ),
                    title: const Text(
                      'Seller Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Seller address'),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 5),
                            Text('Rating: 4.6'),
                            SizedBox(width: 10),
                            Icon(Icons.location_on, color: Colors.blue),
                            SizedBox(width: 5),
                            Text('Distance: 1.2km'),
                          ],
                        ),
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 5,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            _handleShopAction(context, index);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text('Shop House'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _handleSendMessage(context, index);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text('Send Message'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          _navigateToPage(index);
        },
      ),
    );
  }
}
