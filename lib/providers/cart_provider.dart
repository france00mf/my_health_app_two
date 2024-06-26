import 'dart:core';

import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier{
  double _totalAmount = 0.0; 

 double getTotalAmount(){
  return _totalAmount;
 }
}