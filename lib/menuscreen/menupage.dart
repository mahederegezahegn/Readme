import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:readme/menuscreen/setting.dart';
import '../mainscreens/firsr_screen.dart';
import '../mainscreens/onconstruction.dart';
import 'developers.dart';
import 'favorite.dart';

class NavigationDrwer extends StatefulWidget {
  const NavigationDrwer({super.key});

  @override
  State<NavigationDrwer> createState() => _NavigationDrwerState();
}

class _NavigationDrwerState extends State<NavigationDrwer> {
  bool dark = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user=FirebaseAuth.instance.currentUser;
    return  Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 153, 142, 142), Color.fromARGB(60, 26, 16, 16)])),
          child:Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            width: size.width * 1,
            height: size.height * 0.4,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/book.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(125, 0, 0, 0), BlendMode.darken),
                ),
                color: Color.fromARGB(153, 53, 46, 46)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: CircleAvatar(
                    radius: size.width * 0.14,
                    backgroundColor: Colors.grey.withOpacity(0.7),
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Column(
                    children: [
                      Center(
                        child: Text(
                          "User Name",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Center(
                        child: Text(
                          user!.email!,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ]),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Container(
            child: ListTile(
              leading: Icon(
                Icons.home,
                size: 40,
                color: dark ? Colors.black : Colors.white,
              ),
              title: Text(
                "Home",
                style: dark
                    ? TextStyle(color: Color.fromARGB(255, 0, 0, 0))
                    : TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              onTap: (() {
                setState(() {
                  Navigator.push(context, _tomain());
                });
              }),
            ),
          ),
          Divider(
            height: 4,
            color: Colors.black,
          ),
          Container(
            child: ListTile(
              leading: Icon(
                Icons.favorite_outline,
                size: 40,
                color: dark ? Colors.black : Colors.white,
              ),
              title: Text(
                "Favorite",
                style: dark
                    ? TextStyle(color: Color.fromARGB(255, 0, 0, 0))
                    : TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              onTap: (() {
                setState(() {
                  Navigator.push(context, _tofavorit());
                });
              }),
            ),
          ),
          Divider(
            height: 4,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(
              Icons.settings_outlined,
              size: 40,
              color: dark ? Colors.black : Colors.white,
            ),
            title: Text(
              "setting",
              style: dark
                  ? TextStyle(color: Color.fromARGB(255, 0, 0, 0))
                  : TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            onTap: (() {
              setState(() {
                Navigator.push(context, _tosetting());
              });
            }),
          ),
          Divider(
            height: 4,
            color: Colors.black,
          ),
          Container(
            child: ListTile(
              leading: Icon(
                Icons.person,
                size: 40,
                color: dark ? Colors.black : Colors.white,
              ),
              title: Text(
                "developers",
                style: dark
                    ? TextStyle(color: Color.fromARGB(255, 0, 0, 0))
                    : TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
              onTap: (() {
                setState(() {
                  Navigator.push(context, _todeveloper());
                });
              }),
            ),
          ),
          Divider(
            height: 4,
            color: Colors.black,
          ),
          SizedBox(height: 200,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Rebuni Book Store for android",
                    style: dark
                        ? TextStyle(color: Color.fromARGB(255, 0, 0, 0))
                        : TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  Text(
                    "v11.0.2",
                    style: dark
                        ? TextStyle(color: Color.fromARGB(255, 0, 0, 0))
                        : TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  )
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}



              
Route _tomain() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => bookstore(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset(0, 0);
        const curve = Curves.easeIn;
        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final animatedoffset = animation.drive(tween);
        return SlideTransition(
          position: animatedoffset,
          child: child,
        );
      });
}

Route _tosetting() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => setting(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 1);
        const end = Offset(0, 0);
        const curve = Curves.easeIn;
        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final animatedoffset = animation.drive(tween);
        return SlideTransition(
          position: animatedoffset,
          child: child,
        );
      });
}

Route _tofavorit() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => onconstraction(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1, 0);
        const end = Offset(0, 0);
        const curve = Curves.easeIn;
        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final animatedoffset = animation.drive(tween);
        return SlideTransition(
          position: animatedoffset,
          child: child,
        );
      });
}

Route _todeveloper() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => developer(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
        const end = Offset(0, 0);
        const curve = Curves.easeIn;
        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final animatedoffset = animation.drive(tween);
        return SlideTransition(
          position: animatedoffset,
          child: child,
        );
      });
}

class menupage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationDrwer();
  }
}
