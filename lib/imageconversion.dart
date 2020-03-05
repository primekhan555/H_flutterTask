import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';

class Utility {
 
  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }
 
  static String base64String(Uint8List data) {
    return base64Encode(data);// convert image into String 
  }
}
