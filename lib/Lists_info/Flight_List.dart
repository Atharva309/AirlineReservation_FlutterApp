
class Flights {
  const Flights({required this.dest_from, required this.dest_to, required this.fly_date,  required this.roundtrip,required this.fly_dur,required this.logourl,required this.plane,});
  final String dest_from;
  final String dest_to;
  final DateTime fly_date;
  final bool roundtrip;
  final Duration fly_dur;
  final String logourl;
  final String plane;
}
List<Flights> flight = <Flights>[
  Flights(dest_from: 'Mumbai', dest_to: 'Delhi', fly_date: DateTime.now().add(Duration(days: 20)), roundtrip: false, fly_dur: Duration(hours:2), logourl: "https://www.100knots.com/wp-content/uploads/2021/09/air-india-logo-1024x836.png", plane:"Boeing 747"),
  Flights(dest_from: 'Mumbai', dest_to: 'Bangalore', fly_date: DateTime.now().add(Duration(days: 13)), roundtrip: true, fly_dur: Duration(hours:1,minutes: 30),logourl: "https://guidetoinvest.in/wp-content/uploads/2022/02/indigo-logo-EDBB4B3C09-seeklogo.com_.png",plane:"Beechcraft 1900"),
  Flights(dest_from: 'Mumbai', dest_to: 'Dubai', fly_date: DateTime.now().add(Duration(days: 5)), roundtrip: false, fly_dur: Duration(hours:3),logourl: "https://seekvectorlogo.com/wp-content/uploads/2018/05/qatar-airways-vector-logo.png",plane:"Boeing 747"),
  Flights(dest_from: 'Mumbai', dest_to: 'Paris', fly_date: DateTime.now().add(Duration(days: 40)), roundtrip: false, fly_dur: Duration(hours:10),logourl: "https://i.pinimg.com/originals/84/54/8d/84548d6a60b88d2f2c1bd9607ffb7c76.jpg",plane:"Airbus A320"),
  Flights(dest_from: 'Mumbai', dest_to: 'Chennai', fly_date: DateTime.now().add(Duration(days: 10)), roundtrip: true, fly_dur: Duration(hours:2),logourl: "https://thetaiwantimes.com/wp-content/uploads/2021/01/SpiceJet.png",plane:"Beechcraft 1900"),
  Flights(dest_from: 'Mumbai', dest_to: 'Nagpur', fly_date: DateTime.now().add(Duration(days: 2)), roundtrip: true, fly_dur: Duration(minutes: 30),logourl: "https://www.100knots.com/wp-content/uploads/2021/09/air-india-logo-1024x836.png",plane:"Beechcraft 1900"),
  Flights(dest_from: 'Mumbai', dest_to: 'Kolkata', fly_date: DateTime.now().add(Duration(days: 25)), roundtrip: false, fly_dur: Duration(hours:3),logourl: "https://www.100knots.com/wp-content/uploads/2021/09/air-india-logo-1024x836.png",plane:"Boeing 747"),
  Flights(dest_from: 'Mumbai', dest_to: 'Amsterdam', fly_date: DateTime.now().add(Duration(days: 22)), roundtrip: false, fly_dur: Duration(hours:9),logourl: "https://pbs.twimg.com/media/B3B6A-7CUAAjarl.jpg",plane:"Boeing 747"),
  Flights(dest_from: 'Mumbai', dest_to: 'Hong-Kong', fly_date: DateTime.now().add(Duration(days: 35)), roundtrip: false, fly_dur: Duration(hours:6),logourl: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Emirates_logo.svg/1200px-Emirates_logo.svg.png",plane:"Airbus A320"),
];

String buildDate(DateTime datex) {
  Duration diff = datex.difference(DateTime.now());
  if (diff.inDays < 7) {
    return "This Week";
  }
  if (diff.inDays < 14) {
    return "Next Week";
  }
  if (diff.inDays < 30) {
    return "This Month";
  }
  if (diff.inDays < 60) {
    return "Next Month";
  }
  return "None";
}

