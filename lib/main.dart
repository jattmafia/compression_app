import 'package:compressionapp/screens/auth/login_screen/screen/loginscreen.dart';
import 'package:compressionapp/screens/auth/signup_screen/screen/signupscreen.dart';
import 'package:compressionapp/screens/bottomnavbar/screen/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  token = pref.getString('token');
  runApp(const MyApp());
}

var token;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:token == null ? LogInScreen() : BottomNavigationScreen(),
    );
  }
}
