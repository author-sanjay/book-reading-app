// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class PDFApi{
//   static Future<File> loadNetwork(String url) async{
//     final response= await http.get(url);
//     final bytes=response.bodyBytes;

//     return _storeFile(url,bytes);
//   }

//   static Future<File> _storeFile(String url, List<int> bytes{
//     final filename = basename(url);
//     final dir = await getApplicationDocumentsDirectory();
  
  
//   }
// }