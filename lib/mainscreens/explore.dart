import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'onconstruction.dart';
import 'api.dart';

class explore extends StatelessWidget {
  explore({super.key});
 TextEditingController textController=TextEditingController();
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


                Container(
                  height: 50,
                  
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Explore",style: TextStyle(fontSize: 20,color: Colors.white),),
                      AnimSearchBar(
                        width: size.width*.7,
                         textController:textController,
                        onSuffixTap:(){
                        },
                        color: Colors.blueGrey,
                      
                        helpText: "Search",
                        closeSearchOnSuffixTap: true,
                        animationDurationInMilli: 2000,
                        rtl: true, onSubmitted: (String ) {  },
                        ),
                    ],
                  ),
                ),
              Container(
                height: size.height * 0.2,
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration:
                    BoxDecoration(color: Color.fromARGB(97, 255, 255, 255)),
                child: ImageSlideshow(
                  width: double.infinity,
                  height: 200,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    for (int i = 0; i < top3.length; i++)
                      Container(
                        decoration:  BoxDecoration(
                             image: DecorationImage(
                                  image: AssetImage(cover[i]),
                                  fit: BoxFit.cover),            
                             ),
                        child: Row(children: [
                          Container  (
                           width: size.width * 0.6,
                           padding: EdgeInsets.only(left: 30),
                            decoration:
                                const BoxDecoration(color: Colors.transparent),
                           child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    list[2],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(246, 0, 0, 0)),
                                  ),
                                  
                                     Row( mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        for (int i = 0; i < 3; i++)
                                          Icon(Icons.star,
                                              size: 15,
                                              color: Colors.amberAccent[100]),
                                        Icon(Icons.star, size: 15)
                                      ],
                                    ),
                                  
                                  ElevatedButton(
                                      onPressed: () {}, child: Text("Buy Now"))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin:const EdgeInsets.symmetric(vertical: 5),
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(top3[i]),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ]),
                      )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < list.length; i++) links(i),
                      ]),
                ),
              ),
              
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     bookshelf1(size),
                      bookshelf2(size),
                       bookshelf3(size),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

SizedBox bookshelf1(Size size) {
    return SizedBox(
      height: size.height * 0.5,
      width: size.width * 0.45,
      child: ListView.builder(
        itemCount: image1.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(height: size.height*0.3,
                            width: size.width * 0.2,
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical:10),
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                            child: Column(children: [

                              Container(
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(image11[index]),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Center(
                                child: Text(
                                  name1[index],
                                  style: TextStyle( color: Colors.white,
                                      fontSize: 12),
                                ),
                              ),
                               Row( mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for (int i = 0; i < 3; i++)
                                          Icon(Icons.star,
                                              size: 15,
                                              color: Colors.amberAccent[100]),
                                        Icon(Icons.star_border, size: 15,color:Colors.white),
                                      ],
                                    ),
                                    ElevatedButton(onPressed: (){
                                      
                
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => onconstraction()
                                ));
                  },
                                    
                                     child:Text("OREDR NOw"))
                            ]),
                          );
        },
      ),
    );
}
SizedBox bookshelf2(Size size) {
    return SizedBox(
      height: size.height * 0.5,
      width: size.width * 0.45,
      child: ListView.builder(
        itemCount: image2.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(height: size.height*0.3,
                            width: size.width * 0.2,
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical:10),
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                            child: Column(children: [
                              Container(
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(image21[index]),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Center(
                                child: Text(
                                  name2[index],
                                  style: TextStyle( color: Colors.white,
                                      fontSize: 12),
                                ),
                              ),
                               Row( mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for (int i = 0; i < 3; i++)
                                          Icon(Icons.star,
                                              size: 15,
                                              color: Colors.amberAccent[100]),
                                        Icon(Icons.star_border, size: 15,color:Colors.white),
                                      ],
                                    ),
                                         ElevatedButton(onPressed: (){
                                      
                
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => onconstraction()
                                ));
                  },
                                  child:Text("OREDR NOw"))
                            ]),
                          );
        },
      ),
    );
}
SizedBox bookshelf3(Size size) {
    return SizedBox(
      height: size.height * 0.5,
      width: size.width * 0.45,
      child: ListView.builder(
        itemCount: image3.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(height: size.height*0.3,
                            width: size.width * 0.2,
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical:10),
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(20),
                              color: Colors.black,
                            ),
                            child: Column(children: [

                              Container(
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(image3[index]),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Center(
                                child: Text(
                                  name3[index],
                                  style: TextStyle( color: Colors.white,
                                      fontSize: 12),
                                ),
                              ),
                               Row( mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        for (int i = 0; i < 3; i++)
                                          Icon(Icons.star,
                                              size: 15,
                                              color: Colors.amberAccent[100]),
                                        Icon(Icons.star_border, size: 15,color:Colors.white),
                                      ],
                                    ),
                                         ElevatedButton(onPressed: (){
                                      
                
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => onconstraction()
                                ));
                  },
                                   child:Text("OREDR NOw"))
                            ]),
                          );
        },
      ),
    );
}
  

  Container links(int i) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      
      decoration: BoxDecoration(
        color: i==0? Colors.amber[400]:Colors.transparent,
        border: Border.all(color:Colors.white,width: 2)),
      child: Center(
        child: Text(list[i],
              style:  TextStyle(
                fontSize: 20,
                color:i==0? Colors.black:Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold
              )
        ),
      ),
    );
  }
}
