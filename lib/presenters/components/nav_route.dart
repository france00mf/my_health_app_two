

import 'package:flutter/material.dart';
import 'package:my_health_app_two/presenters/view/main_nav/all_book/all_bookin_view.dart';
import 'package:my_health_app_two/presenters/view/main_nav/home/home_view.dart';
import 'package:my_health_app_two/presenters/view/main_nav/profile/profile_view.dart';
import 'package:my_health_app_two/presenters/view/main_nav/special_offers/special_offers_view.dart';

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
    return const Placeholder();
  }
}

