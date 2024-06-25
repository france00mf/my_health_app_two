
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_health_app_two/core/utils/utils.dart';
import 'package:my_health_app_two/model/booking_model.dart';
import 'package:my_health_app_two/model/lab_model.dart';
import 'package:my_health_app_two/model/test_model.dart';
import 'package:my_health_app_two/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider  extends ChangeNotifier{
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;
  UserModel? _userModel;
  UserModel get userModel => _userModel!;
  List<BookingModel> _bookings = [];
  List<TestModel> _tests = [];
  List<LabModel> _labs = [];
  List<TestModel> get tests => _tests;
  List<LabModel> get labs => _labs;
  List<BookingModel> get bookings => _bookings;

  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;



  AuthProvider(){
    checkSign();
  }


  void checkSign() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isSignedIn = prefs.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  Future setSignIn() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("is_signedin", true);
    _isSignedIn = true;
    notifyListeners();
  }

  void signInWithPhone(BuildContext context, String phoneNumber)async{
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async{
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
        
        },
      verificationFailed: (error){
        throw Exception(error.message);
      },
      codeSent: (vericationId, forceResendingToken){
        Navigator.push(context, MaterialPageRoute(

           builder: (context) => OtpScreen(verificationId: verificationId),
        )){
          
        };
      },
      codeAutoRetrievalTimeout: (verificationId){}
      );

    } on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message.toString());
    }
  }

  void saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required File profilePic,
    required Function onSuccess,
  })
  async
  {
    _isLoading = true;
    notifyListeners();
    try {
        await storeFileToStorage("profilePic/$_uid", profilePic).then(
          (store){
            userModel.profilePic = store;
            userModel.createdAt = DateTime.now().millisecondsSinceEpoch.toString();
            userModel.phoneNumber = _firebaseAuth.currentUser!.phoneNumber!;
            userModel.uid = _firebaseAuth.currentUser!.phoneNumber!;
          }
        ); 
        _userModel= userModel;

        // Gravar os dados para o server (Firebase)
        await _firebaseAuth.collection("users").doc(_uid).set(userModel.toMap()).then(
          (users){
            onSuccess();
            _isLoading=false;
            notifyListeners();
          }
        );


    } on FirebaseAuthException catch (e) {
        showSnackBar(context, e.message.toString());
        _isLoading= false;
        notifyListeners();
    }
  }

  Future<String> storeFileToStorage(String ref, File file)async{
    UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future getDataFromSp() async{
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? '';
    _userModel = UserModel.fromMap(jsonDecode(data));
    _uid = _userModel!.uid;
    notifyListeners();
  }
}
