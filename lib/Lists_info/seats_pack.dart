import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

int total= 0;
int total_price=0;

class Alley{
  const Alley({required this.seat_alley,});
  final String seat_alley;
}
const List<Alley> alleys = <Alley>[
  Alley(seat_alley: 'A'),
  Alley(seat_alley: 'B'),
  Alley(seat_alley: 'C'),
  Alley(seat_alley: 'D'),
  Alley(seat_alley: 'E'),
  Alley(seat_alley: 'F'),
  Alley(seat_alley: 'G'),
];

class Choice {
  const Choice( {required this.seat_no, required this.price,});
  final String seat_no;
  final int price;
}
const List<Choice> choices = <Choice>[
  Choice(seat_no: '1', price:10000,),
  Choice(seat_no: '2', price:10000,),
  Choice(seat_no: '3', price:10000,),
  Choice(seat_no: '4', price:10000, ),
  Choice(seat_no: '5', price:10000,),
  Choice(seat_no: '6', price:15000,),
  Choice(seat_no: '7', price:15000,),

  Choice(seat_no: '0', price:00000,),

  Choice(seat_no: '8', price:20000,),
  Choice(seat_no: '9', price:20000,),
  Choice(seat_no: '10', price:20000,),
];

class SelectCard extends StatefulWidget {
  SelectCard({Key? key,required this.choice, required this.alley}) : super(key: key);
  final Choice choice;
  final Alley alley;
  @override
  State<SelectCard> createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {
  bool boolValue = Random().nextDouble() <= 0.7;
  String _selected = "";
  @override
  Widget build(BuildContext context) {
       return Row(
              children: <Widget>[
                (widget.alley.seat_alley == "C")
                    ? SizedBox(width: 7,)
                    : SizedBox(width: 0,),
                (widget.alley.seat_alley == "F")
                    ? SizedBox(width: 7,)
                    : SizedBox(width: 0,),
                (widget.alley.seat_alley == "A")
                    ? SizedBox(width: 7,)
                    : SizedBox(width: 0,),
                (widget.alley.seat_alley == "D")
                    ? SizedBox(width: 3.5,)
                    : SizedBox(width: 0,),
                SizedBox(
                  height: 35,
                  width: 35,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (boolValue) {
                          if (_selected == "") {
                            _selected = _selected + "selected";
                            total = total + widget.choice.price;
                          } else {
                            _selected = "";
                            total = total - widget.choice.price;
                          }
                        }
                      });
                    },
                    child: Card(
                      color: (boolValue) ? (_selected.contains("selected"))
                          ? Colors.lightGreenAccent[700]
                          : Colors.grey[200]
                          : Colors.redAccent[100],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("${widget.choice.seat_no} ${widget.alley
                                .seat_alley}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 12.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ]);
  }
}


class Alley1{
  const Alley1({required this.seat_alley,});
  final String seat_alley;
}
const List<Alley1> alleys1 = <Alley1>[
  Alley1(seat_alley: 'A'),
  Alley1(seat_alley: 'B'),
  Alley1(seat_alley: 'C'),
  Alley1(seat_alley: 'D'),
  Alley1(seat_alley: 'E'),
];

class Choice1 {
  const Choice1({required this.seat_no, required this.price});
  final String seat_no;
  final int price;
}
const List<Choice1> choices1 = <Choice1>[
  Choice1(seat_no: '1', price:5000),
  Choice1(seat_no: '2', price:5000),
  Choice1(seat_no: '3', price:5000),
  Choice1(seat_no: '4', price:5000),
  Choice1(seat_no: '5', price:5000),
  Choice1(seat_no: '6', price:8000),
  Choice1(seat_no: '7', price:8000),
];

class SelectCard2 extends StatefulWidget {
  SelectCard2({Key? key,required this.choice1, required this.alley1}) : super(key: key);
  final Choice1 choice1;
  final Alley1 alley1;
  @override
  State<SelectCard2> createState() => _SelectCard2State();
}

class _SelectCard2State extends State<SelectCard2> {
  bool boolValue = Random().nextDouble() <= 0.7;
  String _selected = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Row(
          children:<Widget>[
            (widget.alley1.seat_alley == "C") ? SizedBox(width: 12,) : SizedBox(width: 0,),
            (widget.alley1.seat_alley == "D") ? SizedBox(width: 6,) : SizedBox(width: 0,),
            (widget.alley1.seat_alley == "A") ? SizedBox(width: 12,) : SizedBox(width: 0,),

            SizedBox(
              height: 43,
              width: 43,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if(boolValue){
                      if(_selected == ""){
                        _selected = _selected + "selected" ;
                        total = total + widget.choice1.price;
                      }else{
                        _selected = "";
                        total = total - widget.choice1.price;
                      }}
                  });
                },
                child: Card(
                  color: (boolValue)? (_selected.contains("selected")) ? Colors.lightGreenAccent[700] : Colors.grey[200]
                      : Colors.redAccent[100],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft:  Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft:  Radius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("${widget.choice1.seat_no} ${widget.alley1.seat_alley}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ] ),
    );
  }
}



class Alley2{
  const Alley2({required this.seat_alley,});
  final String seat_alley;
}
const List<Alley2> alleys2 = <Alley2>[
  Alley2(seat_alley: 'A'),
  Alley2(seat_alley: 'B'),
  Alley2(seat_alley: 'C'),
  Alley2(seat_alley: 'D'),
  Alley2(seat_alley: 'E'),
  Alley2(seat_alley: 'F'),
];

class Choice2 {
  const Choice2({required this.seat_no, required this.price});
  final String seat_no;
  final int price;
}
const List<Choice2> choices2 = <Choice2>[
  Choice2(seat_no: '1', price:30000),
  Choice2(seat_no: '2', price:30000),
  Choice2(seat_no: '3', price:30000),
  Choice2(seat_no: '4', price:50000),
  Choice2(seat_no: '5', price:50000),
  Choice2(seat_no: '6', price:50000),
  Choice2(seat_no: '7', price:60000),
  Choice2(seat_no: '8', price:60000),
  Choice2(seat_no: '9', price:60000),
  Choice2(seat_no: '10', price:60000),
];

class SelectCard3 extends StatefulWidget {
  SelectCard3({Key? key,required this.choice2, required this.alley2}) : super(key: key);
  final Choice2 choice2;
  final Alley2 alley2;
  @override
  State<SelectCard3> createState() => _SelectCard3State();
}

class _SelectCard3State extends State<SelectCard3> {
  bool boolValue = Random().nextDouble() <= 0.6;
  String _selected = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
          children:<Widget>[
            (widget.alley2.seat_alley == "D") ? SizedBox(width: 10,) : SizedBox(width: 0,),
            (widget.alley2.seat_alley == "B") ? SizedBox(width: 5,) : SizedBox(width: 0,),
            (widget.alley2.seat_alley == "E") ? SizedBox(width: 5,) : SizedBox(width: 0,),
            (widget.alley2.seat_alley == "A") ? SizedBox(width: 10,) : SizedBox(width: 0,),

            SizedBox(
              height: 40,
              width: 40,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if(boolValue){
                      if(_selected == ""){
                        _selected = _selected + "selected" ;
                        total = total + widget.choice2.price;

                      }else{
                        _selected = "";
                        total = total - widget.choice2.price;
                      }}
                  });
                },
                child: Card(
                  color: (boolValue)? (_selected.contains("selected")) ? Colors.lightGreenAccent[700] : Colors.grey[200]
                      : Colors.redAccent[100],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft:  Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft:  Radius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("${widget.choice2.seat_no} ${widget.alley2.seat_alley}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ] ),
    );
  }
}



class SelectCardkey extends StatefulWidget {
  SelectCardkey({Key? key, required this.colorvalue,}) : super(key: key);
  final String colorvalue;
  @override
  State<SelectCardkey> createState() => _SelectCardkeyState();
}

class _SelectCardkeyState extends State<SelectCardkey> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Card(
        color: (widget.colorvalue == "green")
            ? Colors.lightGreenAccent[700]
            : (widget.colorvalue == "grey")
            ? Colors.grey[200]
            : Colors.redAccent[100],
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft:  Radius.circular(10),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft:  Radius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
            child: Align(
              alignment: Alignment.center,
              child: Text("  ",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
