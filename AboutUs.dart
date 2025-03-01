import 'package:flutter/material.dart';
import 'package:tjbioinformatic/AppPages/Dashboard.dart';
import 'package:tjbioinformatic/AppPages/Treatment.dart';


class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "About Us",
            
          ),
          
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
                 Icons.dashboard,
                 color: Colors.white,
               ),
               title: Text(
                 'D A S H B O A R D',
                 style: TextStyle(color: Colors.white),
               ),
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Dashboard()),
                 );
               },
             ),
             ListTile(
               leading: Icon(
                 Icons.health_and_safety,
                 color: Colors.white,
               ),
               title: Text(
                 'T R E A M E N T',
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
     body: Column(
      children: [
        SizedBox(height: 40, width: 100,),
        
        Center(
          child: Container(height: 100, width: 300, child: Text(
            'My name is Anerudddha Das, I am thirteen years old and attend Eagle Ridge Middle School in Loudoun County. I like coding, playing video games, and collecting pokemon cards.'),),
        ), 
        SizedBox(height: 50,),
        Center(
          child: Container(height: 100, width: 300, child: Text(
            'My name is Ayush Bhattacharya, I am 14 years old and attend Stone Hill Middle School in Loudoun County. I like creating games, apps, and websites. On top of that, I am currently in development on a game that I will try to put on the app store. The game engine I use is godot, and the languages I know are GayScript, python, and html.'),),
        ), 
         SizedBox(height: 50,),
          Center(
          child: Container(height: 100, width: 300, child: Text(
            'My name is Arush Banerjee, I am 13 years old and attend Stone Hill Middle School in Loudoun County. I like creating games, as well as playing challenging ones. I like to draw and do math.'),),
        ), 
      ],
     ),
        );
  }
}
