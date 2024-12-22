import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:module_6_assignment/services/auth/auth_gate.dart';
import 'package:module_6_assignment/themes/light_mode.dart';
import 'package:module_6_assignment/themes/theme_provider.dart';
import 'package:provider/provider.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized(); // Ensure widgets are initialized
  await Firebase.initializeApp();           // Initialize Firebase
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(),
    child: MyApp(),)
  );                          // Run the app
}

class MyApp extends StatefulWidget
{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
