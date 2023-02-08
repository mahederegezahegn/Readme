import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:readme/loginpage/utitls.dart';
import 'package:readme/loginpage/utitls.dart';
import 'loginpage/utitls.dart';
import 'loginpage/utitls.dart';
import 'mainscreens/firsr_screen.dart';
import 'loginpage/login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
    runApp(MyApp());
  }
final navigatorKey=GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //scaffoldMessengerKey:Utils.message,
      navigatorKey:navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(159, 133, 133, 133),
        primarySwatch: Colors.blueGrey,
      ),
      home:  SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    bool login=false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:5),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) =>tosignup())));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 63, 56, 56),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 220),
        child: Center(
          child:Column(
            children:[
                Image.asset("assets/images/icons8-medium-old-480.png",height: 200,),
               const SizedBox(height: 20,),
              const Text("README",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.grey),),
                const SizedBox(height: 20,),
               const CircularProgressIndicator(
                
                  valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(96, 255, 255, 255),),
                )
            ],
          ),
        ),
      ),

    );
  }
}

class tosignup extends StatelessWidget {
  const tosignup({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:StreamBuilder<User?>(stream:FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){
if(snapshot.connectionState==ConnectionState.waiting){
  return Center(child:CircularProgressIndicator());
}
else if(snapshot.hasError){
  return Center(child:Text("somthing went wrong")); 
}
 else if(snapshot.hasData){ 
            return bookstore();
          }
 else{
          return LoginPage();
          }
        })
    );
    
    }
    }
class inputcs extends StatefulWidget {
  const inputcs({super.key});

  @override
  State<inputcs> createState() => _inputcsState();
}

class _inputcsState extends State<inputcs> {
    bool login=false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) =>bookstore())));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 63, 56, 56),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 220),
        child: Center(
          child:Column(
            children:[
                Image.asset("assets/images/icons8-medium-old-480.png",height: 200,),
               const SizedBox(height: 20,),
              const Text("README",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.grey),),
                const SizedBox(height: 20,),
               const CircularProgressIndicator(
                
                  valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(96, 255, 255, 255),),
                )
            ],
          ),
        ),
      ),

    );
  }
}

