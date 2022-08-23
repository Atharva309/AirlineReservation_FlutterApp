import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Layouts/places_expanded.dart';



class Choice_air {
  const Choice_air({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice_air> choices_air = <Choice_air>[
  Choice_air(title: 'Attractive Offers', icon: Icons.attach_money),
  Choice_air(title: 'Free Cancellations', icon: Icons.free_cancellation),
  Choice_air(title: 'Special Discounts', icon: Icons.discount),
  Choice_air(title: 'Earn Bonuses', icon: Icons.add_chart),
  Choice_air(title: 'Special Safety\nMeasures', icon: Icons.health_and_safety),
  Choice_air(title: 'Great Ratings', icon: Icons.auto_graph),
];

class Card_air extends StatelessWidget {
  const Card_air({Key? key,required this.choice}) : super(key: key);
  final Choice_air choice;

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
      color: Colors.grey[200],
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child:ClipRRect(
        borderRadius: const BorderRadius.all (Radius.circular(15.0)),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const NetworkImage("https://htmlcolorcodes.com/assets/images/html-color-codes-color-tutorials-hero.jpg"),
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.lighten),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(0,0,0,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                choice.icon,
                color: Colors.blueAccent,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(choice.title, textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 10.0,
                    color:  Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class Choice_places {
  const Choice_places( {required this.title, required this.imgurl,required this.def,});
  final String title;
  final String imgurl;
  final String def;
}

List<Choice_places> choices_place = const <Choice_places>[
  Choice_places(title: 'Dubai', imgurl:"https://i.natgeofe.com/n/f3d0b742-5bef-4665-87e8-61ef82a0101c/dubai-travel_square.jpg",
      def:"Dubai is a city and emirate in the United Arab Emirates known for luxury shopping, ultramodern architecture and a lively nightlife scene. Burj Khalifa, an 830m-tall tower, dominates the skyscraper-filled skyline. At its foot lies Dubai Fountain, with jets and lights choreographed to music. On artificial islands just offshore is Atlantis, The Palm, a resort with water and marine-animal parks."
  ),
  Choice_places(title: 'Paris', imgurl:"https://www.travelandleisure.com/thmb/Olylzl0cReD6hco2rg3GT-oGy0o=/1000x1000/smart/filters:no_upscale()/eiffel-tower-paris-france-EIFFEL0217-6ccc3553e98946f18c893018d5b42bde.jpg",
      def:"Paris, capital of France, is one of the most important and influential cities in the world. In terms of tourism, Paris is the second most visited city in Europe after London. In this travel guide, you’ll find out about the city’s top attractions, as well as useful travel advice on how to get to Paris and how to save money whilst traveling."
  ),
  Choice_places(title: 'Amsterdam', imgurl:"https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Amsterdam_Zentrum_20091106_075.JPG/1200px-Amsterdam_Zentrum_20091106_075.JPG",
      def:"Amsterdam is packed with cobbled streets and hidden gems that are a treat for the eyes and your soul. The sky touching skyscrapers, historical architectures and mystical canals titillate your senses in more than one way. It is dotted with various attractions like museums, parks, architectural marvels, and theatres."
  ),
  Choice_places(title: 'Hong-Kong', imgurl:"https://static01.nyt.com/images/2020/06/03/world/03hongkong-damages-1/03hongkong-damages-1-videoSixteenByNineJumbo1600.jpg",
      def:"Hong Kong is known the world over as a glamorous city and a top choice for luxury shopping. But this city-state is steeped in culture and history, and has a lot more to offer than mouthwatering dim sum and an impressive skyline"
  ),
  Choice_places(title: 'Dehli', imgurl:"https://www.travelandleisure.com/thmb/G-Sw3PHlsEHT8-_mRSXz-Yf-YUo=/1200x1200/smart/filters:no_upscale()/new-delhi-india-NEWDELHITG0721-60d592e1603349298a0206d67d08582b.jpg",
      def:"Delhi, for all the right reasons, is the national capital of incredible India. Synonymous with diversity, Delhi has always been the epicentre of all activities in India which is reflected in its tourism."
  ),
  Choice_places(title: 'Bangalore', imgurl:"https://static.toiimg.com/photo/54559212.cms",
      def:"Bangalore is known as the Silicon Valley of India because of its position as the nation's leading IT exporter. A demographically diverse city, Bangalore is a major economic and cultural hub and the fastest growing major metropolis in India"
  ),
  Choice_places(title: 'Kolkata', imgurl:"https://psgroup.in/blog/wp-content/uploads/2019/01/Kolkata_City_skyline_from_Hoogly_bridge.jpg",
      def:"Kolkata is a city of colonial architecture, museums, art galleries, traditional food, temples, music and theatre. It is an amalgamation of traditional and modern. It is famous for its theatre and films. It is the land of Rabindranath Tagore and the sound of Rabindra Sangeet can be heard from every house."
  ),
  Choice_places(title: 'Chennai', imgurl:"https://www.holidify.com/images/bgImages/CHENNAI%20.jpg",
      def:"Home to temples, dosa and beaches, it is also a place where history has been made. Here are 10 things unique to wonderful Chennai. Chennai has many beautiful beaches — Besant Nagar, Thiruvanmiyur, Covelong and more. However, the Marina Beach gains prominence as it is the world's second largest urban beach."
  ),
];


class Card_place extends StatefulWidget {
  const Card_place({Key? key, required this.choice1, }) : super(key: key);
  final Choice_places choice1;

  @override
  State<Card_place> createState() => _Card_placeState();
}

class _Card_placeState extends State<Card_place> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet<void>(
            context: context,
            // isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(35.0),
              ),
            ),
            // isScrollControlled: true,
            builder: (BuildContext context) {
              return PlacesExpanded(place: widget.choice1.title, def: widget.choice1.def, url: widget.choice1.imgurl,);
            });
      },
      child: Card(
        margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
        color: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child:ClipRRect(
          borderRadius: const BorderRadius.all (Radius.circular(15.0)),
          child: SizedBox(
            width: 150,
            height: 150,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.choice1.imgurl),
                  // colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.lighten),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    const SizedBox(width: 10,),
                    Text(widget.choice1.title, textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 20.0,
                        color:  Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
