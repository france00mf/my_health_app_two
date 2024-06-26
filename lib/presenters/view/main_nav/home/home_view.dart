import 'package:flutter/material.dart';
import 'package:my_health_app_two/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> services = [
    "Teste de Sange",
    "Teste de urina",
    "HFT",
    "LFT",
    "Neurologia",
    "Cardiologia",
  ];

    List<String> tests = [
    "Dengue",
    "HIV",
    "Typhoid",
    "Gravidez",
    "Xray",
    "Sangue",
  ];

    List<String> labs = [
    "lab1",
    "Lab2",
  ];

   List<String> packages_imagePaths = [
    'assets/images/influenza.jpg',
    'assets/images/irontest.jpg',
    'assets/images/fever.jpg',
    'assets/images/influenza.jpg',
    'assets/images/irontest.jpg',
    'assets/images/fever.jpg',
  ];

    List<String> tests_imagePaths = [
    'assets/images/doctor4.jpg',
    'assets/images/doctor2.jpg',
    'assets/images/doctor3.jpg',
    'assets/images/doctor4.jpg',
    'assets/images/doctor2.jpg',
    'assets/images/doctor3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.grey,
        title: Text('Diagonistico',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
        ),
        ),
      ),
    );
  }
}