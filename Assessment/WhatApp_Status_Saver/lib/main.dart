import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/botton_nav_provider.dart';
import 'Provider/getStatusProvider.dart';
import 'Screen/splash_screen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => BottonNavProvider()),
      ChangeNotifierProvider(create: (_) => Getstatusprovider()),
    ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
