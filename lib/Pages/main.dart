import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app1/Authentication/LogIn.dart';
import 'package:test_app1/Layouts/places_expanded.dart';
import '../Authentication/SignIn.dart';
import '../Lists_info/Choice_place.dart';
import 'Splash.dart';
import 'package:bordered_text/bordered_text.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:Colors.indigo[900] ,

          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only (bottomRight: Radius.circular (30), bottomLeft: Radius.circular (30))
          ),
          title: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(backgroundImage: NetworkImage('https://cdn.dribbble.com/users/60166/screenshots/11603032/media/b5785a0b8b6bc0426e1c7a761458c731.jpg?compress=1&resize=400x300'),),
                  const SizedBox(height: 10,),
                  Text(
                    'Fly With Us',
                    style: GoogleFonts.arvo(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5,),
            ],
          ),
          centerTitle: true,
          ),
      ),

      bottomNavigationBar: Container(
        color: Colors.indigo[900],
        child: Container(
          decoration: BoxDecoration(
              color: Colors.yellowAccent[100],
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(60),bottomRight: Radius.circular(60),)),
          width: double.infinity,
          height: 57,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Become a member today',
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(width:15.0),
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
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16.0,),

            Card(
              margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              color: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(

                borderRadius: const BorderRadius.all (Radius.circular(15.0)),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const NetworkImage("https://digitalsynopsis.com/wp-content/uploads/2017/07/beautiful-color-ui-gradients-backgrounds-peach.png"),
                      colorFilter: ColorFilter.mode(Colors.white60.withOpacity(0.8), BlendMode.lighten),
                      fit: BoxFit.cover,
                    ),
                  ),

                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      const Carousel(),
                      BorderedText(
                        strokeWidth: 2.0,
                        child: const Text("Get The Best Deals With Us!",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 3.0,
                          color: Colors.white,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0,),
            Row(
              children:<Widget> [
                const SizedBox(width: 16.0,),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                      'We provide',
                    style: GoogleFonts.poppins(
                      fontSize: 20,

                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0,),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(choices_air.length, (index) {
                  return Center(
                    child: Card_air(choice: choices_air[index]),
                  );
                },
                ),
            ),
            const SizedBox(height: 30.0,),
            Row(
              children:<Widget> [
                const SizedBox(width: 16.0,),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Book Your Tickets now',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0,),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogIn(),
                    ),);
                },
                child: Text(
                  " Log In",
                  style: GoogleFonts.poppins(
                      fontSize: 24, color: const Color(0xFF158998)),
                ),),
            const SizedBox(height: 30.0,),
            Row(
              children:<Widget> [
                const SizedBox(width: 16.0,),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                      'Photo Gallery',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 220,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(choices_place.length, (index) {
                    return Center(
                      child: Card_place(choice1: choices_place[index]),
                    );
                  },
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;

  List<String> images = [
    "https://images.unsplash.com/photo-1483450388369-9ed95738483c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFzc2VuZ2VyJTIwcGxhbmV8ZW58MHx8MHx8&w=1000&q=80",
    "https://images.unsplash.com/photo-1556388158-158ea5ccacbd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YWlycG9ydHxlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1540575861501-7cf05a4b125a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZpYXRpb258ZW58MHx8MHx8&w=1000&q=80"
  ];

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(images,pagePosition,active);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length,activePage))
      ],
    );
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(images[pagePosition]))),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);

      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Image.network(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}

