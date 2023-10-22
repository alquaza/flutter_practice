import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/main_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const MainScreen(),
    ),
  );
}
