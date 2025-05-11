import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srmhub/OrganizerMain.dart';
import 'package:srmhub/createHackathon.dart';
import 'package:srmhub/orgSignin.dart';
import 'package:srmhub/orgSignup.dart';
// import 'package:srmhub/registration.dart';
import 'package:srmhub/signup.dart';
import 'package:srmhub/signin.dart';
import 'package:srmhub/userMain.dart';
// import 'signup.dart';
// import 'signin.dart';

String organizationName = "";

void main() {
  runApp(MyApp());
}

class  MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class AppbarMain extends StatelessWidget implements PreferredSizeWidget{
  const AppbarMain({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text('S R M H U B .',
      style: GoogleFonts.aleo(color: Colors.white60,
      fontWeight: FontWeight.bold),),
      centerTitle: true,
      bottom: PreferredSize(
      preferredSize: Size.fromHeight(-1), // Thickness of the line
        child: Container(
        color: Colors.grey, // Line color
        height: 0.4,
        ),
      ),
    );
  }
  @override
  Size get preferredSize{
    return const Size.fromHeight(kToolbarHeight + 0.4);
  }
}

class MainPage extends StatelessWidget{
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppbarMain(),
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: const [
          Usermain(),
          Signup(),
          Signin(),
          Orgsignup(),
          Orgsignin(),
        ],
      ),
    );
  } 
}

