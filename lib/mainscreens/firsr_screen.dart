import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:readme/mainscreens/explore.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import '../menuscreen/menupage.dart';
import 'bestfoday.dart';
import 'bookcards.dart';
import 'library.dart';
import 'onconstruction.dart';
import 'api.dart';

class bookstore extends StatefulWidget {
  bookstore({
    super.key,
  });

  @override
  State<bookstore> createState() => _bookstoreState();
}

class _bookstoreState extends State<bookstore> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ZoomDrawer(
        showShadow: true,
        //  backgroundColor: Color.fromARGB(181, 44, 41, 40),
        borderRadius: 40,
        angle: -8,
        slideWidth: MediaQuery.of(context).size.width * 0.8,
        menuScreen: menupage(),
        mainScreen: mainscreen());
  }
}

class mainscreen extends StatefulWidget {
  mainscreen({
    super.key,
  });

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  List<Widget> page = [
    homepage(),
    commingsoon(),
    explore(),
  ];

  var selectedtab = Selectedtab.home;
  var currentpage = 0;
  void hadleindexchange(int i) {
    setState(() {
      selectedtab = Selectedtab.values[i];
      currentpage = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/main.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(125, 0, 0, 0), BlendMode.darken),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          appBar: AppBar(
            leading: menuwidget(),
            backgroundColor: Color.fromARGB(167, 72, 70, 70),
            title: const Text("README"),
            centerTitle: true,
          ),
          body: page[currentpage],
          bottomNavigationBar: 
             DotNavigationBar(
             backgroundColor:const Color.fromARGB(167, 72, 70, 70),
                // margin: EdgeInsets.only(left: 10, right: 10),
               
                currentIndex: Selectedtab.values.indexOf(selectedtab),
                dotIndicatorColor: Colors.black,
                unselectedItemColor:const Color.fromARGB(206, 204, 0, 20),
                onTap: hadleindexchange,
                items: [
                  DotNavigationBarItem(
                      icon:const Icon(Icons.home),
                      selectedColor:const  Color.fromARGB(217, 99, 90, 90)),
                  DotNavigationBarItem(
                      icon:const Icon(Icons.my_library_books_outlined),
                      selectedColor:const  Color.fromARGB(217, 99, 90, 90)),
                  DotNavigationBarItem(
                      icon:const Icon(Icons.explore),
                      selectedColor:const  Color.fromARGB(217, 99, 90, 90)),
                ]),
          ),
        
      ],
    );
  }
}

enum Selectedtab { home, favorite, book }

class homepage extends StatelessWidget {
  homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: RichText(
              text: const TextSpan(
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  children: [
                    TextSpan(
                      text: "What Do You \nReading",
                    ),
                    TextSpan(
                        text: " Today?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.brown))
                  ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < image.length; i++)
                    bookcards(
                        image: image,
                        i: i,
                        rate: rate,
                        name: name,
                        author: author),
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              Text(
                "Best Of The",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "Day",
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                bestofday(
                  size: size,
                  name: "assets/bookpic/book (51).jpg",
                  title: "It End With Us",
                  author: "Colleen Hoover",
                  rate: "4.8",
                  number: '1',
                ),
                bestofday(
                  size: size,
                  name: "assets/bookpic/book (50).jpg",
                  title: "It Starts With Us",
                  author: "Colleen Hoover",
                  rate: "4.7",
                  number: '2',
                ),
                bestofday(
                  size: size,
                  name: "assets/bookpic/book (27).jpg",
                  title: "Lessons In Chemistry",
                  author: "bonniw garmus",
                  rate: "4.4",
                  number: '3',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              Text(
                "Continue",
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(153, 255, 255, 255)),
              ),
              Text(
                "Reading.....",
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(153, 255, 192, 192)),
              ),
             
            ],
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
                itemCount: reading.length,
                itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap:(){
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => onconstraction()
                                ));
                  },
                                  

          
          child: Container(
                height: 80,
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                width: size.width * 0.96,
                decoration: BoxDecoration(
                    boxShadow:const [
                      BoxShadow(
                        offset: Offset(0, 13),
                        blurRadius: 23,
                        color: Color.fromARGB(111, 126, 89, 89),
                      )
                    ],
                     border: Border.all(color:Colors.black26,width: 5),
                    color:const Color.fromARGB(148, 96, 41, 41),
                    borderRadius: BorderRadius.circular(34)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(39.5),
                  child: Column(children: [
                    Expanded(
                        child: Container(
                        
                            child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:  [
                                Text(
                                  readingtitle[index],
                                  style:const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            reading[index],
                            width: 64,
                          ),
                        ],
                      ),
                    ))),
                    Container(
                      height: 9,
                      width: size.width * 0.58,
                      decoration:const  BoxDecoration(
                       
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          color: Colors.blueGrey),
                    )
                  ]),
                ),
              ),
        );
            }
            )
          )
        ],
      ),
    );
  }
}

class bookcards extends StatelessWidget {
  const bookcards({
    Key? key,
    required this.image,
    required this.i,
    required this.rate,
    required this.name,
    required this.author,
  }) : super(key: key);

  final List<String> image;
  final int i;
  final List<String> rate;
  final List<String> name;
  final List<String> author;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 10),
      height: 240,
      width: 202,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 221,
              width: 170,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 107, 107, 107),
                  borderRadius: BorderRadius.circular(30),
                     border: Border.all(color:Colors.black26,width: 5),
                  boxShadow:const [
                    BoxShadow(
                        offset: Offset(0, 6),
                        blurRadius: 5,
                        color: Colors.black)
                  ]),
            ),
          ),
          Container(
            width: 140,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(
                    image[i],
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(top: 35, right: 10, child: rating(rate[i])),
          Positioned(
            top: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: 85,
                width: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style:const TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: name[i],
                            style:const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: author[i],
                            style:const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => detail(
                                      image: image,
                                      i: i,
                                      rate: rate,
                                      name: name,
                                      author: author),
                                ));
                          },
                          child: Container(
                            width: 90,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: const Center(
                                child: Text("Detail",
                                    style: TextStyle(fontSize: 20))),
                          ),
                        ),
                        Expanded(
                          child:       GestureDetector(onTap: (){
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>const onconstraction()
                                ));
                  },
                                  
                            child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 95, 43, 27),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(15))),
                                child: const Text(
                                  "BUYNOW",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class menuwidget extends StatelessWidget {
  const menuwidget({super.key});

  @override
  Widget build(BuildContext context) => IconButton(
      icon: Icon(Icons.menu),
      onPressed: () => ZoomDrawer.of(context)!.toggle());
}
