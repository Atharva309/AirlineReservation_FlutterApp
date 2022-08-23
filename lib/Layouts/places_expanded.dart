import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class PlacesExpanded extends StatefulWidget {
  const PlacesExpanded({Key? key, required this.url, required this.place, required this.def}) : super(key: key);
  final String url;
  final String place;
  final String def;
  @override
  State<PlacesExpanded> createState() => _PlacesExpandedState();
}

class _PlacesExpandedState extends State<PlacesExpanded> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        borderRadius:  const BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35),),
        image: DecorationImage(
          image: NetworkImage(widget.url),
          fit: BoxFit.cover,
        ),
      ),
      child:  Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    BorderedText(
                      strokeWidth: 2,
                      child: Text(widget.place,
                        style: GoogleFonts.poppins(
                          fontSize: 35.0,
                          color:  Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.fromLTRB(10, 300, 10, 10),
                color: Colors.blue.withOpacity(0.7),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(widget.def,
                    style: GoogleFonts.poppins(
                      fontSize: 10.0,
                      color:  Colors.white,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
