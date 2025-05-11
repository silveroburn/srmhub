import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:srmhub/createHackathon.dart';
import 'package:srmhub/hackathonInfo.dart';
import 'package:srmhub/main.dart';

class Organizermain extends StatelessWidget {
  const Organizermain ({super.key});

  Widget body(BuildContext context){
    final organizationList = OrganizationInfo.getInfo();
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              organizationName,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'subscript',
              style: GoogleFonts.roboto(
                color: Colors.white38,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          SizedBox(height: 30),
          Divider(
            height: 1,
            thickness: 0.4,
            indent: 10,
            endIndent: 10,
            color: Colors.white60,
          ),
          SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                children: List.generate(organizationList.length, (index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white30, width: 1),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (organizationList[index].name == 'Create Hackathon'){
                          Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => const Createhackathon(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(0.0, 1.0); 
                              const end = Offset.zero;
                              final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeOut));
                          
                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ));
                        }
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // alignment: Alignment.centerLeft,
                            Text(
                              organizationList[index].name,
                              style: GoogleFonts.poppins(
                                color: Colors.white60,
                                fontSize: 25,
                                height: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                organizationList[index].info,
                                style: GoogleFonts.poppins(
                                  color: Colors.white54,
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                            ),
                          ]
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: body(context),
    );
  }
}