import 'package:flutter/material.dart';
import 'package:true_vault/screens/choose_database_screen.dart';
import 'package:true_vault/screens/delete_database_screen.dart';
import 'package:true_vault/screens/main_screen.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: const MainScreen(),
  routes: {
    'main_screen': (context) => const MainScreen(),
    'choose_database': (context) => const ChooseDatabase(),
    'delete_database': (context) => const DeleteDatabase(),
  },
));