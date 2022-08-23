import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import '../Api_Models/ApiServices.dart';
import 'EnterNumber.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Api_Models/ApiServices1.dart';
import '../Loading/Loading1.dart';

var otp = "";
var otp1="";
var otp2 = "";
var otp3 = "";
var otp4 = "";
var otp5 = "";
var otp6 = "";
var data1="";
int bbbd=0;
TextEditingController pnController = new TextEditingController();

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

Future<UserModel1?> createUser1() async {
  var url = Uri.parse( 'https://dev.wamatechnology.com/projects/wama-trendz-reseller-project/public/api/v1/verifyOTP');
  final response = await http.post(url, body: {
    "code": Number_code,
    "iMobileNo":phoneno,
    "otp" : otp,
    "iCountryCode": phoneid,
  });
  dynamic bsd = json.decode(response.body);
  print(bsd["statusCode"]);
  bbbd = bsd["statusCode"];
  if (response.statusCode == 200) {
    final String responseString = response.body;
    print(responseString);
    return userModel1FromJson(responseString);
  }else{
    Fluttertoast.showToast(
      msg: "OTP entered is incorrect",
      backgroundColor: Colors.grey[300],
      textColor: Colors.red,
      fontSize: 16.0,
    );
  }
}
class _VerifyState extends State<Verify> {

  bool buttonenabled = false;

  int secondsRemaining = 10;
  bool enableResend = false;
  late Timer timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.yellow[100],
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue[100],
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
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://i0.wp.com/luamaralstudio.com/wp-content/uploads/2020/09/glitter-aesthetic-phone-wallpaper-background-3.jpg?resize=980%2C1741"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(16, 30, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>   EnterNumber(),
                            ),
                          );
                        },
                        child: const Icon(Icons.arrow_back_ios,
                          size: 25,
                          color: Color.fromRGBO(114, 121, 127, 1),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Text("Verify with OTP",
                        style: GoogleFonts.poppins(
                          fontSize: 24.0,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Code is sent to ",
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: const Color.fromRGBO(85, 85, 85, 1),
                          ),
                        ),
                        const SizedBox(width: 2,),
                        Text("$phoneid $phoneno",
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: const Color.fromRGBO(85, 85, 85, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 64, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: TextFormField(
                            onChanged: (value) async {
                              otp1="";
                              otp1 = otp1 + value;
                              if (value.length == 1) {
                                otp=otp1+otp2+otp3+otp4+otp5+otp6;
                                if(otp.length ==6) {
                                  bbbd=0;
                                  FocusScope. of (context).unfocus();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Loading_verify()));
                                  otp1 = "";
                                  otp2 = "";
                                  otp3 = "";
                                  otp4 = "";
                                  otp5 = "";
                                  otp6 = "";
                                  final UserModel1? user = await createUser1();
                                  otp ="";
                                  if(bbbd == 200) {
                                    Fluttertoast.showToast(
                                      msg: "OTP has been verified",
                                      backgroundColor: Colors.grey[300],
                                      textColor: Colors.black,
                                      fontSize: 16.0,
                                    );
                                  }
                                }else{
                                  FocusScope. of (context).nextFocus();
                                }
                              }if(value.length == 0){
                                otp1 ="";
                              }
                            },
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 1.0, color: Colors.blueGrey,),
                              ),
                              filled: true,
                              fillColor: Colors.blue[100],
                            ),
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: TextFormField(
                            onChanged: (value) async {
                              otp2="";
                              otp2 = otp2 + value;
                              if (value. length == 1) {
                                otp=otp1+otp2+otp3+otp4+otp5+otp6;
                                if(otp.length ==6) {
                                  bbbd=0;
                                  FocusScope. of (context).unfocus();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Loading_verify()));
                                  otp1 = "";
                                  otp2 = "";
                                  otp3 = "";
                                  otp4 = "";
                                  otp5 = "";
                                  otp6 = "";
                                  final UserModel1? user = await createUser1();
                                  otp ="";
                                  if(bbbd == 200) {
                                    Fluttertoast.showToast(
                                      msg: "OTP has been verified",
                                      backgroundColor: Colors.grey[300],
                                      textColor: Colors.black,
                                      fontSize: 16.0,
                                    );
                                  }
                                }else{FocusScope. of (context).nextFocus();}
                              }if(value.length == 0){
                                FocusScope.of(context).previousFocus();
                                otp2="";
                              }
                            },

                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 1.0, color: Colors.blueGrey,),
                              ),
                              filled: true,
                              fillColor: Colors.blue[100],
                            ),

                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: TextFormField(
                            onChanged: (value) async {
                              otp3="";
                              otp3 = otp3 + value;
                              if (value. length == 1) {
                                otp=otp1+otp2+otp3+otp4+otp5+otp6;
                                if(otp.length ==6) {
                                  bbbd=0;
                                  FocusScope. of (context).unfocus();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Loading_verify()));
                                  otp1 = "";
                                  otp2 = "";
                                  otp3 = "";
                                  otp4 = "";
                                  otp5 = "";
                                  otp6 = "";
                                  final UserModel1? user = await createUser1();
                                  otp ="";
                                  if(bbbd == 200) {
                                    Fluttertoast.showToast(
                                      msg: "OTP has been verified",
                                      backgroundColor: Colors.grey[300],
                                      textColor: Colors.black,
                                      fontSize: 16.0,
                                    );
                                  }
                                }else{FocusScope. of (context).nextFocus();}
                              }if(value.length == 0){
                                FocusScope.of(context).previousFocus();
                                otp3="";
                              }
                            },

                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 1.0, color: Colors.blueGrey,),
                              ),
                              filled: true,
                              fillColor: Colors.blue[100],
                            ),

                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: TextFormField(
                            onChanged: (value) async {
                              otp4="";
                              otp4 = otp4 + value;
                              if (value. length == 1) {
                                otp=otp1+otp2+otp3+otp4+otp5+otp6;
                                if(otp.length ==6) {
                                  bbbd=0;
                                  FocusScope. of (context).unfocus();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Loading_verify()));
                                  otp1 = "";
                                  otp2 = "";
                                  otp3 = "";
                                  otp4 = "";
                                  otp5 = "";
                                  otp6 = "";
                                  final UserModel1? user = await createUser1();
                                  otp ="";
                                  if(bbbd == 200) {
                                    Fluttertoast.showToast(
                                      msg: "OTP has been verified",
                                      backgroundColor: Colors.grey[300],
                                      textColor: Colors.black,
                                      fontSize: 16.0,
                                    );
                                  }
                                }else{FocusScope. of (context).nextFocus();}
                              }if(value.length == 0){
                                FocusScope.of(context).previousFocus();
                                otp4="";
                              }
                            },


                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 1.0, color: Colors.blueGrey,),
                              ),
                              filled: true,
                              fillColor: Colors.blue[100],
                            ),

                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: TextFormField(
                            onChanged: (value) async {
                              otp5="";
                              otp5 = otp5 + value;
                              if (value. length == 1) {
                                otp=otp1+otp2+otp3+otp4+otp5+otp6;
                                if(otp.length ==6) {
                                  bbbd=0;
                                  FocusScope. of (context).unfocus();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Loading_verify()));
                                  otp1 = "";
                                  otp2 = "";
                                  otp3 = "";
                                  otp4 = "";
                                  otp5 = "";
                                  otp6 = "";
                                  final UserModel1? user = await createUser1();
                                  otp ="";
                                  if(bbbd == 200) {
                                    Fluttertoast.showToast(
                                      msg: "OTP has been verified",
                                      backgroundColor: Colors.grey[300],
                                      textColor: Colors.black,
                                      fontSize: 16.0,
                                    );
                                  }
                                }else{FocusScope. of (context).nextFocus();}
                              }if(value.length == 0){
                                FocusScope.of(context).previousFocus();
                                otp5="";
                              }
                            },

                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],

                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 1.0, color: Colors.blueGrey,),
                              ),
                              filled: true,
                              fillColor: Colors.blue[100],
                            ),
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),

                          ),
                        ),
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: TextFormField(
                            onChanged: (value) async {
                              otp6="";
                              otp6 = otp6 + value;
                              if(value.length == 1){
                                otp=otp1+otp2+otp3+otp4+otp5+otp6;
                                FocusScope. of (context).unfocus();
                                if(otp.length ==6) {
                                  bbbd=0;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Loading_verify()));
                                  otp1 = "";
                                  otp2 = "";
                                  otp3 = "";
                                  otp4 = "";
                                  otp5 = "";
                                  otp6 = "";
                                  final UserModel1? user = await createUser1();
                                  otp ="";
                                  if(bbbd == 200) {
                                    Fluttertoast.showToast(
                                      msg: "OTP has been verified",
                                      backgroundColor: Colors.grey[300],
                                      textColor: Colors.black,
                                      fontSize: 16.0,
                                    );
                                  }
                                }}if(value.length == 0){
                                FocusScope.of(context).previousFocus();
                                otp6="";
                              }
                            },

                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],

                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 1.0, color: Colors.blueGrey,),
                              ),
                              filled: true,
                              fillColor: Colors.blue[100],
                            ),
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),

                          ),
                        ),
                      ],
                    ),
                  ) ,
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget> [
                        Text("Request code again in",
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            color:  const Color.fromRGBO(114, 121, 127, 1),
                          ),
                        ),
                        const SizedBox(width: 3,),
                        Text("00:$secondsRemaining",
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            color:  const Color.fromRGBO(114, 121, 127, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget> [
                        Text("Didn't receive code?",
                          style: GoogleFonts.poppins(
                            fontSize: 16.0,
                            color: const Color.fromRGBO(61, 61, 61, 1),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        TextButton(
                          onPressed: enableResend ? _resendCode : null,
                          child:Text("Request Again",
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: enableResend ? const Color.fromRGBO(235, 62, 41, 1) :Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
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
  Future<void> _resendCode() async {
    final UserModel? user = await createUser();
    setState((){
      secondsRemaining = 10;
      enableResend = false;
    });
  }
  @override
  void dispose(){
    timer.cancel();
    super.dispose();
  }
}