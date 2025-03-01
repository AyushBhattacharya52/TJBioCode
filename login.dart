import 'package:flutter/material.dart';


import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:tjbioinformatic/auth/auth_service.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
bool _isSecuredPassword = true;
final authService = AuthService();

final _emailController = TextEditingController();
final _passwordController = TextEditingController();

void login()async{
  final email = _emailController.text;
  final password = _passwordController.text;

  try{
    showDialog(context: context, builder: (context){return Center(child: CircularProgressIndicator(color: Colors.black,));});
    await authService.signInWithEmailPassword(email, password);

  }
  
  catch (e) {
    if(mounted){
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Error:$e'),));
    }
  }
  Navigator.of(context).pop();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),


      body: ListView(
        children: [
          Center(
            
            child: Column(
              children: [
                
                SizedBox(height: 150,),
                Container(
                  child: Text(
                    'Log In',
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
                    child: Text('Welcome Back!'),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
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
                  child: TextField(
                    obscureText: _isSecuredPassword,
                    controller: _passwordController,
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
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
               
                Center(
                  child: ElevatedButton(
                    onPressed:login,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        minimumSize: Size(300, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        )),
                    child: Text(
                      
                      'Log In',
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
                  onTap: (){Navigator.pushNamed(context, '/signup');},
                  child: Center(child: Text("Don't have an account? Sign Up"),
                  
                  ),
                ),
              ],
            ),
          ),
        ],
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