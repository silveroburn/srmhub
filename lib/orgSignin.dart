import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:srmhub/OrganizerMain.dart';
import 'package:srmhub/main.dart';

Future<int> oSigninCheck(String username, String email, String password, BuildContext context) async {
  final url = Uri.parse('http://192.168.155.11:3000/organizerLogin');

  final result = await http.post(
    url,
    headers: {'Content-Type' : 'Application/json'},
    body: json.encode({
      'name' : username,
      'email': email,
      'password' : password,
    })
  );
  if (result.statusCode == 200){
    organizationName = username;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully signed in as organizer')));
    return 1;
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not sign in as organizer')));
    return 0;
  }
}

class Orgsignin extends StatelessWidget{
  const Orgsignin({super.key});

  Widget oSigninBody (BuildContext context){
    var username, email, password;
    final usernameTextController = TextEditingController();
    final passwordTextController = TextEditingController();
    final emailTextController = TextEditingController();
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            padding: EdgeInsets.only(top: 100, left: 20),
            child: Text('Yup, \nYou can \nOrganize',
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
                    hintText: 'Organization name',
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

              SizedBox(height: 30,),
              MaterialButton(
                onPressed: () async {  
                  username = usernameTextController.text;
                  email = emailTextController.text;
                  password = passwordTextController.text;
                  var result = await oSigninCheck(username, email, password, context);
                  if (result == 1){  // Changed from 0 to 1 to navigate on success
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Organizermain()));
                  }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: oSigninBody(context),
    );
  }
  
}