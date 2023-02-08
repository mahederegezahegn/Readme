import 'package:flutter/material.dart';
import 'onconstruction.dart';
import 'api.dart';

class commingsoon extends StatefulWidget {
  const commingsoon({super.key});

  @override
  State<commingsoon> createState() => _commingsoonState();
}

class _commingsoonState extends State<commingsoon> {
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/main.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Color.fromARGB(125, 0, 0, 0), BlendMode.darken),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Explore What you Want to read",
                  style: TextStyle(
                      fontSize: 40, color: Color.fromARGB(162, 214, 201, 201)),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: InkWell(
                  onTap:(){
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => onconstraction()
                                ));
                  },
                                  
                  child: Container(
                    height: size.height * 0.2,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(0, 255, 255, 255),
                    ),
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < reading.length; i++)
                            Container(
                              width: size.width * 0.32,
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                
                      borderRadius:BorderRadius.circular(20),
                                color: Color.fromARGB(255, 35, 35, 35),
                              ),
                              child: Column(children: [
                                Container(
                                  height: size.height * 0.15,
                                  decoration: BoxDecoration(
                                    
                      borderRadius:BorderRadius.only( topLeft:
                                        Radius.circular(20),
                                        topRight:
                                        Radius.circular(20),
                                        ),
                                    image: DecorationImage(
                                        image: AssetImage(reading[i]),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    readingtitle[i],
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 17),
                                  ),
                                )
                              ]),
                            ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            width: size.width * 0.32,
                            decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(20),
                                border: Border.all(
                              color: Color.fromARGB(255, 241, 241, 241),
                              width: 1.0,
                              style: BorderStyle.solid,
                              strokeAlign: StrokeAlign.inside,
                            )),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  Text("Discover ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 15))
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Whish List Books",
                  style: TextStyle( 
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     column1(size),
                     column2(size),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox column1(Size size) {
    return SizedBox(
      height: size.height * 0.4,
      width: size.width * 0.5,
      child: ListView.builder(
        itemCount: image1.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 150,
            width: size.width * 0.6,
            margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
            decoration:
                BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                  color: Color.fromARGB(255, 70, 70, 68)),
            child: Row(children: [
              Container(
                width: size.width * 0.22,
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(image1[index]), fit: BoxFit.cover)),
              ),
              Container(
                width: size.width * 0.23,
                margin: EdgeInsets.symmetric(
                  vertical: 12,
                ),
                decoration: BoxDecoration(
               
                    color: Colors.transparent),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        
                         Container(
                        height: 60,
                     
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                        Text(title1[index],style: TextStyle(fontSize: 12,color:Colors.white),)
                      ],),
                      ),
                      Row(children: [
                       for(int i=0;i<3;i++) Icon(Icons.star,size: 15,color:Colors.amberAccent[100]),
                       Icon(Icons.star,size: 15)
                      ],),
                      Container(
                        height: 50,
                        child:Column(
                          children: [
                          //  Text(title[0]),
                                 ElevatedButton(onPressed: (){
                                      
                
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => onconstraction()
                                ));
                  },
                                   child: Text("OPEN",style: TextStyle(fontSize: 12),))
                          ],
                        )
                        ),
                     
                    ]),
              ),
            ]),
          );
        },
      ),
    );
  }

  SizedBox column2(Size size) {
    return SizedBox(
      height: size.height * 0.4,
      width: size.width * 0.5,
      child: ListView.builder(
        itemCount: image2.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(

            height: 150,
            width: size.width * 0.6,
            margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
            decoration:
           
                BoxDecoration(
                   borderRadius:BorderRadius.circular(20),
                  color: Color.fromARGB(255, 70, 70, 68)),
            child: Row(children: [
              Container(
                
                width: size.width * 0.22,
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(image2[index]), fit: BoxFit.cover)),
              ),
              Container(
                width: size.width * 0.23,
                margin: EdgeInsets.symmetric(
                  vertical: 12,
                ),
                decoration: BoxDecoration(
               
                    color: Colors.transparent),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        
                         Container(
                        height: 60,
                     
                      child: Column(children: [
                        Text(title2[index],style: TextStyle(fontSize: 12,color:Colors.white),)
                      ],),
                      ),
                      Row(children: [
                       for(int i=0;i<3;i++) Icon(Icons.star,size: 15,color:Colors.amberAccent[100]),
                       Icon(Icons.star,size: 15)
                      ],),
                      SizedBox(
                        height: 50,
                        child:Column(
                          children: [
                          //  Text(title[0]),
                                ElevatedButton(onPressed: (){
                                      
                
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => onconstraction()
                                ));
                  },
                                   child: Text("OPEN",style: TextStyle(fontSize: 12),))
                          ],
                        )
                        ),
                     
                    ]),
              ),
            ]),
          );
        },
      ),
    );
  }
}




