import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app1/Pages/TicketFinal.dart';
import '../Lists_info/Flight_List.dart';
import '../Lists_info/seats_pack.dart';
import 'FlightConditions.dart';

class seating extends StatefulWidget {
  const seating({Key? key,required this.flight}) : super(key: key);
  final Flights flight;

  @override
  State<seating> createState() => _seatingState();
}

class _seatingState extends State<seating> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius:  const BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35),),
        color: Colors.grey[700],
      ),
      child: Column(
        children:<Widget> [
          SizedBox(height: 20,),
          Center(
            child: Text(
              "Book Your Seats",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20),),
              color: Colors.blue[100],
            ),
            height: 300,
            padding:  EdgeInsets.fromLTRB(0,0,0,0),
            margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Scrollbar(
              radius: Radius.circular(10),
              thickness: 5,
              child: ListView(
                shrinkWrap: true,
                children: List.generate((widget.flight.plane == "Boeing 747")
                    ?choices.length
                    :(widget.flight.plane == "Beechcraft 1900")
                    ?choices1.length
                    :choices2.length,
                      (index) {
                    if(widget.flight.plane == "Boeing 747"){
                      if(index == 7){
                        return Center(
                          child: SizedBox(
                            height: 15,
                            child: Text("CABIN",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 7,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          children: List.generate(alleys.length, (index1) {
                            return Center(
                              child: SelectCard(
                                  choice: choices[index], alley: alleys[index1]),
                            );
                          },
                          ),
                        );
                      }
                    }else{
                      if(widget.flight.plane == "Beechcraft 1900"){
                        return GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 5,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          children: List.generate(alleys1.length, (index1) {
                            return Center(
                              child: SelectCard2(
                                  choice1: choices1[index], alley1: alleys1[index1]),
                            );
                          },
                          ),
                        );
                      }if(widget.flight.plane == "Airbus A320"){
                        return GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 6,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          children: List.generate(alleys2.length, (index1) {
                            return Center(
                              child: SelectCard3(
                                  choice2: choices2[index], alley2: alleys2[index1]),
                            );
                          },
                          ),
                        );
                      }else{
                        return Text("incorrect input");
                      }}
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children : <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Row(
                  children: <Widget>[
                    SelectCardkey(colorvalue: "green"),
                    SizedBox(width: 2,),
                    Text(" : Selected Seats",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),),
                  ],
                ),),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Row(
                  children:<Widget>[
                    SelectCardkey(colorvalue: "red"),
                    SizedBox(width: 2,),
                    Text(" : Occupied Seats",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  children: <Widget>[
                    SelectCardkey(colorvalue: "grey"),
                    SizedBox(width: 2,),
                    Text(" : Empty Seats",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),),
                  ],
                ),),
            ],),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              if(total != 0){
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => TicketScreen(flight: widget.flight,),
                ),);
              }else{
                Fluttertoast.showToast(
                  msg: "select a seat first",
                  backgroundColor: Colors.grey[300],
                  textColor: Colors.black,
                  fontSize: 16.0,
                );
              }
            },
            child: SizedBox(
              width: 150,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Colors.red[400],
                  child:Center(
                    child: Text("BOOK NOW",
                      style: GoogleFonts.poppins(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),


        ],
      ),
    );
  }
}
