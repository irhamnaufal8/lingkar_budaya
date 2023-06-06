import 'package:flutter/material.dart';

class BaseGradient {
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color.fromARGB(255, 229, 117, 83),
      Color.fromARGB(255, 200, 86, 52)
    ],
  );
}