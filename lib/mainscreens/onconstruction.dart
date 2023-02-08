import 'dart:async';

import 'package:flutter/material.dart';

class onconstraction extends StatefulWidget {
  const onconstraction({super.key});

  @override
  State<onconstraction> createState() => _onconstractionState();
}

class _onconstractionState extends State<onconstraction> {
    bool login=false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:3),(){
      Navigator.pop(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/mark.jpg"),
          fit: BoxFit.fill,

        ),
      ),
      child: Scaffold(
      backgroundColor:Colors.transparent,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 220),
        child: Center(
          child:Column(
            children:[
                Image.asset("assets/images/onconstraction.jpg",height: 200,),
               const SizedBox(height: 20,),
              const Text("On Constrction",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.grey),),
                const SizedBox(height: 20,),
               const CircularProgressIndicator(
                
                  valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(96, 255, 255, 255),),
                )
            ],
          ),
        ),
      ),

    )
    );
  }
}
