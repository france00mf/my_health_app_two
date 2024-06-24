import 'dart:io';

import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content)),
  );
}


Future<File?> pickImage(BuildContext context)async{
  try {
    
  } catch (e) {
    
  }
}