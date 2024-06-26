

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:my_health_app_two/presenters/view/cart/cart_view.dart';
import 'package:my_health_app_two/presenters/view/main_nav/all_book/all_bookin_view.dart';
import 'package:my_health_app_two/presenters/view/main_nav/home/home_view.dart';
import 'package:my_health_app_two/presenters/view/main_nav/profile/profile_view.dart';
import 'package:my_health_app_two/presenters/view/main_nav/special_offers/special_offers_view.dart';
import 'package:my_health_app_two/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
    int selectedIndex = 0;


  final screens = const [
    HomeView(),
    AllBookingsView(),
    SpecialOffersView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF3E69FE),
        unselectedItemColor: Colors.black54,
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
        
        BottomNavigationBarItem(icon: Icon(Icons.home_filled),
        label: "Home"
        )],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => CartView(cartProvider: cartProvider),));
      },
       child: Icon(Icons.shopping_cart),
        backgroundColor: Color(0xFF3E69FE)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

