import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app1/Layouts/FlightCard.dart';
import '../Lists_info/Flight_List.dart';


class FlightConditions extends StatefulWidget {
  const FlightConditions({Key? key,required this.flight,required this.dateinput}) : super(key: key);
  final Flights flight;
  final String dateinput;

  @override
  State<FlightConditions> createState() => _FlightConditionsState();
}

class _FlightConditionsState extends State<FlightConditions> {


  @override
  Widget build(BuildContext context) {
    return (widget.dateinput == "All Flights")
        ? FlightCard(flight: widget.flight, dateinput: widget.dateinput,)
        : (buildDate(widget.flight.fly_date) == widget.dateinput)
          ? FlightCard(flight: widget.flight, dateinput: widget.dateinput,)
          : SizedBox();
  }
}

