import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Lists_info/Flight_List.dart';
import '../Verification/EnterNumber.dart';
import 'main.dart';
import '../Authentication/SignIn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Layouts/FlightConditions.dart';

var fname ="";
var lname= "";
TextEditingController fnController = TextEditingController();
TextEditingController lnController = TextEditingController();

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  String? loadfname ="";
  String? loadlname="";
  getValidationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loadfname= prefs.getString('fname');
      loadlname = prefs.getString('lname');
    }
    );
  }
  String dateinput="All Flights";
  List<String> items = [ 'This Week','Next Week' , 'This Month','Next Month','All Flights'];
  String? selectedItem = 'All Flights' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:Colors.indigo[900] ,
          // flexibleSpace: ClipRRect(
          //     borderRadius: BorderRadius.only (bottomRight: Radius.circular (30), bottomLeft: Radius.circular (30)),
          //   child: Container(
          //       decoration: BoxDecoration(
          //         image: DecorationImage (
          //           image: NetworkImage('https://img.freepik.com/free-vector/gradient-dynamic-lines-background_23-2149020285.jpg?w=2000'),
          //             fit: BoxFit.fill,
          //           colorFilter: ColorFilter.mode(Colors.blueAccent.withOpacity(0.3), BlendMode.lighten),
          //       ),
          //       ),
          //       ),
          // ),
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

      bottomNavigationBar: Container(
        color: Colors.indigo[900],
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow[100],
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(60),bottomRight: Radius.circular(60),)),
          width: double.infinity,
          height: 57,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Verify your Phone Number',
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(width:10.0),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EnterNumber(),
                          ),);
                      },
                      child: Text(
                        "Here",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: const Color(0xFF158998)),
                      ))
                ],
              )),
        ),
      ),


      body: SingleChildScrollView(
        child: Column(
          children:<Widget> [
          const SizedBox(height: 10.0,),
          Text('WELCOME',
            style: GoogleFonts.poppins(
              fontSize: 30.0,
              color: Colors.blueGrey[700],
            ),
          ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('${(localStorage?.get('fname')) ?? ""}'.toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: 30.0,
                    color: Colors.blueGrey[700],
                  ),
                ),
             const SizedBox(width: 20.0 ,),
            Text('${(localStorage?.get('lname')) ?? ""}'.toUpperCase(),
              style: GoogleFonts.poppins(
                fontSize: 30.0,
                color: Colors.blueGrey[700],
              ),
            ),
              ],
            ),

            const SizedBox(height: 10,),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 180,
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(width: 2.0,),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 10,
                            color: Colors.blueGrey[800],
                        ),
                        value: selectedItem,
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item, style: GoogleFonts.poppins(fontSize: 18)),
                        ))
                            .toList(),
                        onChanged: (item) {
                          dateinput = item ?? "";
                          setState(() => selectedItem = item);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap:(){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.indigo[900],
                          padding: const EdgeInsets.all(10),
                          child: Text("Log-Out",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child:ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(flight.length, (index) {
                  return Center(
                    child: FlightConditions(flight: flight[index],dateinput: dateinput,),
                  );
                },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}