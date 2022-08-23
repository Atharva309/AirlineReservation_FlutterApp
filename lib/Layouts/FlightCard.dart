import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:test_app1/Lists_info/seats_pack.dart';
import '../Lists_info/Flight_List.dart';
import 'Seats.dart';

class FlightCard extends StatefulWidget {
  const FlightCard({Key? key, required this.flight, required this.dateinput}) : super(key: key);
  final Flights flight;
  final String dateinput;
  @override
  State<FlightCard> createState() => _FlightCardState();
}

class _FlightCardState extends State<FlightCard> {
  DateFormat dateFormat = DateFormat("dd-MM-yy");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
          color:Colors.white,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10),),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10),),
            child: Container(
              padding: EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 2.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.flight_takeoff,
                              color: Colors.indigo[900],),
                            Text(widget.flight.dest_from,
                              style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children:[
                          Text("${widget.flight.fly_dur.inMinutes.toString()} min",
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              color: Colors.black,
                            ),
                          ),
                          Icon(Icons.arrow_right_alt),
                          (widget.flight.roundtrip)
                              ? Text("RoundTrip",
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              color: Colors.black,
                            ),
                          )
                              : Text("One-Way Trip",
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width:100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.flight_land,
                              color: Colors.indigo[900],),
                            Text(widget.flight.dest_to,
                              style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                    child:  Center(
                      child: Container(
                        margin: EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                        height: 1.0,
                        color: Colors.indigo[900],
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 80,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.flight.logourl),
                              // colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.lighten),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),

                      Text(dateFormat.format(widget.flight.fly_date),
                        style: GoogleFonts.poppins(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),

                      GestureDetector(
                        onTap: (){
                          showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(35.0),
                                ),
                              ),
                              // isScrollControlled: true,
                              builder: (BuildContext context) {
                                return Wrap(children: [seating(flight: widget.flight,)]);
                              }).whenComplete(() {
                            setState(() {
                              total_price = total;
                              total = 0;
                            });
                          });},
                        child: SizedBox(
                          width: 80,
                          height: 30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              color: Colors.red[500],
                              child:Center(
                                child: Text("BOOK NOW",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
