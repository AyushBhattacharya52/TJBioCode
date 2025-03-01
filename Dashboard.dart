
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tjbioinformatic/AppPages/AboutUs.dart';

import 'package:tjbioinformatic/AppPages/Treatment.dart';


import '../auth/auth_service.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

 @override
 State<Dashboard> createState() => _DashboardState();
 }

final authService = AuthService();
void logout() async {
 await authService.signOut();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {


   return Scaffold(
     backgroundColor: const Color.fromARGB(255, 255, 255, 255),
     appBar: AppBar(
       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
       title: Text('Dashboard'),
       actions: [
         IconButton(
             onPressed: logout,
             icon: const FaIcon(FontAwesomeIcons.signOutAlt))
       ],
     ),
     drawer: Container(
       decoration: BoxDecoration(
         gradient: LinearGradient(
           colors: [
             const Color.fromARGB(255, 102, 148, 128),
             const Color.fromARGB(255, 62, 126, 91),
             const Color.fromARGB(255, 69, 177, 125),
           ],
         ),
       ),
       child: Drawer( 
         backgroundColor: const Color.fromARGB(0, 87, 171, 143),
         child: Column(
           children: [
            
             SizedBox(
               height: 100,
             ),
             ListTile(
               leading: Icon(
                 Icons.person,
                 color: Colors.white,
               ),
               title: Text(
                 'A B O U T  U S',
                 style: TextStyle(color: Colors.white),
               ),
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => AboutUs()),
                 );
               },
             ),
           
           
             
             ListTile(
               leading: Icon(
                 Icons.health_and_safety,
                 color: Colors.white,
               ),
               title: Text(
                 'T R E A T M E N T',
                 style: TextStyle(color: Colors.white),
               ),
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => TablePage()),
                 );
               },
             ),
           ],
         ),
       ),
     ),

   );
 }
}


