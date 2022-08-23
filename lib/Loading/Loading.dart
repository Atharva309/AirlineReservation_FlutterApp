import 'package:flutter/material.dart';
import '../Verification/EnterNumber.dart';
import '../Verification/OTPverify.dart';
import 'dart:async';

class Loading_Number extends StatefulWidget {
  const Loading_Number({Key? key}) : super(key: key);

  @override
  State<Loading_Number> createState() => _Loading_NumberState();
}
class _Loading_NumberState extends State<Loading_Number> {

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome(){
    Future.delayed(const Duration(milliseconds: 2000), () {
      if(Number_sc == 200){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Verify(),
          ),
        );
      }else{
        if(Number_sc!= 200){
          if(Number_sc ==0){
            _navigatetohome();
          }else{
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => EnterNumber(),
              ),
            );}
        }else{
          _navigatetohome();
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[

          Container(
            margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Center(
              child:Image.asset("assets/images/loading.gif"),
            ),
          ),
          // Center(
          //   child: SpinKitSpinningLines(
          //     color: Colors.red,
          //     size: 50.0,
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(150, 0, 150,  30),
                child: const Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.dribbble.com/users/60166/screenshots/11603032/media/b5785a0b8b6bc0426e1c7a761458c731.jpg?compress=1&resize=400x300'),
                    radius: 40.0,
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
