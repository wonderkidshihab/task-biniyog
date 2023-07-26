import 'package:flutter/material.dart';

Color getColorBasedOnGrade(String risk){
  switch (risk) {
    case 'A':
      return Colors.green;
    case 'B':
      return Colors.blue;
    case 'C':
      return Colors.yellow;
    case 'D':
      return Colors.orange;
    case 'E':
      return Colors.red;
    default:
      return Colors.black;
  }
}