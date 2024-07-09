import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/sherman.jpg'), // Replace with actual image path
            ),
            SizedBox(height: 20),
            Text(
              'WAMALA ABDUL', // Replace with actual user name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'wamala@gmail.com', // Replace with actual email
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement edit profile functionality
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implement sign out functionality
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
