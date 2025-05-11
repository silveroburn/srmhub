import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Createhackathon extends StatelessWidget {
  const Createhackathon({super.key});

  Widget hackathon(BuildContext context){
    var container_distance = 20.0;
    var font_size = 17.2;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: container_distance,),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text('HACKATHON INFO', style: GoogleFonts.poppins(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.w500),))
          ),
          SizedBox(height: container_distance,),

          //hackathon name
          infohead(font_size, 'Hackathon name:'),
          SizedBox(height: 10,),
          infoBody('Enter the hackathon name'),

          //description
          SizedBox(height: container_distance,),
          infohead(font_size, 'Description: '),
          SizedBox(height: 10,),
          infoBody('Enter the description (in paragraph)'),

          //cover image link
          SizedBox(height: container_distance,),
          infohead(font_size, 'Cover image (Link):'),
          SizedBox(height: 10,),
          infoBody('Provide the link for the cover image'),

          //registration link
          SizedBox(height: container_distance,),
          infohead(font_size, 'Registration link: '),
          SizedBox(height: 10,),
          infoBody('Provide the link for registration'),

          //team size
          SizedBox(height: container_distance,),
          infohead(font_size, 'Team Size: '),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      isDense: true,
                      hintText: 'min',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0.4,
                          color: Colors.white60
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.amber.shade600
                        )
                      )
                    ),
                  ),
                ),
                SizedBox(width: container_distance,),
                Container(
                  height: 50,
                  child: VerticalDivider(
                    color: Colors.white54,
                    thickness: 1,
                    width: 10,
                    indent: 10,
                    endIndent: 10,
                  ),
                ),
                SizedBox(width: container_distance,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      isDense: true,
                      hintText: 'max',
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0.4,
                          color: Colors.white60
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.amber.shade600
                        )
                      )
                    ),
                  ),
                ),

              ],
            )
          ),

          //venue
          SizedBox(height: container_distance,),
          infohead(font_size, 'Venue:'),
          SizedBox(height: 10,),
          infoBody('Enter the Venue'),

          //topics
          SizedBox(height: container_distance,),
          infohead(font_size, 'Topics / Themes:'),
          SizedBox(height: 10,),
          infoBody('Enter the topics / themes of the event'),
        ],
      ),
    );
  }

  Padding infoBody(String hints) {
    return Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              isDense: true,
              hintText: hints,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 0.4,
                  color: Colors.white60
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 3,
                  color: Colors.amber.shade600
                )
              )
            ),
          ),
        );
  }

  Container infohead(double font_size, String mainText) {
    return Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Text(mainText, style: GoogleFonts.poppins(color: Colors.white60, fontSize: font_size, fontWeight: FontWeight.w300),),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: hackathon(context),
    );
  }
}