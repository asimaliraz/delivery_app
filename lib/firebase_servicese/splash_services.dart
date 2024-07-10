import 'dart:async';
import 'package:Delivery_App/fastfood/home_screen.dart';
import 'package:Delivery_App/ui/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices{
  void isLogin(BuildContext context){

    final auth = FirebaseAuth.instance;

    final User = auth.currentUser;

    if(User !=null){
       Timer(const Duration(seconds: 3), () { 
   Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
  });
    }else{
       Timer(const Duration(seconds: 3), () { 
   Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
  });
    }
 
  }
}