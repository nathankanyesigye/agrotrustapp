 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for favorite items
    final List<Map<String, String>> favoriteItems = [
      {'name': 'vico', 'image': 'assets/agrochemical.jpg', 'rating': '4.5', 'distance': '1.0km'},
      {'name': 'wamala', 'image': 'assets/agrochemical.jpg', 'rating': '4.2', 'distance': '2.1km'},
      {'name': 'derrick', 'image': 'assets/agrochemical.jpg', 'rating': '4.8', 'distance': '0.5km'},
      // Add more favorite items as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.deepPurple, // App bar color
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
              if (kDebugMode) {
                print('Search button pressed');
              }
              // You can also use a SearchDelegate or navigate to a search screen
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: favoriteItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = favoriteItems[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(15), // Rounded corners for image
                child: Image.asset(
                  item['image']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                item['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Rating: ${item['rating']}',
                    style: TextStyle(color: Colors.grey[700]), // Text color
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Distance: ${item['distance']}',
                    style: TextStyle(color: Colors.grey[600]), // Text color
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                    onPressed: () {
                      if (kDebugMode) {
                        print('Remove ${item['name']} from favorites');
                      }
                      // Implement remove item from favorites logic
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.info, color: Colors.blue),
                    onPressed: () {
                      if (kDebugMode) {
                        print('More details about ${item['name']}');
                      }
                      Navigator.pushNamed(context, '/details', arguments: item);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
