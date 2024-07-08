import 'package:flutter/material.dart';
import 'package:my_health_app_two/model/lab_model.dart';
import 'package:my_health_app_two/providers/auth_provider.dart';

class LabDetailsView extends StatefulWidget{
  final LabModel lab;
  final AuthProvider authProvider;

  LabDetailsView({required this.lab, required this.authProvider});
  @override 
  State<LabDetailsView> createState()=> _LabDetailsView();  
}

class _LabDetailsView extends State<LabDetailsView>{
  @override
  Widget build(BuildContext context){
    return Scaffold();
  }
}