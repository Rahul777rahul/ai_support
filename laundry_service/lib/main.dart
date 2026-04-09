import 'package:flutter/material.dart';
import 'package:laundry_service/Screens/home.dart';
import 'package:provider/provider.dart';
import 'package:laundry_service/provider/cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ),
  );
}

