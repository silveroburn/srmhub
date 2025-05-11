import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:path/path.dart';
import 'package:srmhub/registration.dart';
// import 'package:srmhub/utilities.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:srmhub/signin.dart';

Future<int> sendInfo(String username, String email, String password, String regNo, BuildContext context) async {
  final url = Uri.parse('http://192.168.65.11:3000/userSignup');

  final result = await http.post(
    url, 
    headers: {'Content-Type': 'Application/json'},
    body: jsonEncode({
      'username' : username,
      'email' : email,
      'password' : password,
      'regNo' : regNo
    })
  );
  if (result.statusCode == 200){  // This stays as 400 since server returns 400 for success
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Signup Successful'))
    );
    return 1;  // Return 1 for success 
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User already exists'))
    );
    return 0;
  }
}

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    var username, email, password, registrationNo;
    final usernameTextController = TextEditingController();
    final passwordTextController = TextEditingController();
    final emailTextController = TextEditingController();
    final regNoController = TextEditingController();
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            padding: EdgeInsets.only(top: 100, left: 20),
            child: Text('Hey, \nWelcome \nAbord.',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold, height: 1.1),),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: usernameTextController,
                  style: GoogleFonts.poppins(color: Colors.white),
                  cursorColor: Colors.amber.shade300.withAlpha(50),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.white38,),
                    hintText: 'Username',
                    fillColor: Colors.white12,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber.shade200.withAlpha(40),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white38
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: emailTextController,
                  style: GoogleFonts.poppins(color: Colors.white),
                  cursorColor: Colors.amber.shade300.withAlpha(50),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.white38,),
                    hintText: 'Email ID',
                    fillColor: Colors.white12,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.amber.shade100.withAlpha(40)
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 26, 23, 16),
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white38
                    )
                  ), 
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: passwordTextController,
                  style: GoogleFonts.poppins(color: Colors.white),
                  cursorColor: Colors.amber.shade300.withAlpha(50),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.amber.shade200.withAlpha(100),),
                    hintText: 'Password',
                    fillColor: Colors.white12,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.amber.shade100.withAlpha(40)
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white38
                    )
                  ), 
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: regNoController,
                  style: GoogleFonts.poppins(color: Colors.white),
                  textAlign: TextAlign.left,
                  cursorColor: Colors.amber.shade300.withAlpha(50),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.app_registration, color: Colors.white38,),
                    hintText: 'Registration no',
                    fillColor: Colors.white12,
                    filled: true,
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.amber.shade100.withAlpha(40)
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 26, 23, 16),
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white38
                    )
                  ), 
                ),
              ),
              SizedBox(height: 30,),
              MaterialButton(
                onPressed: () async {  
                  username = usernameTextController.text; 
                  email = emailTextController.text;
                  password = passwordTextController.text;
                  registrationNo = regNoController.text;
                  var result = await sendInfo(username, email, password, registrationNo, context);
                  // if (result == 1){
                  //   Navigator.push(
                  //     context, 
                  //     MaterialPageRoute(builder: (context) => const Registration())
                  //   );
                  // }
                },
                color: Colors.amber.shade400.withAlpha(100),
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.only(top: 1, bottom: 1, left: 20, right: 20),
                child: Text('SUBMIT',
                style: GoogleFonts.poppins(
                  color: Colors.white54,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),),
              )
            ],
          ),
        ],
      ),
    );
  }
}