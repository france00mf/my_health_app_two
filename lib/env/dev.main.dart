

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_health_app_two/presenters/view/welcome/welcome_screen.dart';
import 'package:my_health_app_two/providers/auth_provider.dart';
import 'package:my_health_app_two/providers/cart_provider.dart';
import 'package:provider/provider.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized(
    
  );
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyBgJWK28boXrIxEQgF16H4LyA0yzfUtilY',
    appId: '1:910506037178:android:7cda3121a1529d32bdd783',
    messagingSenderId: '910506037178',
    projectId: 'my-health-app-ao-two',
    storageBucket: 'my-health-app-ao-two.appspot.com',
      )
    )
  ;
}

class MyWidget extends StatelessWidget {
   MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthProvider()),
        ChangeNotifierProvider(create: (_)=> CartProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Health AO SYS',
        home: WelcomeScreen(),
        theme: ThemeData(
          primaryColor: Color(0xFF3E69FE),
          textTheme: GoogleFonts.openSansTextTheme(),
          appBarTheme: AppBarTheme(color: Color(0xFF3E69FE))
        ),
      ));
  }
}