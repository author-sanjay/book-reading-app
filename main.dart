// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padhaku_reader/auth/register.dart';
import 'package:padhaku_reader/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:padhaku_reader/providers/book_provider.dart';
import 'package:padhaku_reader/providers/bookprovider.dart';
import 'package:padhaku_reader/providers/user_provider.dart';
import 'package:padhaku_reader/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookProvider>(
          create: (context) => BookProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<BookProviderM>(
          create: (context) => BookProviderM(),
        ),
        
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
        "/": (context) => SignUp(),
        "/HomePage": (context) => Home(),
        "/SignIn": (context) => SignIn(),
      }),
    );
  }
}
