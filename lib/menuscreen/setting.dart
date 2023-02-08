import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../loginpage/login_page.dart';
import '../main.dart';
import '../mainscreens/onconstruction.dart';
import 'menupage.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/ASD.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(125, 0, 0, 0), BlendMode.darken),
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Setting"),
            centerTitle: true,
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: size.height * 0.2,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30),
                      
                        ),
                    child: Center(
                      child: Column(children: const [
                        SizedBox(
                          height: 30,
                        ),
                        Icon(
                          Icons.settings_outlined,
                          size: 60,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        Text(
                          "Setting",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ),
                  ),
                ),
                InkWell( onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>onconstraction())),
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      height: size.height * 0.6,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(30)
                          ),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                       Container(
                      height: size.height*0.1,
                      padding: EdgeInsets.symmetric(horizontal: 20,),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children:const [Icon(Icons.person,size: 30,
                            color: Color.fromARGB(255, 255, 255, 255),),SizedBox(width:30), Text("USER",
                            style:TextStyle(fontSize:20,fontWeight:FontWeight.w500))],
                        ),
                      ),
                      
                      InkWell( onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>onconstraction())),
                        child: Container(
                        height: size.height*0.1,
                        padding: EdgeInsets.symmetric(horizontal: 20,),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [Icon(Icons.analytics,size: 30,
                              color: Color.fromARGB(255, 255, 255, 255),),SizedBox(width:30), Text("Analys",
                              style:TextStyle(fontSize:20,fontWeight:FontWeight.w500))],
                          ),
                        ),
                      ),
                        InkWell( onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>onconstraction())),
                          child: Container(
                              height: size.height*0.1,
                              padding: EdgeInsets.symmetric(horizontal: 20,),
                              decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [Icon(Icons.privacy_tip,size: 30,
                              color: Color.fromARGB(255, 255, 255, 255),),SizedBox(width:30), Text("Privay",
                              style:TextStyle(fontSize:20,fontWeight:FontWeight.w500))],
                          ),
                              ),
                        ),
                      
                      InkWell(
                         onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>onconstraction())),
                        child: Container(
                        height: size.height*0.1,
                        padding: EdgeInsets.symmetric(horizontal: 20,),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [Icon(Icons.report_gmailerrorred,size: 30,
                              color: Color.fromARGB(255, 255, 255, 255),),SizedBox(width:30), Text("Report",
                              style:TextStyle(fontSize:20,fontWeight:FontWeight.w500))],
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () =>signout(),
                  child: Container(
                        height: size.height*0.1,
                        padding: EdgeInsets.symmetric(horizontal: 20,),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children:const [
                              Icon(Icons.logout_outlined,size: 30,
                              color: Color.fromARGB(255, 128, 39, 39)),SizedBox(width:30), Text("LogOut",
                              style:TextStyle(fontSize:20,fontWeight:FontWeight.w500))],
                          ),
                        ),
                      ),
                    
                        ],
                      )),
                )
              ],
            ),
          ),
       //   drawer: const NavigationDrwer(),
        ),
      ],
    );
  }
  
 void signout() {
  
  FirebaseAuth.instance.signOut();
  Navigator.push(context ,MaterialPageRoute
  (builder: ((context) =>const LoginPage())));
 }

}

