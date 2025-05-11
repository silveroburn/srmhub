import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class personalInfo extends StatefulWidget{
  const personalInfo({super.key});

  @override 
  State<personalInfo> createState() => _personalInfoState();
}

class _personalInfoState extends State<personalInfo> {
  bool editable = false;
  TextEditingController nameTextC = TextEditingController(text: 'Ashutosh');
  TextEditingController emailTextC = TextEditingController(text: 'silver0burn@gmail.com');
  TextEditingController bioTextC = TextEditingController(text: 'IIIrd year student');
  TextEditingController githubTextC = TextEditingController(text: 'github.com/silveroburn');
  TextEditingController locationTextC = TextEditingController(text: 'SRM Hostel, Chennai');

  Widget unit(String name, TextEditingController controller){
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      child: Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: GoogleFonts.poppins(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),),
            editable? 
              Expanded(
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero, 
                    ),
                ),
              )
            :Text(
              controller.text,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
            )
          ]),
      ),
    );
  }

  Widget divide(){
    return Divider(
      height: 1,
      thickness: 1,
      indent: 0,
      endIndent: 0,
      color: Colors.white54,
    );
  }

  Widget layout(){
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white38,
        ),
        ),
        child: Column(
          children: [
            unit('NAME', nameTextC),
            divide(),
            unit('EMAIL', emailTextC),
            divide(),
            unit('BIO', bioTextC),
            divide(),
            unit('GITHUB', githubTextC),
            divide(),
            unit('LOCATION', locationTextC),
          ])
      ),
    );
  }
  
  Widget mainBody(){
    return Container(
      child: Column(
        children: [
          Container(
            height: 150,
            color: Colors.transparent,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      'Personal\nInfo',
                      style: GoogleFonts.ibmPlexMono(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 30, top: 50),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          editable = !editable;
                        });
                      },
                      child: 
                      editable?
                      Icon(Icons.check, color: Colors.white, size: 40,)
                      :Icon(Icons.edit_document, color: Colors.white, size: 40,)
                    )),
                ),
              ]
            ),
          ),
          Divider(height: 2, thickness: 2, indent: 30, endIndent: 30,),

          SizedBox(height: 20,),

          layout(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: mainBody(),
    );
  }
}