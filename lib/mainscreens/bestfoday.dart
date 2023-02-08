
import 'package:flutter/material.dart';

import 'onconstruction.dart';

class bestofday extends StatelessWidget {
  final String name;
  final String title;
  final String author;
  final String rate;
  final String number;
  const bestofday({
    Key? key,
    required this.size,
    required this.name,
    required this.title,
    required this.author,
    required this.rate,
    required this.number,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 1.03,
      height: 180,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: size.width * 8,
        height: 170,
        decoration: BoxDecoration(
           border: Border.all(color:Color.fromARGB(147, 0, 0, 0),width: 5),
            color: Color.fromARGB(182, 65, 50, 50),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Container(
              width: size.width * .6,
              padding: EdgeInsets.only(left: 13),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      "New york TImes best of 18 febrary 2023",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          number + ") ",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 236, 236, 236)),
                        ),
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 166, 166, 166)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Author:" + author,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                        const Icon(
                          Icons.star_outline,
                          size: 25,
                          color: Colors.yellow,
                        ),
                        Text(
                          rate,
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                    name,
                  width: 60,
                ),
                InkWell(
                  onTap:(){
                   Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => onconstraction()
                                ));
                  },
                  child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 95, 43, 27),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Text(
                        "Buy Now",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
