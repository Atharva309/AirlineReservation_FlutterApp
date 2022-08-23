import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Verification/EnterNumber.dart';
import '../Pages/main.dart';
import 'SignIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

var password ="";
var emailid ="";
TextEditingController emailController = TextEditingController();
TextEditingController pwdController = TextEditingController();

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  String? loadEmailId ="";
  String? loadPassword="";
  final _formKey = GlobalKey<FormState>();
  getValidationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loadEmailId = prefs.getString('emailid');
      loadPassword = prefs.getString('password');
    }
  );
  }
    RegExp pass_vali = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z][a-zA-Z]+");
    RegExp pass_va = RegExp(r'^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$');


    bool validateEmail(String pass) {
      String password = pass.trim();
      if (pass_vali.hasMatch(password)) {
        return true;
      } else {
        return false;
      }
    }

    @override
  void initState() {
      super.initState();
      getValidationData();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Container(
          color: Colors.blue[100],
          child: Container(
            decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),)),
            width: double.infinity,
            height: 57,
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(width: 15.0,),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),);
                        },
                        child: Text(
                          "sign up",
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: const Color(0xFF158998)),
                        ))
                  ],
                )),
          ),
        ),
        body:

        Stack(
          children: <Widget>[
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
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 25,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()),
                          );
                        },
                        icon: const Icon(Icons.arrow_back_ios_new),
                        color: Colors.black45,
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
                    Text('LOG IN',
                      style: GoogleFonts.poppins(
                        fontSize: 30.0,

                        color: Colors.blueGrey[700],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0,),
                      child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter an email";
                            } else {
                              //call function to check password
                              bool result = validateEmail(value);
                              if (result) {
                                // create account event
                                return null;
                              } else {
                                return "Please enter a valid email";
                              }
                            }
                          },
                          controller: emailController,

                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                              borderSide: BorderSide(width: 2.0,),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 3.0, color: Colors.blueGrey,),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 3.0, color: Colors.green,),
                            ),
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.blueGrey,
                            ),
                          ),
                          style: TextStyle(color: Colors.blueGrey[800]),

                          onChanged: (email) {
                            emailid = email;
                          }
                      ),


                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0,),
                      child: TextFormField(
                        controller: pwdController,

                          obscureText: true,
                          autocorrect: false,

                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter a password";
                            } else {if (value == loadPassword) {
                              if(emailid == loadEmailId){
                                return null;
                              } else{
                                return "Password incorrect";
                              }
                              } else {
                                return "Password incorrect";
                              }
                            }
                          },

                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                              borderSide: BorderSide(width: 2.0,),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 3.0, color: Colors.blueGrey,),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 3.0, color: Colors.green,),
                            ),
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.blueGrey,
                            ),
                          ),
                          style: TextStyle(color: Colors.blueGrey[800]),

                          onChanged: (pass) {
                            password = pass;
                          }
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    FlatButton(onPressed: () {
                      if(emailid == loadEmailId) {
                        if(password == loadPassword){
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EnterNumber()),);
                          pwdController.clear();
                          emailController.clear();
                        }
                      }else{
                          Fluttertoast.showToast(
                            msg: "Incorrect email or password",
                            backgroundColor: Colors.grey[300],
                            textColor: Colors.red,
                            fontSize: 16.0,
                          );
                        }}else{
                        Fluttertoast.showToast(
                          msg: "Incorrect email or password",
                          backgroundColor: Colors.grey[300],
                          textColor: Colors.red,
                          fontSize: 16.0,
                        );
                      }
                    },
                        hoverColor: Colors.blue,
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: const Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: Colors.white,
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


