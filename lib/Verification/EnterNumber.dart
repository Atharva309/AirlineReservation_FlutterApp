import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../Pages/Page2.dart';
import '../Loading/Loading.dart';
import '../Api_Models/ApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

var Number_code="";
int Number_sc=0;
var temp_phone='';
var phoneno ="";
var phoneid='';
TextEditingController pnController = new TextEditingController();


class EnterNumber extends StatefulWidget{
  @override
  State<EnterNumber> createState() => _EnterNumberState();
}

Future<UserModel?> createUser() async {
  var url = Uri.parse( 'https://dev.wamatechnology.com/projects/wama-trendz-reseller-project/public/api/v1/resellerLogin');
  final response = await http.post(url, body: {
    "iCountryCode": phoneid,
    "iMobileNo": phoneno
  });
  dynamic asd = json.decode(response.body);
  Number_sc = asd["statusCode"];
  if (response.statusCode == 200) {
    print(asd["data"]["code"]);
    Number_code = asd["data"]["code"];
    final String responseString = response.body;
    print(responseString);
    return userModelFromJson(responseString);
  }else{
    print(response.body);
    Fluttertoast.showToast(
      msg: "please sign in first",
      backgroundColor: Colors.grey[300],
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}

class _EnterNumberState extends State<EnterNumber> {

  UserModel userModel=UserModel();

  RegExp pass_valid = RegExp(r'^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$');

  bool validatePhone(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.blue[100],
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellow[100],
              borderRadius: const BorderRadius.only(topLeft: const Radius.circular(60),bottomRight: Radius.circular(60),)),
          width: double.infinity,
          height: 57,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Verify your phone number',
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                  ),
                ],
              )),
        ),
      ),
      body:Stack(
        children:<Widget> [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://m.media-amazon.com/images/I/61sS22xEOPL._AC_SX466_.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 50, 16, 0),
                      child: SizedBox(
                        width: 35.0,
                        height: 19.0,
                        child:
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainMenu(),
                                ),
                              );
                            },
                            child: Text('SKIP',
                              style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(114, 121, 127, 1,),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0,),
                  const Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn.dribbble.com/users/60166/screenshots/11603032/media/b5785a0b8b6bc0426e1c7a761458c731.jpg?compress=1&resize=400x300'),
                      radius: 40.0,

                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Text('Verify',
                    style: GoogleFonts.poppins(
                      fontSize: 30.0,

                      color: Colors.blueGrey[700],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 110, 0, 0),
                    child:Center(
                      child: Text("Enter your mobile number",
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          color: const Color.fromRGBO(85, 85, 85, 1),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  Container(
                      margin: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                      child:IntlPhoneField(
                        controller: pnController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(vertical: 10, ),
                          counterText: "",
                          labelText: 'Mobile Number',
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: const Color.fromRGBO(117, 117, 117, 1),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(width: 2.0,),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 3.0, color: Colors.blueGrey,),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 3.0, color: Colors.green,),
                          ),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (pname) {
                          phoneno = pname.number;
                          phoneid = pname.countryCode;
                          temp_phone = pname.completeNumber;
                          print(pnController);
                        },

                      )
                  ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: FlatButton(onPressed: () async{
                           bool result = validatePhone(temp_phone);
                           if(phoneno == '') {
                             Fluttertoast.showToast(
                               msg: "please enter a indian phone number",
                               backgroundColor: Colors.grey[300],
                               textColor: Colors.black,
                               fontSize: 16.0,
                             );
                           }else{
                             if (result){
                               Number_sc=0;
                               Navigator.push(context,
                                 MaterialPageRoute(
                                     builder: (context) => const Loading_Number()),);
                               final UserModel? user = await createUser();
                               temp_phone='';
                             }else{
                               Fluttertoast.showToast(
                                 msg: "please enter a indian phone number",
                                 backgroundColor: Colors.grey[300],
                                 textColor: Colors.black,
                                 fontSize: 16.0,
                               );
                             }}
                         },
                        hoverColor: Colors.blue,
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: const Text(
                          "Send OTP",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}