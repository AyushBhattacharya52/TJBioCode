
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tjbioinformatic/StartPages/login.dart';
import 'package:tjbioinformatic/StartPages/signup.dart';
import 'package:tjbioinformatic/auth/authgate.dart';





void main() async{
await Supabase.initialize(
    anonKey:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF3aHdudGZwZW91eGJ2eWx5eHhiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAxMTA0NjksImV4cCI6MjA1NTY4NjQ2OX0.w6xpBb5gUyKnC-Tiu8asF7us6FRrqQtS5vaULOhT-8Y' , 
    url: 'https://awhwntfpeouxbvylyxxb.supabase.co' , 

  );
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Debugging loop

    // Return a widget
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AuthGate(),
      routes: {
        '/login': (context) => Login(),
        
        "/signup": (context) => Signup(),
      },
    );
  }
}
