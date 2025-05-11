import 'package:flutter/material.dart';
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
            color: Colors.transparent,
            height: 150,
            child: Column(
              children: [
                SizedBox(height: 20,),
                // Container(
                //   width: 200,
                //   height: 200,
                //   child: Image.asset('asset/imageTest.jpg', fit: BoxFit.fill)),
                Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                children: List.generate(userMainInfo.length, (index){
                  var varC = Colors.white60;
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                      border: Border(
                      top: BorderSide(color: varC, width: 2),
                      bottom: BorderSide(color: varC, width: 3),
                      left: BorderSide(color: varC, width: 3),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: mainBody(context),
    );
  }
}