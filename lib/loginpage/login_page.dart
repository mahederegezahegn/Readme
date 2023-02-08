import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'createacc.dart';
import '../mainscreens/firsr_screen.dart';
import 'forgetpass.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool ischeck = false;

  set login(bool login) {}
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void disposed() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bookcover.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(137, 0, 0, 0), BlendMode.darken),
            ),
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                const Flexible(
                  child: Center(
                    child: Text(
                      "README",
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.08,
                  width: size.width * 0.8,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.mail,
                        size: 26,
                        color: Colors.white,
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 39, 29, 29)),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.08,
                  width: size.width * 0.8,
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.password,
                        size: 26,
                        color: Colors.white,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 68, 59, 59)),
                    ),
                    obscureText: true,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, _forgetpss()),
                  child: Container(
                      margin: EdgeInsets.only(left: 90),
                      child: Text(
                        "Forget Password ? ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(height: 29),
                Container(
                  height: size.height * 0.06,
                  width: size.width * 0.8,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.blueAccent),
                  child: ElevatedButton(
                    onPressed: signin,
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
               GestureDetector(
                  onTap: () => Navigator.push(context, _createRoute()),
                  child: RichText(
                              text: const TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    children: [
                      TextSpan(
                        text: "No Account?",
                      ),
                      TextSpan(
                          text: " SignUp",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.brown))
                    ]),
                            ),
                ),
                // GestureDetector(
                //   onTap: () => Navigator.push(context, _createRoute()),
                //   child: Container(
                //     decoration:const BoxDecoration(
                //       border: Border(
                //         bottom: BorderSide(width: 1, color: Colors.white),
                //       ),
                //     ),
                //     child: const Text(
                //       "Create Account",
                //       style: TextStyle(
                //         fontSize: 20,
                //         color: Color.fromARGB(255, 255, 255, 255),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 70,
                )
              ],
            )),
      ],
    );
  }

  // ignore: empty_catches
  Future signin() async {
    showDialog(
        builder: (BuildContext context) =>
          const  Center(child: CircularProgressIndicator()),
        context: context);
try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );}
    on FirebaseAuthException catch(e)
    {
      print(e);

    }
  navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }
  // ignore: empty_constructor_bodies
  // navigatorKey.currentState!.popUntil((route)=>route.isfirst);
  
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => createacount(),
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

Route _forgetpss() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => frgpsw(),
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


class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  bool login = false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => bookstore())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 63, 56, 56),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 220),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/images/icons8-medium-old-480.png",
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "README",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(96, 255, 255, 255),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
