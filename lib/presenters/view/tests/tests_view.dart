import 'package:flutter/material.dart';
import 'package:my_health_app_two/model/test_model.dart';

class TestsViewDetails extends StatefulWidget {
  final TestModel test;
  const TestsViewDetails({super.key, required this.test});

  @override
  State<TestsViewDetails> createState() => _TestsViewDetailsState();
}

class _TestsViewDetailsState extends State<TestsViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}