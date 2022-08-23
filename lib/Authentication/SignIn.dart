import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Pages/main.dart';
import 'LogIn.dart';
import 'package:shared_preferences/shared_preferences.dart';


var fname ="";
var lname= "";
var password ="";
var emailid ="";
SharedPreferences? localStorage;
TextEditingController emailController = TextEditingController();
TextEditingController pwdController = TextEditingController();
TextEditingController fnController = TextEditingController();
TextEditingController lnController = TextEditingController();
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static Future init() async{
    localStorage =await SharedPreferences.getInstance();
  }

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  List<String> model = [];
  // regular expression to check if string
  RegExp pass_valid = RegExp(r"^(?=.*?[a-z])(?=.*?[0-9]).{8,}$");

  RegExp pass_vali = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z][a-zA-Z]+");


  //A function that validate user entered

  bool validatePassword(String pass){
    String _password = pass.trim();
    if(pass_valid.hasMatch(_password)){
      return true;
    }else{
      return false;
    }
  }

  bool validateEmail(String pass){
    String password = pass.trim();
    if(pass_vali.hasMatch(password)){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Container(
        color: Colors.yellow[100],
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(60),bottomRight: Radius.circular(60),)),
          width: double.infinity,
          height: 57,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(width: 15.0,),
                  GestureDetector(
                      onTap: () {

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogIn(),
                          ),);
                      },
                      child: Text(
                        "Log in",
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: const Color(0xFF158998)),
                      ))
                ],
              )),
        ),
      ),
      body:

      Stack(
        children:<Widget>[
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
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 25,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()),
                        );
                      },
                      icon:const Icon(Icons.arrow_back_ios_new),
                      color: Colors.black45,
                    ),
                  ),

                  const SizedBox(height: 50.0,),

                  const Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://cdn.dribbble.com/users/60166/screenshots/11603032/media/b5785a0b8b6bc0426e1c7a761458c731.jpg?compress=1&resize=400x300'),
                      radius: 40.0,

                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Text('SIGN UP',
                    style: GoogleFonts.poppins(
                      fontSize: 30.0,

                      color: Colors.blueGrey[700],
                    ),
                  ),
                  const SizedBox(height: 20.0),


                      Container(
                        margin: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                              controller: fnController,
                              validator: (var fname) {
                                if (fname == null || fname.isEmpty) {
                                  return ('Can\'t be empty');
                                }else{ return null;}
                              },
                              onSaved: (fname){
                                fname = fname;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(width: 2.0,),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(width: 3.0,color: Colors.blueGrey,),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(width: 3.0,color: Colors.green,),
                                ),
                                labelText: 'FIRST NAME',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              style: TextStyle(color: Colors.blueGrey[800]),
                          ),
                            ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: TextFormField(
                              controller: lnController,
                              validator: (var lname) {
                                if (lname == null || lname.isEmpty) {
                                  return ('Can\'t be empty');
                                }else{ return null;}
                              },
                              onSaved: (lname){
                                lname = lname;
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(width: 2.0,),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(width: 3.0,color: Colors.blueGrey,),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(width: 3.0,color: Colors.green,),
                                ),
                                labelText: 'LAST NAME',
                                labelStyle: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              style: TextStyle(color: Colors.blueGrey[800]),
                            ),
                      ),
                    ],
                  ),),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0,),
                    child: TextFormField(
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please enter an email";
                        }else {
                          bool result = validateEmail(value);
                          if (result) {
                           if (!model.contains(value)) {
                             return null;
                           } else {
                             return "email already exists";
                            }
                        }else {
                            return "Please enter a valid email";
                          }
                      }
                      },
                        onSaved: (email){
                        emailid = email!;
                        model.add(email);
                        },

                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 2.0,),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 3.0,color: Colors.blueGrey,),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 3.0,color: Colors.green,),
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
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0,),
                    child: TextFormField(
                      controller: pwdController,

                      obscureText: true,
                      autocorrect: false,

                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please enter a password";
                        }else{
                          //call function to check email
                          bool result = validatePassword(value);
                          if(result) {
                            return null;
                          }else{
                            return "Password should be alphanumeric and 8 characters long";
                          }
                        }
                      },
                          onSaved: (pass){
                          password= pass!;
                          },

                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 2.0,),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 3.0,color: Colors.blueGrey,),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(width: 3.0,color: Colors.green,),
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
                    ),
                  ),





                  const SizedBox(height: 40.0),
                  FlatButton(onPressed: () {
                      if(_formKey.currentState!.validate ()){
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => LogIn()),//Result(model: this.model)),
                      );
                      addStringToSF();
                      };
                      },
                      hoverColor: Colors.blue,
                      color: Colors.blueGrey,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                   child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  addStringToSF() async {
    await SignIn.init();
    localStorage?.setString('emailid', emailController.text.toString());
    localStorage?.setString('password', pwdController.text.toString());
    localStorage?.setString('fname', fnController.text.toString());
    localStorage?.setString('lname', lnController.text.toString());
    pwdController.clear();
    emailController.clear();
    fnController.clear();
    lnController.clear();

    // print("Save Data :${emailController}");
  }
}




