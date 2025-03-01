

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tjbioinformatic/AppPages/Dashboard.dart';
import 'package:tjbioinformatic/StartPages/login.dart';



class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      
      // Listen to auth changes
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator while waiting for auth state
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Access session data from snapshot
        final session = snapshot.hasData? snapshot.data!.session:null;

        // Redirect based on auth state
        if (session != null) {
          return Dashboard(); // Authenticated
        } else {
          return Login(); // Unauthenticated
        }
      },
    );
  }
}
