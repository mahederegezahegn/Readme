
import 'package:flutter/material.dart';


class favorite extends StatefulWidget {
  const favorite({super.key});

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
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
            title: const Text("favorite"),
            centerTitle: true,
          ),
          body:Column(
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
                        Icons.favorite_outline,
                        size: 60,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      Text(
                        "Favorite",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
                  ),
                ),
              ),
            

SingleChildScrollView(
  scrollDirection:Axis.vertical,
        child:Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  height: size.height * 0.6,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30)
                      ),
                  child: ListView(
                    children:const[
                      
                    ]
                  ),
                  ),
                  )
            ]
          ),
        )
      ],
        );
  }
}