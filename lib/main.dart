

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_health_app_two/providers/auth_provider.dart';
import 'package:my_health_app_two/providers/cart_provider.dart';
import 'package:provider/provider.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized(
    
  );
  await Firebase.initializeApp(
      options: FirebaseOptions(apiKey: "", appId: "", messagingSenderId: "", projectId: "");
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
        ChangeNotifierProvider(create: (_)=> CartProvider,),
      ],
      child: Scaffold());
  }
}