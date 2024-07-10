import 'package:Delivery_App/ui/splash_screen.dart';
import 'package:Delivery_App/utils/language.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

void main() async {
  await PersistentShoppingCart().init();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBgQ-CVCWXaSnYhVyBqdF78zXPereAeP8k",
        appId: "1:920089957067:android:9e07c789b703bc77ff414e",
        messagingSenderId: "",
        projectId: "dumy-608a0",
        storageBucket: 'dumy-608a0.appspot.com'),
  );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async{
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('en','US'),
      fallbackLocale: const Locale('en','US'),
      translations:Languages(),
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const SplasScreen(),
    );
  }
}

