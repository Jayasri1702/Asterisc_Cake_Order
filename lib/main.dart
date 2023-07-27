import 'package:flutter/material.dart';
import 'package:cake/checkout.dart';
import 'package:cake/detailsScreen.dart';
import 'package:cake/favourites.dart';
import 'package:cake/homescreen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.green[700],
      appBarTheme: AppBarTheme(
      color: Colors.green[700],
    ) ,
    elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
          )),
    ),

    debugShowCheckedModeBanner: false,
    routes: {
    //will be used to navigate to any page
      "/":((context) => const Home()),
      "/details":((context) => const Details()),
      "/favourites":(context) => const Favourites(),
      "/checkout":((context) => const Checkout())
    }
  ));
}