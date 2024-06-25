import 'dart:js';

import 'package:flutter/material.dart';
import 'package:my_health_app_two/core/utils/utils.dart';
import 'package:my_health_app_two/presenters/components/custom_button.dart';
import 'package:my_health_app_two/presenters/components/nav_route.dart';
import 'package:my_health_app_two/presenters/components/recend_code_button.dart';
import 'package:my_health_app_two/providers/auth_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpView extends StatefulWidget {
  final String verificationId;
  const OtpView({super.key, required this.verificationId});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
      final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(child: isLoading == true ? const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ) :  SingleChildScrollView(
          child: Center(
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),child: 
            Column(
              children: [
                 Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),

                 Container(
                    width: 300,
                    height: 300,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/images/doctors.png",
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Verificar",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10,),

                   const Text(
                    "Insira o código recebido",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                    Pinput(
                    length: 6,
                    showCursor: true,
                    defaultPinTheme: PinTheme(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFF3E69FE),
                        ),
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      
                    ),
                    onCompleted: (complete){
                      setState(() {
                        otpCode = complete;
                      });
                    },
                    ),
                    const SizedBox(height: 25,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: CustomButton(text: "Verificar", onPressed: (){
                        if (otpCode != null){
                          print("verificando otp: ${otpCode}");
                          verifyOtp(context, otpCode!);
                        }else{
                          showSnackBar(context, "Digite o código com 6 caracter");
                        }
                      }),
                    ),

                     const SizedBox(height: 20),
                  const Text(
                    "Não recebeu o código?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                  ),   
                  RecendCodeButton(onPressed: (){}, text: "Reenviar código")            
              ],
            ), ),
          ),
        )),
    );
  }

void verifyOtp(){
  final authMethods= Provider.of<AuthProvider>(context, listen: false);

  authMethods.verifyOtp(
    context: context,
    verificationId: widget.verificationId,
    otpCodeUser: userOtp,
    onSucess: (){
      authMethods.checkExistingUser().then(
        (userExists) async{
          if(userExists == true) {
            authMethods.getDataFromFireStore().then(
              (userData)=> authMethods.saveUserDataToSp().then(
                (spDataFrom) => authMethods.setSignIn().then((SignValue) =>Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavBar(),
                        ),
                            (route) => false), )
              )
            );
          }
        }
      );
    }
  );
}
}

