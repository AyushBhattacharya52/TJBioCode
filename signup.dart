

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tjbioinformatic/auth/auth_service.dart';



class Signup extends StatefulWidget {
 const Signup({super.key});


 @override
 State<Signup> createState() => _SignupState();
}


class _SignupState extends State<Signup> {
  bool _isSecuredPassword = true;
  final authService = AuthService();


final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();
void signUp() async{
 final email = _emailController.text;
 final password = _passwordController.text;
 final confirmPassword = _confirmPasswordController.text;


 if(password != confirmPassword) {
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Passwords do not macth')));
   return;
 }
 try{
  showDialog(context: context, builder: (context){return Center(child: CircularProgressIndicator(color: Colors.black,));});
   await authService.signUpWithEmailPassword(email, password);
   Navigator.pop(context);


 }catch(e){
   if(mounted){
         ScaffoldMessenger.of(context)
         .showSnackBar(SnackBar(content:Text('Error:$e')));


    }
 }
 Navigator.of(context).pop();
}




@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    appBar: AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/login');
        },
        icon: Icon(FontAwesomeIcons.arrowLeft),
      ),
    ),
    body: Center(
      child: Column(
        children: [
          Container(
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              child: Text('Create your account'),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
             controller: _emailController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black),
                icon: Icon(FontAwesomeIcons.envelope),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
             controller: _passwordController,
             obscureText: _isSecuredPassword,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black),
                icon: Icon(FontAwesomeIcons.lock),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                suffix: togglePassword()
              ),
            
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
             cursorHeight: 30,
             obscureText: _isSecuredPassword,
             controller: _confirmPasswordController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(color: Colors.black),
                icon: Icon(FontAwesomeIcons.check),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                suffix: togglePassword()
              ),


              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
              onPressed: signUp,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  minimumSize: Size(300, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  )),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontFamily: 'Inter',
                ),
               
              ),
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/login');},
            child: Center(child: Text("Already have an account? Log In"),
          
            ),
          ),
        ],
      ),
    ),
   
  );
 
 }
     Widget togglePassword(){
       return IconButton(onPressed: (){
         setState(() {
           _isSecuredPassword =! _isSecuredPassword;
         });
          
       }, icon: _isSecuredPassword ? Icon(Icons.visibility_off): Icon( Icons.visibility), color: const Color.fromARGB(255, 0, 0, 0),);
     }
}



