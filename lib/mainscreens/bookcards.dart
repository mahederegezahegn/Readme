import 'package:flutter/material.dart';

import 'onconstruction.dart';

class detail extends StatelessWidget {
  detail({
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
  List<String> Detail = [
    "Book Lovers is Emily Henrys newest bookish summer beach read, and it delivers on everything it promises to be. Summery, romantic, fun, and with endearingly bookish characters — theres a lot to like about Henrys latest release.\nIn Book Lovers, Nora Stephens is a workaholic, cutthroat literary agent living in New York who is dragged into a monthlong trip to the picturesque small town of Sunshine Falls, North Carolina by her younger sister. Nora is very familiar with all the tropes about small town transformations and rom-coms featuring protagonists giving it all up for a simpler life, but Nora likes her life and job in New York.",
    "After suddenly losing her father in 2004, Rhonda Byrnes life fell into turmoil. Her relationships with colleagues and loved ones frayed, and she became increasingly despondent. However, during this period of soul-searching and self-inquiry, she discovered what she refers to as “The Secret” to life. By tracing its origins throughout history, she realized that the worlds greatest thinkers, from Plato and Shakespeare, to Edison and Einstein, all knew The Secret, and it was the key to their success. \nAcross nearly all religious thought and as testified by some of the greatest thinkers of our time, the law of attraction is said to be the most powerful law in the universe. Its a law that began at the beginning of time and that determines the order of things within the universe. It forms your life experience – and it does so, Byrne believes, through your thoughts.",
    "Feeling powerless is a miserable experience. If given the choice, everyone would opt for more rather than less power. Yet, to be so overt in attempts to gain power is frowned upon. To attain power, you need to be subtle, cunning, and democratic yet devious. Consequently, in his controversial book, “The 48 Laws of Power,” best-selling author Robert Greene argues that if you manage to seduce, charm, and deceive your opponents, you will attain the ultimate power. ",

"Greene states that the better you become at handing power, the better friend, lover, and person you will become. This is because you learn how to make others feel good about themselves,  which makes them dependent on you as a source of great pleasure to be around.",
    "Elena Armas literary career took off when her debut novel, The Spanish Love Deception (2021), became a New York Times Bestseller. The romance novel acquired 100 million views on BookTok, received the 2021 Goodreads Choice Award for Best Debut Novel, and accepted a bid from BCDF Picture for motion picture rights. The story follows the stormy relationship of Catalina “Lina” Martín, a small-town girl from Spain, and Aaron Blackford, a former star athlete from Seattle, who work as mid-management colleagues at a New York City engineering firm. Lina must return to Spain to serve as the maid of honor in her sister’s wedding. Circumstances dictate she must bring an American boyfriend and the only volunteer is the aloof Aaron, whom she calls “Mr. Robot.” Armas understands the backdrop of the story as she is a chemical engineer from Spain and a lifelong lover of romance. Though written in English, the story also contains occasional uses of Spanish words and phrases.",
    "The Martin is a 2011 Science fiction debut novel written by Andy Weir The Book was originally selg published on Weir's Blog in a serialized format, \n The martin tells the story of Mark Watney an astronaut on the Area 3 mission to Mars .after a terrible storm almoost destoys the ship and the base the crew of his ship believe he is dead ,Alone on the red planet he has to survive until the next mission to Mars arrives",
  ];
  List <String> price=[
    
    "77.0 USD",
    "59.0 USD",
    "19.9 USD",
    "17.99 USD",
    "19.99 USD",


  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(color: Color.fromARGB(66, 0, 0, 0)),
        child: Scaffold(
            body:  SingleChildScrollView
                   (
                   scrollDirection:Axis.vertical,
                    child: Container(
                      padding:EdgeInsets.only(bottom:40),
                      decoration: const BoxDecoration(
              //color: Colors.black26
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(195, 32, 31, 31),
                  Color.fromARGB(234, 0, 0, 0),
                ],
              ),
                      ),
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               
              children: [
                      SizedBox(height:50),
                Container(
                  
                  padding: EdgeInsets.symmetric(horizontal:20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:const Icon(Icons.arrow_back_ios,
                            size: 30, color: Colors.white),
                      ),
                      
                     const Icon(Icons.bookmark, size: 30, color: Colors.white),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.6,
                  padding:const EdgeInsets.only(top: 40, left: 10, right: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image[i]), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Center(
                  child: Text(
                    name[i],
                    style:const TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    Text(author[i],
                        style:const TextStyle(color: Colors.white, fontSize: 20)),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      for (int i = 0; i < 3; i++)
                        Icon(Icons.stars, color: Colors.yellow),
                      Icon(Icons.stars, color: Colors.white),
                    ]),
                    Container(
                        padding:EdgeInsets.symmetric(horizontal:10),
                        child: Text(
                          Detail[i],
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    
                    Container(
                      
          padding: EdgeInsets.symmetric(vertical: 12),
                      child:Row( crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                        
                        children:[
                          ElevatedButton(onPressed: (){
                                      
                
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => onconstraction()
                                ));
                  },
                                   child: Text("Rent Now 2.99")),
                                    ElevatedButton(onPressed: (){
                                      
                
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => onconstraction()
                                ));
                  },
                                   child: Text(" Buy now "+price[i])),        
                      ])
                    )
                  ],
                )
              ],
                      ),
                    ),
            )));
  }
}

class rating extends StatefulWidget {
  const rating(String rate, {super.key});
  @override
  State<rating> createState() => _ratingState();
}

class _ratingState extends State<rating> {
  @override
  int n = 0;
  bool link = false;
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                n++;
                if (n % 2 == 0) {
                  link = false;
                } else {
                  link = true;
                }
              });
            },
            child: Icon(
              Icons.favorite_outline,
              size: 25,
            )),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 23,
                  color: Colors.white.withOpacity(0.2),
                ),
              ]),
          child: Column(
            children: [
              GestureDetector(
                child: Icon(
                  Icons.star,
                  size: 25,
                  color: link ? Colors.yellow : Colors.transparent,
                ),
              ),
              Text(
                '9.3',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
