import 'package:e_seller_app/Auth/LoginView.dart';
import 'package:e_seller_app/Screen/HomeScreen.dart';
import 'package:e_seller_app/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var loginuser = false;
  cahngestate(){
    auth.authStateChanges().listen((User? user) { 
      if(user == null && mounted){
        loginuser = false;
      }
      else{
        loginuser = true;
      }


    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    cahngestate();
  }
 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: loginuser ? const HomeScreen() : const LoginView()
    );
  }
}

