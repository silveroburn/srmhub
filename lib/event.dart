import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srmhub/hackathonInfo.dart';
import 'package:srmhub/registration.dart';

class Event extends StatelessWidget{
  const Event({super.key});

  Widget eventBody(BuildContext context){
    List<Hackathoninfo> hackInfo = Hackathoninfo.getInfo();
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset('asset/imageTest.jpg', fit: BoxFit.fitWidth,),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                            colors: [
                              Colors.black, Colors.transparent
                            ],
                            stops: [
                              0.0, 1.0
                            ]
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text('HACKATHONG', style: GoogleFonts.poppins(
                        color: Colors.white60, fontSize: 40, fontWeight: FontWeight.w500, height: 0.9
                      ), ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: 'Powered by ', style: GoogleFonts.roboto(
                              color: Colors.white38, fontSize: 15, fontWeight: FontWeight.w300
                            ),),
                            TextSpan(
                              text: 'myClub', style: GoogleFonts.roboto(
                                color: Colors.white54, fontSize: 15, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic
                              )
                            )
                          ]
                        ),
                      ),
                      SizedBox(height: 40,),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          // color: Colors.amber.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: hackInfo.length,
                          itemBuilder: (context, index){
                            final data = hackInfo[index];
                            return ExpansionTile(
                              title: Text(data.name, style: GoogleFonts.poppins(color: Colors.white60, fontSize: 20, fontWeight: FontWeight.w500),),
                              trailing: Icon(Icons.keyboard_double_arrow_down_sharp, color: Colors.white60,), 
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
                                    child: Text(data.info, style: GoogleFonts.roboto(
                                      color: Colors.white60, fontSize: 13, fontWeight: FontWeight.w400, 
                                    ),),
                                  ),
                                )
                              ],
                            );
                          }
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Container(
                            child: Text('Status: applied', style: GoogleFonts.poppins(
                              color: Colors.white54, fontSize: 18, fontWeight: FontWeight.w400
                            ),),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
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
          child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white60, size: 30,),
          onTap: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => Registration()));
          },
        ),
      ),
      body: eventBody(context),
    );
  }
}