import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:test_app1/Pages/Page2.dart';
import 'package:test_app1/Pages/main.dart';
import 'package:test_app1/Lists_info/seats_pack.dart';
import '../Layouts/FlightConditions.dart';
import '../Lists_info/Flight_List.dart';



class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key, required this.flight}) : super(key: key);
  final Flights flight;

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  DateFormat dateFormat = DateFormat("dd-MM-yy");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:Colors.indigo[900] ,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only (bottomRight: Radius.circular (30), bottomLeft: Radius.circular (30))
          ),
          title: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(backgroundImage: NetworkImage('https://cdn.dribbble.com/users/60166/screenshots/11603032/media/b5785a0b8b6bc0426e1c7a761458c731.jpg?compress=1&resize=400x300'),),
                  const SizedBox(height: 10,),
                  Text(
                    'Fly With Us',
                    style: GoogleFonts.arvo(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5,),
            ],
          ),
          centerTitle: true,
        ),
      ),
      extendBodyBehindAppBar: true,

      bottomNavigationBar: Container(
        color: Colors.indigo[900],
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellowAccent[100],
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(60),bottomRight: Radius.circular(60),)),
          width: double.infinity,
          height: 57,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Go Back To',
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(width:5.0),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),);
                      },
                      child: Text(
                        "Home Page",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: const Color(0xFF158998)),
                      ))
                ],
              )),
        ),
      ),
      body:Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1534994820022-ec2b00d8cd42?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YWlycGxhbmUlMjB3aW5nfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 120,),
              Center(
                child: Text("Congratulations!".toUpperCase(),
                style: GoogleFonts.poppins(
                  color:Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),),
              ),
              Center(
                child: Text("Your Ticket has been booked".toUpperCase(),
                  style: GoogleFonts.poppins(
                    color:Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                  ),),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 10.0,
                child:  Center(
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(start: 10.0, end: 10.0),
                    height: 5.0,
                    color: Colors.white24,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BorderedText(
                          strokeWidth: 1.0,
                          child: Text("From",
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                        ),
                        BorderedText(
                          strokeWidth: 1.0,
                          child: Text(widget.flight.dest_from,
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BorderedText(
                          strokeWidth: 1.0,
                          child: Text("To",
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                        ),
                        BorderedText(
                          strokeWidth: 1.0,
                          child: Text(widget.flight.dest_to,
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BorderedText(
                          strokeWidth: 1.0,
                          child: Text("Date",
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                        ),
                        BorderedText(
                          strokeWidth: 1.0,
                          child: Text(dateFormat.format(widget.flight.fly_date),
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BorderedText(
                          strokeWidth: 1.0,
                          child: Text("Airlines",
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BorderedText(
                          strokeWidth: 1.0,
                          child: Text("Plane",
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                        ),
                        BorderedText(
                          strokeWidth: 1.0,
                          child: Text(widget.flight.plane,
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BorderedText(
                          strokeWidth: 1.0,
                          child: Text("Total",
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                        ),
                        BorderedText(
                          strokeWidth: 1.0,
                          child: Text("${total_price.toString()} Rs.",
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
                child:  Center(
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(start: 10.0, end: 10.0),
                    height: 5.0,
                    color: Colors.white24,
                  ),
                ),
              ),
              const SizedBox(height:30),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainMenu(),
                    ),);
                  },
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.indigo[900],
                      child:Center(
                        child: Text("BOOK AGAIN",
                          style: GoogleFonts.poppins(
                            fontSize: 15.0,
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

    );
  }
}
