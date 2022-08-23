import 'package:flutter/material.dart';
import '../Pages/Page2.dart';
import '../Verification/OTPverify.dart';
import 'dart:async';




class Loading_verify extends StatefulWidget {
  const Loading_verify({Key? key}) : super(key: key);

  @override
  State<Loading_verify> createState() => _Loading_verifyState();
}
class _Loading_verifyState extends State<Loading_verify> {

  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome(){
    Future.delayed(const Duration(milliseconds: 1000), () {
      if(bbbd == 200){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainMenu(),
          ),
        );
      }else{
        if(bbbd != 200 ){
          if(bbbd==0){
            _navigatetohome();
          }else{
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Verify(),
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
                margin: const EdgeInsets.fromLTRB(150, 0, 150,  10),
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
