import 'package:agrotrustapp/profile.dart';
import 'package:agrotrustapp/search.dart';
import 'package:flutter/material.dart';
//import 'screens/splash.dart';
//import 'screens/login.dart';
//import 'screens/home_screen.dart';
//import 'screens/product.dart';
//import 'screens/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Define custom colors
  static const Color primaryColor = Color(0xFF4CAF50); // Green color
  static const Color accentColor = Color(0xFFFF9800); // Orange color

  // Define routes for each screen
  final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    //'/login': (BuildContext context) => const LoginScreen(),
    //'/home': (BuildContext context) => const HomeScreen(),
    '/search': (BuildContext context) => const SearchScreen(),
    //'/product': (BuildContext context) => const ProductScreen(),
    '/profile': (BuildContext context) => ProfileScreen(),
    //'/cart': (BuildContext context) => const CartScreen(),
  };

   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agrotrust',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        hintColor: accentColor,
        appBarTheme: const AppBarTheme(
          color: primaryColor,
        ),
      ),
      //home: const SplashScreen(),
      routes: routes,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgroTrust'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: MyApp.primaryColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
              title: const Text('Search'),
              leading: const Icon(Icons.search),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/search');
              },
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/profile');
              },
            ),
            ListTile(
              title: const Text('Cart'),
              leading: const Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/cart');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to Agrichemical Marketplace!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: MyApp.primaryColor,
          ),
        ),
      ),
    );
  }
}
