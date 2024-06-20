import 'package:flutter/material.dart';
import 'package:my_health_app_two/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState(){
    return _WelcomeScreenState();
  }
}

class _WelcomeScreenState extends State<WelcomeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final app = Provider.of<AuthProvider>(context,listen: false);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35)),
        ),
      ),
    );
  }
  
}