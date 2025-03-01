import 'package:flutter/material.dart';
import 'package:tjbioinformatic/AppPages/AboutUs.dart';
import 'package:tjbioinformatic/AppPages/Dashboard.dart';

class TablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treatments'),
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
           ],
         ),
       ),
     ),
      body: SingleChildScrollView(  // Make the page scrollable in case it overflows
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
            border: TableBorder.all(color: Colors.black),
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Condition', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Recommendation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Hives', style: TextStyle(fontSize: 14)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Identify and avoid triggers', style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Acne', style: TextStyle(fontSize: 14)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Wash face with gentle cleanser', style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Measles', style: TextStyle(fontSize: 14)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Rest and stay hydrated, use fever reducers', style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
