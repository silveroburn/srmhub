import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:path/path.dart';
import 'package:srmhub/event.dart';
// import 'package:srmhub/signin.dart';
import 'package:srmhub/signup.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  Widget containerTemplate(BuildContext context){
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'asset/imageTest.jpg',
                fit: BoxFit.cover,
              )
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                color: Colors.black.withAlpha(60),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CLUBNAME',
                      style: GoogleFonts.karla(
                        color: Colors.white38,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      Container(
                        padding: EdgeInsets.zero,
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Event()),
                            );
                          },
                          child: Icon(
                            Icons.arrow_outward, 
                            color: Colors.white60,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withAlpha(90),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('THEBESTHACKATHON',
                          style: GoogleFonts.lato(
                            color: Colors.white60,
                            fontSize: 15,
                            fontWeight: FontWeight.w900
                          ),),
                          Text('reg timeline: 12/4 - 15/4',
                          style: GoogleFonts.lato(
                            color: Colors.white54,
                            fontSize: 12,
                            fontWeight: FontWeight.w300
                          ),)
                        ],
                      ),
                      Text('\$\$\$',
                      style: GoogleFonts.lato(
                        color: Colors.white60,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300
                      ),)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white60, size: 25,),
          onTap: (){ 
            Navigator.pop(context);
          },
        )
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            containerTemplate(context),
            SizedBox(height: 25,),
            containerTemplate(context),
            SizedBox(height: 25,),
            containerTemplate(context),
            SizedBox(height: 25,),
            containerTemplate(context),
            SizedBox(height: 25,),
            containerTemplate(context),
          ],
        ),
      ),
    );
  }
}