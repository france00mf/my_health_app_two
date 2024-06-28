import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(

                    child: const Icon(
                      Icons.close_outlined,
                      size: 35,
                    ),
                    onTap: ()=> Navigator.pop(context),
                  )
              ],)
            ],
          ),
        ),
      )),
    );
  }
}