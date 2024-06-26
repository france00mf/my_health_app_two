import 'package:flutter/material.dart';
import 'package:my_health_app_two/providers/cart_provider.dart';

class CartView extends StatefulWidget {
  final CartProvider cartProvider;
  const CartView({super.key, required this.cartProvider});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    double totalAmount = widget.cartProvider.getTotalAmount();
    return Scaffold();
  }
}