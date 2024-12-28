import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:happy_petshop/pages/welcome_page.dart';
import 'package:happy_petshop/pages/register_page.dart';
import 'package:happy_petshop/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:happy_petshop/providers/product_provider.dart';
import 'package:happy_petshop/providers/cart_provider.dart';
import 'pages/login_page.dart';
import 'pages/admin/product_page.dart';
import 'pages/admin/admin_home_page.dart';
import 'pages/admin/customer_page.dart';
import 'pages/user/user_home_page.dart';
import 'pages/user/cart_page.dart';
import 'pages/user/profile_page.dart';
import 'pages/user/checkout_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Aktifkan Device Preview
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => AuthProvider()), // Tambahkan AuthProvider
          ChangeNotifierProvider(
              create: (_) => ProductProvider()), // Tambahkan ProductProvider
          ChangeNotifierProvider(
              create: (_) => CartProvider()), // Tambahkan CartProvider
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Petshop',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/welcome', // Set initial route to WelcomePage
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/admin_home': (context) => const AdminHomePage(),
        '/product_management': (context) => const ProductPage(),
        '/customer_management': (context) => const CustomerPage(),
        '/user_home': (context) => const UserHomePage(),
        '/cart': (context) => const CartPage(),
        '/profile': (context) => const ProfilePage(),
        '/checkout': (context) => const CheckoutPage(),
      },
      home: const WelcomePage(),
    );
  }
}
