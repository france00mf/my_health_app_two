import 'package:flutter/material.dart';
import 'package:my_health_app_two/presenters/components/custom_button.dart';
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
          child: Padding(padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35,
          ),
          child: Column(
            children: [
                Image.asset(
                  "assets/images/doctors.png",
                  height: 300,
                ),

                const Text(
                  "Bora começar?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                   const SizedBox(height: 10),
                const Text(
                  "Comece Agora, e verás magia",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: () async{
                      if (app.isSignedIn == true) {
                        await app.getDataFromSp().whenComplete(
                          ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const NavBar()))
                        );
                      }else{
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      }
                    },
                    text: "Começar",
                  ),
                )

            ],
          ),
          ),
        ),
      ),
    );
  }
  
}