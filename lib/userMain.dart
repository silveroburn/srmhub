import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import 'package:srmhub/hackathonInfo.dart';
import 'package:srmhub/personalInfo.dart';
import 'package:srmhub/registration.dart';

class Usermain extends StatelessWidget{
  const Usermain({super.key});

  Widget mainBody(BuildContext context){
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Container(
            color: Colors.black,
            height: 150,
            child: Column(
              children: [
                Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade400,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset('asset/imageTest.jpg', fit: BoxFit.fill,)),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Ashutosh\nSingh Naruka', style: GoogleFonts.roboto(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800))),
                      Text('ranking: #300', style: GoogleFonts.poppins(color: Colors.white60, fontSize: 18, ),)
                    ]
                  ),
                ],
              ),]
            ),
          ),
          Divider(
            color: Colors.white60.withAlpha(100),
            height: 10,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: GridView.count(crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(userMainInfo.length, (index){
                  var varC = Colors.white60.withAlpha(50);
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white60.withAlpha(50),
                      borderRadius: BorderRadius.circular(15),
                      border: Border(
                      top: BorderSide(color: varC, width: 1),
                      bottom: BorderSide(color: varC, width: 1),
                      left: BorderSide(color: varC, width: 1),
                      right: BorderSide(color: varC, width: 1),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (userMainInfo[index] == 'Browse\nHackathon'){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Registration();
                          }));
                        }
                        if (userMainInfo[index] == 'Personal\nInfo'){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return personalInfo();
                          }));
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 7, bottom: 5),
                            child: Text(userMainInfo[index], style: GoogleFonts.poppins(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),))),
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      )
    );
  }

Widget customHeightDrawer() {
  var r = 25;
  var g = 25;
  var b = 25;
  
  return Builder(
    builder: (context) {
      return Container(
        width: 280, // Standard drawer width
        height: 700, // Your desired fixed height
        decoration: BoxDecoration(
          color: Color.fromARGB(255, r, g, b),
          borderRadius: BorderRadius.circular(0),
          border: Border.all(
            color: Colors.white
          )
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, r, g, b)
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Username', 
                  style: GoogleFonts.poppins(
                    color: Colors.white, 
                    fontSize: 30, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Option 1', 
                style: GoogleFonts.poppins(
                  color: Colors.white54, 
                  fontSize: 20, 
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Option 2', 
                style: GoogleFonts.poppins(
                  color: Colors.white54, 
                  fontSize: 20, 
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Option 3', 
                style: GoogleFonts.poppins(
                  color: Colors.white54, 
                  fontSize: 20, 
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Option 4', 
                style: GoogleFonts.poppins(
                  color: Colors.white54, 
                  fontSize: 20, 
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      );
    }
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 35,
        leading: Padding(
          padding: EdgeInsets.only(top: 8), 
          child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
        ),
      ),
      drawer: customHeightDrawer(),
      body: Builder(
        builder: (context) => GestureDetector(
          onLongPress: (){
            Scaffold.of(context).openDrawer();
          },
        child: mainBody(context)),
        ),
    );
  }
}