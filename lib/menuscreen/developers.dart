import 'package:flutter/material.dart';


class developer extends StatefulWidget {
  const developer({super.key});

  @override
  State<developer> createState() => _developerState();
}

class _developerState extends State<developer> {
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
            title: const Text("Developer"),
            centerTitle: true,
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  Icons.group,
                  size: 60,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                Text(
                  "Developers",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ]),
            ),
          ),
              ),
              Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric( vertical: 10),
          height: size.height * 0.6,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            person(
              id: "1203619",
              name: "mahedere gzahegn",
              image: "ASD.jpg",
              size: size,
            ),
             person(
              id: "1203684",
              name: "Semir Ebrahim ",
              image: "wer.jpg",
              size: size,
            ),
             person(
              id: "1203666",
              name: "nebiyu liul",
              image: "bdg (3).jpg",
              size: size,
            ),

          ]),
              ),
            ]),
         // drawer: const NavigationDrwer(),
        )
      ],
    );
  }
}

class person extends StatelessWidget {
  final String name;
  final String image;
  final String id;
  const person({
    Key? key,
    required this.size,
    required this.name,
    required this.image,
    required this.id,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
     padding: EdgeInsets.symmetric(horizontal: 20),
     margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/"+image,
            width: 100,
            height: 100,
          ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
              Text(name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              Text(id),
            ],)
        ],
      ),
    );
  }
}
